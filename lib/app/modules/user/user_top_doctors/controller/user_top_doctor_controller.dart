import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';

class UserTopDoctorController extends GetxController {
  RxList<TopDoctorModel> topDoctorModelList = <TopDoctorModel>[].obs;
  RxBool isLoading = false.obs;
  getTopDoctorData() async {
    try {
      isLoading.value = true;
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
  }

  RxList<TopDoctorModel> searchDoctorModelList = <TopDoctorModel>[].obs;
  RxBool isSearch = false.obs;
  searchDoctor(String query) {
    searchDoctorModelList.value = [];
    searchDoctorModelList.value = topDoctorModelList
        .where((message) =>
            message.firstName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
