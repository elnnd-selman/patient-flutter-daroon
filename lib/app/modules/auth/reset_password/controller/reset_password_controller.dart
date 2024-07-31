import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';

class ResetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final _processing = false.obs;
  bool get processing => _processing.value;

  resetPassword({
    required String resetToken,
    required BuildContext context,
  }) async {
    final response = await ApiService.post(
        endPoint: '${AppTokens.apiURl}/users/resetPasswordWithToken',
        body: {
          "resetPasswordToken": resetToken,
          "password": password.text,
        });

    if (response != null) {
      if (response.statusCode == 201 || response.statusCode == 201) {}
    }
  }
}
