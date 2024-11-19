// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/app/model/user_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpCtrl extends GetxController {
  RxString selectedGender = 'Gender'.obs;
  final firstNameEN = TextEditingController();
  final firstNameKU = TextEditingController();
  final firstNameAR = TextEditingController();
  final lastNameEN = TextEditingController();
  final lastNameKU = TextEditingController();
  final lastNameAR = TextEditingController();
  final email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  final phone = TextEditingController();
  Rxn<DateTime> birthDate = Rxn(null);
  final _processing = false.obs;
  bool get processing => _processing.value;

  RxBool phoneEmpty = false.obs;
  var phoneNumberFormat =
      PhoneNumber(phoneNumber: "*******", isoCode: "IQ", dialCode: "+964");

  Rx<String> dialCode = "+964".obs;
  Rx<String> errorMessage = "Enter Phone Number".obs;

  // var userModel = Rxn<Users>();

  RxList<String> genderList = ['Male', 'Female'].obs;

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd-MMM-yy');
    String formattedDate = formatter.format(date);
    return formattedDate;
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

  Future<void> registerUser(BuildContext context) async {
    try {
      _processing.value = true;
      FocusManager.instance.primaryFocus?.unfocus();

      String newText = phone.text.replaceAll(' ', '');

      final response = await ApiService.post(
          endPoint: '${AppTokens.apiURl}/users/register',
          body: {
            "firstName": "${firstNameEN.text.trim()} ${lastNameEN.text.trim()}",
            "firstName_ku": firstNameKU.text.trim(),
            "firstName_ar": firstNameAR.text.trim(),
            "firstName_en": firstNameEN.text.trim(),
            "lastName_ku": lastNameKU.text.trim(),
            "lastName_ar": lastNameAR.text.trim(),
            "lastName_en": lastNameEN.text.trim(),
            "username": userName.text.trim(),
            "gender": selectedGender.value.toLowerCase(),
            "email": email.text.trim(),
            "password": password.text.trim(),
            "confirmPassword": confirmpassword.text.trim(),
            "phoneNumber": "${dialCode.value}$newText",
            "appLang": "ku",
            "profilePicture": "",
            "dateOfBirth": birthDate.value.toString(),
            // "name": firstName.text,
            // "fullName": "${firstName.text} ${lastName.text}",
            // "username": userName.text,
            // "gender": selectedGender.value.toLowerCase(),
            // "email": email.text,
            // "password": password.text,
            // "confirmPassword": confirmpassword.text,
            // "phoneNumber": "$dialCode$newText"
          });
      if (response != null) {
        if (response.statusCode == 201 || response.statusCode == 200) {
          showToastMessage(
              message: "Successfully register.",
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);
          final jsonData = jsonDecode(response.body);
          Get.find<LocalStorageController>().daroonBox!.put("isLogin", true);
          await sendOtptoUser(jsonData["token"]);

          await sendOtptoUserInEmail(jsonData["token"]);

          final userModel = UserModel.fromJson(jsonData);
          Get.find<LocalStorageController>()
              .daroonBox!
              .put("userModel", userModel);

          _processing.value = false;

          Get.offAllNamed(Routes.otpScreen, arguments: {
            "userToken": jsonData["token"],
            "email": email.text,
            "phone": "${dialCode.value}$newText",
          });
          cleanController();
        } else {
          _processing.value = false;

          showToastMessage(
              message: response.body,
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      } else {
        _processing.value = false;
        showToastMessage(
            message: response!.body,
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
      }
    } catch (e) {
      _processing.value = false;
      showToastMessage(
          message: "Issue ${e.toString()}",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }

  sendOtptoUser(String userToken) async {
    await ApiService.postwithHeader(
      userToken: {"Authorization": userToken},
      endPoint:
          '${AppTokens.apiURl}/users/send-verification-code-via-phone-number',
      body: {},
    );
  }

  sendOtptoUserInEmail(String userToken) async {
    await ApiService.postwithHeader(
        userToken: {"Authorization": userToken},
        endPoint: '${AppTokens.apiURl}/users/send-verification-code-via-email',
        body: {});
  }

  cleanController() {
    selectedGender.value = 'Gender';
    firstNameAR.clear();
    firstNameKU.clear();

    firstNameEN.clear();
    lastNameAR.clear();
    lastNameKU.clear();
    lastNameEN.clear();
    email.clear();
    userName.clear();
    password.clear();
    confirmpassword.clear();
    phone.clear();
    phoneEmpty.value = false;
    phoneNumberFormat =
        PhoneNumber(phoneNumber: "*******", isoCode: "IQ", dialCode: "+964");
    dialCode.value = "+964";
    errorMessage.value = "Enter Phone Number";
  }
}
