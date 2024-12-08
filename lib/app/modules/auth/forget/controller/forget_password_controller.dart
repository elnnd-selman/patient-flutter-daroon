import 'dart:async';
import 'dart:convert';
import 'package:country_phone_validator/country_phone_validator.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ForgetPasswordCtrl extends GetxController {
  RxInt currentIndex = 0.obs;
  TextEditingController email = TextEditingController();

  RxBool phoneEmpty = false.obs;
  var phoneNumberFormat =
      PhoneNumber(phoneNumber: "*******", isoCode: "IQ", dialCode: "+964");
  final phone = TextEditingController();

  Rx<String> dialCode = "+964".obs;
  Rx<String> errorMessage = "Enter Phone Number".obs;

  sendEmailOTPUser(String emails, BuildContext context) async {
    startDuration.value = 60;
    _startTimer();
    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/forgot-password-via-email',
        body: {
          "email": emails,
        });

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        showToastMessage(
            message: "Successfully send opt to email.",
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xff5BA66B),
            icon: Icons.check);
      }
    } else {
      showToastMessage(
          message: response!.body.extractErrorMessage(),
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
      {}
    }
  }

  setData(String type, String data, BuildContext context) {
    if (type == "email") {
      sendEmailOTPUser(data, context);
    } else {
      sendPhoneOTP(data, context);
    }
  }

  checkPhoneValidation(String phoneNumber, String dialCode) {
    bool isValid = CountryUtils.validatePhoneNumber(phoneNumber, dialCode);

    if (isValid) {
      phoneEmpty.value = false;
      String newText = phone.text.replaceAll(' ', '');
      Get.toNamed(Routes.forgetOTPScreen, arguments: {
        "type": "phone",
        "data": "$dialCode$newText",
      });
    } else {
      phoneEmpty.value = true;
      errorMessage.value = "Phone number is invalid";
    }
  }

  sendPhoneOTP(
    String phone,
    BuildContext context,
  ) async {
    startDuration.value = 60;
    _startTimer();
    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/forgot-password-via-phone-number',
        body: {
          "phoneNumber": phone,
        });

    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        showToastMessage(
            message: "Successfully Send Otp Code to phone",
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xff5BA66B),
            icon: Icons.check);
      } else {
        showToastMessage(
            message: response.body.extractErrorMessage(),
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
      }
    } else {
      showToastMessage(
          message: "Response is empty",
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }

  RxInt startDuration = 0.obs;
  RxString otpCode = "".obs;

  final _processing = false.obs;
  bool get processing => _processing.value;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startDuration.value == 0) {
          timer.cancel();
        } else {
          startDuration--;
        }
      },
    );
  }

  verifyOTPCode({
    required String code,
    required BuildContext context,
  }) async {
    try {
      _processing.value = true;
      final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/verify-forgot-password/$code',
        body: {},
      );

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          showToastMessage(
              message: "Successfully Verify Code",
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);
          _processing.value = false;

          final jsonData = jsonDecode(response.body);
          Get.offAndToNamed(Routes.resetPasswordScreen, arguments: [
            jsonData['token'],
          ]);
        } else {
          _processing.value = false;
          showToastMessage(
              message: response.body.extractErrorMessage(),
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      } else {
        _processing.value = false;
        showToastMessage(
            message: "Response is empty",
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
      }
    } catch (e) {
      _processing.value = false;
    }
  }
}
