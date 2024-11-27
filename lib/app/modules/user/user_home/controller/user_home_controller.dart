import 'dart:convert';
import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:daroon_user/app/model/user_model.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';
import 'package:daroon_user/app/modules/user/user_home/model/public_ads_model.dart';
import 'package:daroon_user/app/modules/user/user_home/model/speciality_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class UserHomeController extends GetxController {
  RxInt isSelected = 0.obs;

  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;

  void selectTab(int value) async {
    _selectedTab.value = value;
  }

  final AppinioSwiperController appinioSwiperController =
      AppinioSwiperController();

  List<Color> gradientColors = [
    AppColors.primaryColor,
    AppColors.primaryColor,
  ];

  Rxn<UserModel> userModel = Rxn();
  @override
  Future<void> onInit() async {
    super.onInit();
    // Get.find<LocalStorageController>().daroonBox!.delete("isLogin");
    userModel.value = await Get.find<LocalStorageController>()
        .daroonBox!
        .get("userModel", defaultValue: UserModel);
    getUserAppointments();
    getTopDoctorData();
    getVIPDoctorData();
    getPublicAds();
    getSpecialityAds();
    if (kDebugMode) {
      print(userModel.value!.token!);
      print(userModel.value!.user!.id!);
    }
  }

  // Future<void> shakeCard() async {
  //   const double distance = 30;
  //   // We can animate back and forth by chaining different animations.
  //   await appinioSwiperController.animateTo(
  //     const Offset(-distance, 0),
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  //   await appinioSwiperController.animateTo(
  //     const Offset(distance, 0),
  //     duration: const Duration(milliseconds: 400),
  //     curve: Curves.easeInOut,
  //   );
  //   // We need to animate back to the center because `animateTo` does not center
  //   // the card for us.
  //   await appinioSwiperController.animateTo(
  //     const Offset(0, 0),
  //     duration: const Duration(milliseconds: 200),
  //     curve: Curves.easeInOut,
  //   );
  // }

  void swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        log('A swipe was cancelled');
        break;
      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  RxBool isEndCard = false.obs;
  void onEnd() {
    log('end reached!');
    isEndCard.value = true;
  }

  RxBool isLoading = false.obs;
  RxList<AppointmentModel> upcomingAppointmentList = RxList();
  getUserAppointments() async {
    isLoading.value = true;

    final response = await ApiService.getwithUserToken(
      endPoint: "${AppTokens.apiURl}/appointments?status=upcoming",
      userToken: {
        "Authorization": "Bearer ${userModel.value!.token!}",
      },
    );
    if (response!.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
      upcomingAppointmentList.value =
          jsonResponse.map((data) => AppointmentModel.fromJson(data)).toList();

      upcomingAppointmentList
          .sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));

      isLoading.value = false;
    } else {
      isLoading.value = false;
    }
  }

  RxList<TopDoctorModel> topDoctorModelList = <TopDoctorModel>[].obs;
  RxBool processing = false.obs;
  getTopDoctorData() async {
    try {
      processing.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/doctors",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        topDoctorModelList.value =
            jsonResponse.map((data) => TopDoctorModel.fromJson(data)).toList();
      }
      processing.value = false;
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }

  RxList<TopDoctorModel> vipDoctorModelList = <TopDoctorModel>[].obs;
  RxBool isVipLoading = false.obs;
  getVIPDoctorData() async {
    try {
      vipDoctorModelList.value = [];
      isVipLoading.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/doctors/vip",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        vipDoctorModelList.value =
            jsonResponse.map((data) => TopDoctorModel.fromJson(data)).toList();
      }
      isVipLoading.value = false;
    } catch (e) {
      isVipLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  RxList<PublicAdsModel> publicADSList = <PublicAdsModel>[].obs;
  RxBool isAdsLoading = false.obs;
  getPublicAds() async {
    try {
      publicADSList.value = [];
      isAdsLoading.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/ads",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        publicADSList.value =
            jsonResponse.map((data) => PublicAdsModel.fromJson(data)).toList();
      }
      isAdsLoading.value = false;
    } catch (e) {
      isAdsLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  RxList<SpecialityModel> specialityList = <SpecialityModel>[].obs;
  RxBool isSpecialityLoading = false.obs;
  getSpecialityAds() async {
    try {
      publicADSList.value = [];
      isSpecialityLoading.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/users/speciality",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        specialityList.value =
            jsonResponse.map((data) => SpecialityModel.fromJson(data)).toList();
      }
      isSpecialityLoading.value = false;
    } catch (e) {
      isSpecialityLoading.value = false;
      printInfo(info: e.toString());
    }
  }
}
