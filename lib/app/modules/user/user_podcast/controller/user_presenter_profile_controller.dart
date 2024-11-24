import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';

class UserPresenterProfileController extends GetxController {
  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;
  // RxInt currentPage = 0.obs;
  RxInt totalPages = 1.obs;
  RxBool isLoading = false.obs;
  RxBool processing = false.obs;

  void selectTab(int value) {
    _selectedTab.value = value;
  }

  setPresenterData(String presenterID) {
    getPodCast(presenterID);
  }

  RxList<PodCastModel> popularPodcastList = <PodCastModel>[].obs;
  getPodCast(String presenterID) async {
    processing.value = true;

    final response = await ApiService.getwithUserToken(
      endPoint: '${AppTokens.apiURl}/presenters/$presenterID/contents',
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
}
