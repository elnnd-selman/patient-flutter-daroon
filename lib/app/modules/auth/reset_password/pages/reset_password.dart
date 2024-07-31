import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/reset_password/controller/reset_password_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';

class ResetPasswordScreen extends GetView<ResetPasswordController> {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //     onPressed: () {
        //       Get.back();
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back_ios_new_rounded,
        //     )),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Text("New password",
                      style: AppTextStyles.bold.copyWith(
                        fontSize: 25,
                        color: AppColors.darkBlackBGColor,
                      )),
                  const SizedBox(height: 10),
                  Text(
                    "Create your new password so you can share your\nmemories again.",
                    textAlign: TextAlign.start,
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707281),
                    ),
                  ),
                  SizedBox(height: 4 * SizeConfig.heightMultiplier),
                  CommonTextfeildfoucBorder(
                    scanIcons: false,
                    obscuretext: true,
                    hinttext: "Password",
                    controller: controller.password,
                    keyboardType: TextInputType.visiblePassword,
                    showicon: true,
                    validations: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (value.length < 6) {
                        return "Password length should at least 6";
                      }
                      return null;
                    },
                  ),
                  20.verticalSpace,
                  CommonTextfeildfoucBorder(
                    scanIcons: false,
                    obscuretext: true,
                    hinttext: "Confirm Password",
                    controller: controller.confirmpassword,
                    keyboardType: TextInputType.emailAddress,
                    showicon: true,
                    validations: (value) {
                      if (value!.isEmpty) {
                        return "Enter Password";
                      } else if (controller.password.text !=
                          controller.confirmpassword.text) {
                        return "Password donot match";
                      }
                      return null;
                    },
                  ),
                  const Spacer(),
                  CommonButton(
                      ontap: () {
                        if (form.currentState!.validate()) {}
                      },
                      name: "Reset Password"),
                  SizedBox(height: 1 * SizeConfig.heightMultiplier),
                ],
              ),
            ),
          ),
          Obx(() {
            if (controller.processing) {
              return const LoadingOverlay();
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }
}
