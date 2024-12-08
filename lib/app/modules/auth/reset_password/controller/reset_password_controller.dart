import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  final _processing = false.obs;
  bool get processing => _processing.value;
  RxString resetToken = ''.obs;

  setResetToken(String token) {
    resetToken.value = token;
  }

  resetPassword({
    required String resetToken,
    required BuildContext context,
  }) async {
    try {
      _processing.value = true;
      final response = await ApiService.post(
          endPoint: '${AppTokens.apiURl}/users/reset-password-with-token',
          body: {
            "resetPasswordToken": resetToken,
            "password": password.text,
          });

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.offAndToNamed(Routes.resetSucessfully);
        } else {
          showToastMessage(
              message: response.body.extractErrorMessage(),
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      }
      _processing.value = false;
    } catch (e) {
      _processing.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
