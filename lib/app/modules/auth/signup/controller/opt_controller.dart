import 'dart:async';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';

class OptController extends GetxController {
  RxInt startDuration = 60.obs;
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

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  setOTPCode(String token, BuildContext context) async {
    await resendCode(token, context);
  }

  setEmailOTPCode(String token, BuildContext context) async {
    await resendCodebyEmail(token, context);
  }

  resendCode(String userToken, BuildContext context) async {
    startDuration.value = 60;
    _startTimer();
    final response = await ApiService.postwithHeader(
        userToken: {"Authorization": "Bearer $userToken"},
        endPoint:
            '${AppTokens.apiURl}/users/send-verification-code-via-phone-number',
        body: {});
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
          message: "Issue while sending Otp Try Again",
          // ignore: use_build_context_synchronously
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    }
  }

  resendCodebyEmail(String userToken, BuildContext context) async {
    startDuration.value = 60;
    _startTimer();
    final response = await ApiService.postwithHeader(
        userToken: {"Authorization": "Bearer $userToken"},
        endPoint: '${AppTokens.apiURl}/users/send-verification-code-via-email',
        body: {});
    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 200) {
        showToastMessage(
            message: "Successfully send opt to email.",
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
    }
  }

  verifyPhoneOtpCode({
    required String code,
    required BuildContext context,
    required String userToken,
    required String phone,
    required String email,
  }) async {
    _processing.value = true;
    final response = await ApiService.postwithHeader(
        userToken: {"Authorization": "Bearer $userToken"},
        endPoint: '${AppTokens.apiURl}/users/verify-phone/$code',
        body: {});
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        showToastMessage(
            message: "Successfully Verify Code",
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xff5BA66B),
            icon: Icons.check);
        _processing.value = false;

        await Get.find<LocalStorageController>()
            .daroonBox!
            .put("isLogin", true);
        Get.offAllNamed(Routes.emailOTPScreen, arguments: {
          "userToken": userToken,
          "email": email,
          "phone": phone,
        });
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

  verifyEmailOtpCode({
    required String code,
    required BuildContext context,
    required String userToken,
    required String phone,
    required String email,
  }) async {
    _processing.value = true;
    final response = await ApiService.postwithHeader(
        userToken: {"Authorization": "Bearer $userToken"},
        endPoint: '${AppTokens.apiURl}/users/verify-email-by-code/$code',
        body: {});
    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        showToastMessage(
            message: "Successfully Verify Code",
            // ignore: use_build_context_synchronously
            context: context,
            color: const Color(0xff5BA66B),
            icon: Icons.check);
        _processing.value = false;
        Get.offAllNamed(Routes.profilePic, arguments: {
          "userToken": userToken,
        });
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
