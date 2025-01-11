import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_presenter_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPodcastController extends GetxController {
  RxBool processing = false.obs;
  RxList<PodCastModel> popularVideoPodcastList = <PodCastModel>[].obs;
  final RxList<PodCastModel> _popularPodcastList = <PodCastModel>[].obs;

  RxList<PodCastModel> recentPodcastList = <PodCastModel>[].obs;

  getPodCast() async {
    processing.value = true;

    final response = await ApiService.getwithUserToken(
      endPoint: '${AppTokens.apiURl}/contents/public?contentType=podcast',
      userToken: {
        "Authorization":
            "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      },
    );
    if (response!.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);

      _popularPodcastList.value = List<PodCastModel>.from(
          jsonData["data"]!.map((x) => PodCastModel.fromJson(x)));

      for (int i = 0; i < _popularPodcastList.length; i++) {
        if (_popularPodcastList[i].type == "video") {
          popularVideoPodcastList.add(_popularPodcastList[i]);
          recentPodcastList.add(_popularPodcastList[i]);
        }
      }
      recentPodcastList.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      processing.value = false;
    }
  }

  RxBool loading = false.obs;
  RxList<UserPresenterModel> presenterList = <UserPresenterModel>[].obs;
  getPresenter() async {
    processing.value = true;

    final response = await ApiService.getwithUserToken(
      endPoint: '${AppTokens.apiURl}/presenters',
      userToken: {
        "Authorization":
            "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      },
    );
    if (response!.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);

      presenterList.value = List<UserPresenterModel>.from(
          jsonData["data"]!.map((x) => UserPresenterModel.fromJson(x)));

      processing.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getPodCast();
    getPresenter();
  }

  RxList<PodCastModel> searchPodCastModelList = <PodCastModel>[].obs;
  RxBool isSearch = false.obs;
  final searchPodTextField = TextEditingController();
  searchPodCast(String query) {
    searchPodCastModelList.value = [];
    searchPodCastModelList.value = popularVideoPodcastList
        .where((message) =>
            message.titleEn!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> refreshTopDoctor() async {
    getPodCast();
    getPresenter();
    await Future.delayed(const Duration(seconds: 2));
  }
}
