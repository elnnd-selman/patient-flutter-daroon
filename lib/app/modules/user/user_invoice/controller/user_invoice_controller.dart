import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_invoice/model/user_specific_voice_model.dart';
import 'package:daroon_user/app/modules/user/user_invoice/model/user_voice_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInvoiceController extends GetxController {
  RxBool isAppBarOpen = false.obs;

  TextEditingController voiceTextField = TextEditingController();
  RxBool processing = false.obs;
  RxBool isLoading = false.obs;

  RxList<UserVoiceModel> userVoiceList = <UserVoiceModel>[].obs;

  getUserInVoice() async {
    try {
      processing.value = true;
      userVoiceList.value = [];

      final response = await ApiService.getwithUserToken(
        endPoint: '${AppTokens.apiURl}/users/invoices',
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        userVoiceList.value =
            jsonResponse.map((data) => UserVoiceModel.fromJson(data)).toList();
      }

      processing.value = false;
    } catch (e) {
      printError(info: e.toString());
      processing.value = false;
    }
  }

  RxInt selectedIndex = RxInt(-1);

  @override
  void onInit() {
    super.onInit();
    getUserInVoice();
  }

  List<String> accountTypeList = [
    "Personal",
    "Business",
    "Corporate",
  ].obs;

  setData(String name, String id) async {
    getSpecificVoice(id);
  }

  Rxn<UserSpecificVoiceModel> userSpecificVoiceModel = Rxn();

  getSpecificVoice(String id) async {
    try {
      isLoading.value = true;

      final response = await ApiService.getwithUserToken(
        endPoint: '${AppTokens.apiURl}/users/invoices/$id/checkout',
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body);
        userSpecificVoiceModel.value =
            UserSpecificVoiceModel.fromJson(jsonResponse);
      }

      isLoading.value = false;
    } catch (e) {
      printError(info: e.toString());
      isLoading.value = false;
    }
  }

  checkPaymentPaid(String id) async {
    try {
      final response = await ApiService.getwithUserToken(
        endPoint: '${AppTokens.apiURl}/users/invoices/$id/checkout',
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final result = response.body.extractErrorMessage();

        Get.offAndToNamed(Routes.paymentStatus, arguments: [
          result == "Invoice Paid Successfully" ? true : false,
        ]);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
