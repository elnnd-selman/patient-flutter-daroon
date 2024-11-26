import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_offer/model/user_offer_model.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';

class UserOffersController extends GetxController {
  RxBool isAppBarOpen = false.obs;
  // RxInt isSelected = 0.obs;

  // final _selectedTab = 0.obs;
  // int get selectedTab => _selectedTab.value;

  // void selectTab(int value) async {
  //   _selectedTab.value = value;
  // }
  RxList<UserOfferModel> userOfferModelList = <UserOfferModel>[].obs;
  RxBool processing = false.obs;
  getDoctorOfersData() async {
    processing.value = true;
    userOfferModelList.value = [];

    try {
      // offers
      final response = await ApiService.getwithUserToken(
        endPoint: '${AppTokens.apiURl}/offers',
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        userOfferModelList.value =
            jsonResponse.map((data) => UserOfferModel.fromJson(data)).toList();
      }

      processing.value = false;
    } catch (e) {
      printError(info: e.toString());
      processing.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDoctorOfersData();
  }
}
