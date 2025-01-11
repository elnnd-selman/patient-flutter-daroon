import 'dart:convert';

import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class UserTopDoctorController extends GetxController {
  RxList<TopDoctorModel> topDoctorModelList = <TopDoctorModel>[].obs;
  RxBool isLoading = false.obs;
  getTopDoctorData() async {
    try {
      isLoading.value = true;
      topDoctorModelList.value = [];
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
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getTopDoctorData();
    getDoctorLevel();
  }

  RxList<TopDoctorModel> searchDoctorModelList = <TopDoctorModel>[].obs;
  RxBool isSearch = false.obs;
  // searchDoctor(String query) {
  //   searchDoctorModelList.value = [];
  //   searchDoctorModelList.value = topDoctorModelList
  //       .where((message) =>
  //           message.firstName!.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  // }

  Future<void> refreshTopDoctor() async {
    getTopDoctorData();
    await Future.delayed(const Duration(seconds: 2));
  }

/////////// Filter Setting /////
  RxList<Level> doctorLevelList = <Level>[].obs;
  RxList<String> genderList = <String>["Male", "Female"].obs;
  RxList<String> languageList = <String>["English", "Arabic", "kurdish"].obs;
  RxBool isLevelLoading = false.obs;
  Rx<SfRangeValues> currentRangeValues = Rx(const SfRangeValues(1, 5));
  Rx<SfRangeValues> distanceRangeValues = Rx(const SfRangeValues(0, 100));

  RxInt selectSpeciality = RxInt(-1);
  RxInt selectLevel = RxInt(-1);
  RxInt selectGender = RxInt(-1);
  RxInt selectlanguage = RxInt(-1);
  RxBool isFilterApply = false.obs;

  getDoctorLevel() async {
    try {
      doctorLevelList.value = [];
      isLevelLoading.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/users/levels",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        doctorLevelList.value =
            jsonResponse.map((data) => Level.fromJson(data)).toList();
      }
      isLevelLoading.value = false;
    } catch (e) {
      isLevelLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  setApi() {
    String apiUrl =
        "${AppTokens.apiURl}/doctors?ratingMin=${currentRangeValues.value.start.toString()}&ratingMax=${currentRangeValues.value.end.toString()}&distanceMin=${distanceRangeValues.value.start.toString()}&distanceMax=${distanceRangeValues.value.end.toString()}";
    if (selectSpeciality.value != -1) {
      final String specialityName = Get.find<UserHomeController>()
          .specialityList[selectSpeciality.value]
          .specialityEn!;
      apiUrl = "$apiUrl&speciality=${specialityName.toLowerCase()}";
    }
    if (selectLevel.value != -1) {
      final levelName = doctorLevelList[selectLevel.value].levelEn!;
      apiUrl = "$apiUrl&level=${levelName.toLowerCase()}";
    }
    if (selectlanguage.value != -1) {
      final templanguageName = languageList[selectlanguage.value];
      String languageName = "";
      if (templanguageName == "English") {
        languageName = "en";
      } else if (templanguageName == "Arabic") {
        languageName = "ar";
      } else {
        languageName = "ku";
      }
      apiUrl = "$apiUrl&language=$languageName";
    }
    if (selectGender.value != -1) {
      final genderName = genderList[selectGender.value];
      apiUrl = "$apiUrl&gender=${genderName.toLowerCase()}";
    }

    applyFilterApiForDoctor(apiUrl);
    Get.back();
  }

  searchDoctor(String query) async {
    try {
      isLoading.value = true;
      topDoctorModelList.value = [];
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/doctors?search=$query",
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
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  applyFilterApiForDoctor(String apiUrl) async {
    try {
      isLoading.value = true;
      topDoctorModelList.value = [];
      final response = await ApiService.getwithUserToken(
        endPoint: apiUrl,
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
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  resetFilter() {
    currentRangeValues.value = const SfRangeValues(1, 5);
    distanceRangeValues.value = const SfRangeValues(0, 100);
    selectSpeciality.value = -1;
    selectLevel.value = -1;
    selectGender.value = -1;
    selectlanguage.value = -1;
    isFilterApply.value = false;
    getTopDoctorData();
    Get.back();
  }
}
