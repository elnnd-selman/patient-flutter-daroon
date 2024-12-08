// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/app/model/user_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';

class LoginCtrl extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();

  final _processing = false.obs;
  bool get processing => _processing.value;

  Future<void> loginUser(BuildContext context) async {
    try {
      _processing.value = true;
      FocusManager.instance.primaryFocus?.unfocus();

      final response = await ApiService.post(
          endPoint: '${AppTokens.apiURl}/users/login',
          body: {
            "emailOrPhoneOrUsername": email.text,
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
                message: "Please use user account",
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
}
