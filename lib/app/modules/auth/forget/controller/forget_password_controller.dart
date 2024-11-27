import 'dart:async';
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

  sendOtptoUser() async {
    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/forgotPasswordViaEmail',
        body: {
          "email": email.text,
        });

    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 201) {
        Get.toNamed(
          Routes.forgetOTPScreen,
          arguments: {
            "type": "email",
            "data": email.text,
          },
        );
      }
    }
  }

  checkPhoneValidation(String phoneNumber, String dialCode) {
    bool isValid = CountryUtils.validatePhoneNumber(phoneNumber, dialCode);

    if (isValid) {
      phoneEmpty.value = false;
      sendOtptoUserPhone();
    } else {
      phoneEmpty.value = true;
      errorMessage.value = "Phone number is invalid";
    }
  }

  sendOtptoUserPhone() async {
    String newText = phone.text.replaceAll(' ', '');

    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/forgotPasswordViaPhoneNumber',
        body: {
          "phoneNumber": "$dialCode$newText",
        });

    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 201) {
        Get.toNamed(
          Routes.forgetOTPScreen,
          arguments: {
            "type": "phone",
            "data": "$dialCode$newText",
          },
        );
      }
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

  resendCode(BuildContext context) async {
    startDuration.value = 60;
    _startTimer();
    String newText = phone.text.replaceAll(' ', '');

    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/forgotPasswordViaPhoneNumber',
        body: {
          "phoneNumber": "$dialCode$newText",
        });

    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        showToastMessage(
            message: "Successfully Send Otp Code",
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
          message: "Issue while sending Otp Try Again",
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }

  verifyOtpCode({
    required String code,
    required BuildContext context,
  }) async {
    _processing.value = true;
    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/verifyPhone/$code', body: {});

    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 201) {
        showToastMessage(
            message: "Successfully Verify Code",
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xff5BA66B),
            icon: Icons.check);
        _processing.value = false;
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
          message: response!.body.extractErrorMessage(),
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }
}
