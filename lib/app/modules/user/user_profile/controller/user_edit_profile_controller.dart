// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/model/user_profile_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserEditProfileController extends GetxController {
  RxBool isLoading = false.obs;
  Rxn<UserProfileModel> userProfileModel = Rxn();

  RxString imageUrl = ''.obs;

  String splitAppLanguage(List<String> languageList) {
    String result = languageList.join(', ');
    return result.toUpperCase();
  }

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

  uploadProfilePic({
    required String image,
    required BuildContext context,
  }) async {
    await ApiService.patchImage(
      filepath: image,
      userToken:
          "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      url: '${AppTokens.apiURl}/users/profile-picture',
    );
  }

  final imagePicker = ImagePicker();
  Future getGalleryImage(BuildContext context) async {
    imagePicker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 800,
      maxWidth: 800,
    )
        .then((value) async {
      if (value != null) {
        imageUrl.value = value.path;
        uploadProfilePic(image: imageUrl.value, context: context);

        update();
      }
    });
  }

  Future getCameraImage(BuildContext context) async {
    imagePicker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
      maxHeight: 800,
      maxWidth: 800,
    )
        .then((value) async {
      if (value != null) {
        imageUrl.value = value.path;
        uploadProfilePic(image: imageUrl.value, context: context);
      }
    });
  }

  RxBool processing = false.obs;

  RxList<String> genderList = ['Male', 'Female'].obs;

  RxInt selectedGender = RxInt(-1);

  updateDoctorGender({
    required BuildContext context,
  }) async {
    try {
      processing.value = true;
      final response = await ApiService.putWithHeader(
          userToken: {
            'Content-Type': 'application/json',
            "Authorization":
                "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
          },
          endPoint: '${AppTokens.apiURl}/users',
          body: {
            "gender": genderList[selectedGender.value].toLowerCase(),
          });

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.back();
          Get.find<UserEditProfileController>().getUserProfileData();
          Get.find<UserEditProfileController>().imageUrl.value = '';
          showToastMessage(
              message: "Update Gender Successfully",
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);

          update();
        } else {
          showToastMessage(
              message: response.body,
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
          printInfo(info: "Error While Updating  Gender  ${response.body}");
        }
      }
      processing.value = false;
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }
}
