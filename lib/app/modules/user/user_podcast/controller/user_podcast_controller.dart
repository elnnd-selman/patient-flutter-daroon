import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_presenter_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';

class UserPodcastController extends GetxController {
  RxBool processing = false.obs;
  RxList<PodCastModel> popularPodcastList = <PodCastModel>[].obs;
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

      popularPodcastList.value = List<PodCastModel>.from(
          jsonData["data"]!.map((x) => PodCastModel.fromJson(x)));

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
}