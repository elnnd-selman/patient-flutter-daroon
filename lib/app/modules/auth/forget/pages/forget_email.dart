import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/forget/controller/forget_password_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/email_validation.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class ForgetEmailScreen extends GetView<ForgetPasswordCtrl> {
  ForgetEmailScreen({super.key});

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
            )),
      ),
      backgroundColor: AppColors.whiteBGColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text("Forgot password 🔒",
                  style: AppTextStyles.bold.copyWith(
                    fontSize: 25,
                    color: AppColors.darkBlackBGColor,
                  )),
              const SizedBox(height: 10),
              Text(
                  "Please enter your email address. So we’ll send you link to get back into your account.",
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    // fontFamily: ksecondaryFontFamily,
                    color: const Color(0xff707281),
                  )),
              40.verticalSpace,
              CommonTextfeild(
                scanIcons: false,
                obscuretext: false,
                hinttext: "Email",
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                showicon: false,
                validations: (value) {
                  if (value!.isEmpty) {
                    return "Enter E-mail";
                  } else if (!isEmailValidator(value)) {
                    return "Email Invalid";
                  }
                  return null;
                },
              ),
              const Spacer(),
              CommonButton(
                  ontap: () {
                    if (form.currentState!.validate()) {
                      Get.toNamed(
                        Routes.forgetOTPScreen,
                        arguments: {
                          "type": "email",
                          "data": controller.email.text,
                        },
                      );
                    }
                  },
                  name: "Send Code"),
              10.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
