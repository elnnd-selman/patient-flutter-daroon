import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/model/user_profile_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<UserProfileModel> userProfileModel = Rxn();
  getUserProfileData() async {
    isLoading.value = true;
    final response = await ApiService.getwithUserToken(
      endPoint: '${AppTokens.apiURl}/users/profile',
      userToken: {
        "Authorization":
            "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      },
    );

    if (response!.statusCode == 200 || response.statusCode == 201) {
      final jsonData = jsonDecode(response.body);
      userProfileModel.value = UserProfileModel.fromJson(jsonData["user"]);
    } else if (response.statusCode == 401) {
      final jsonData = jsonDecode(response.body);
      if (jsonData["message"] == "unauthorized") {
        // Get.find<UserHomeController>().signOutUser();
      }
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getUserProfileData();
  }
}
