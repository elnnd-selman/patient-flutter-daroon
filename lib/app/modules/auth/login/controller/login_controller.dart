// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/app/model/user_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginCtrl extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  final _processing = false.obs;
  bool get processing => _processing.value;

  Future<void> loginUser(BuildContext context) async {
    try {
      _processing.value = true;
      FocusManager.instance.primaryFocus?.unfocus();
      String newText = phone.text.replaceAll(' ', '');
      final response = await ApiService.post(
          endPoint: '${AppTokens.apiURl}/users/login',
          body: {
            "emailOrPhoneOrUsername": _selectedTab.value == 0
                ? email.text
                : "${dialCode.value}$newText",
            "password": password.text
          });

      if (response != null) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          showToastMessage(
              message: "Successfully login.",
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);
          final jsonData = jsonDecode(response.body);

          final userModel = UserModel.fromJson(jsonData);

          await Get.find<LocalStorageController>()
              .daroonBox!
              .put("userModel", userModel);

          await Get.find<LocalStorageController>()
              .daroonBox!
              .put("userRole", userModel.user!.typeOfUser!);
          if (userModel.user!.typeOfUser == "user") {
            await Get.find<LocalStorageController>()
                .daroonBox!
                .put("isLogin", true);

            Get.offAllNamed(Routes.userdrawerScreen);
          } else {
            successTextMessage(
                message: "Please use doctor account",
                color: const Color(0xffEC1C24),
                icon: Icons.close);
          }

          // if (jsonData["typeOfUser"] == userModel.user!.typeOfUser!) {
          //   Get.offAllNamed(Routes.userdrawerScreen);
          // } else {
          //   Get.offAllNamed(Routes.userdrawerScreen);
          // }
          // Get.offAllNamed(Routes.userdrawerScreen);
          cleanController();
          _processing.value = false;
        } else {
          _processing.value = false;
          showToastMessage(
              message: response.body.extractErrorMessage(),
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      } else {
        _processing.value = false;
        showToastMessage(
            message: response!.body.extractErrorMessage(),
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
      }
    } catch (e) {
      _processing.value = false;
      showToastMessage(
          message: "Issue",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }

  cleanController() {
    email.clear();
    password.clear();
  }

  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;

  final form = GlobalKey<FormState>();

  void selectTab(int value) async {
    phoneEmpty.value = false;
    form.currentState!.reset();
    _selectedTab.value = value;
  }

  checkPhoneValidation(String phoneNumber, String dialCode) {
    bool isValid = CountryUtils.validatePhoneNumber(phoneNumber, dialCode);

    if (isValid) {
      phoneEmpty.value = false;
    } else {
      phoneEmpty.value = true;
      errorMessage.value = "Phone number is invalid";
    }
  }

  final phone = TextEditingController();
  RxBool phoneEmpty = false.obs;
  var phoneNumberFormat =
      PhoneNumber(phoneNumber: "*******", isoCode: "IQ", dialCode: "+964");

  Rx<String> dialCode = "+964".obs;
  Rx<String> errorMessage = "Enter Phone Number".obs;
}
