import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/login/controller/login_controller.dart';
import 'package:daroon_user/app/modules/on_boarding/pages/login_selection_screen.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/app_constants.dart';
import 'package:daroon_user/global/constants/email_validation.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class LoginScreen extends GetView<LoginCtrl> {
  LoginScreen({super.key});

  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        backgroundColor:
            controller.processing ? Colors.transparent : AppColors.whiteBGColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: controller.processing ? Colors.transparent : Colors.black,
            )),
      ),
      backgroundColor: AppColors.whiteBGColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Row(
                  children: [
                    Image.asset(
                      Assets.appLogo,
                      width: 35,
                    ),
                    const SizedBox(width: 6),
                    Text("Daroon",
                        style: AppTextStyles.bold.copyWith(
                          fontSize: 25,
                          fontFamily: ksecondaryFontFamily,
                          color: AppColors.blackBGColor,
                        )),
                  ],
                ),
                SizedBox(height: 6 * SizeConfig.heightMultiplier),
                Text("Log in to make your memories.",
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      // fontFamily: ksecondaryFontFamily,
                      color: const Color(0xff707281),
                    )),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                CommonTextfeild(
                  scanIcons: false,
                  obscuretext: false,
                  hinttext: "Username, email or phone number",
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
                const SizedBox(height: 20),
                CommonTextfeild(
                  scanIcons: false,
                  obscuretext: true,
                  hinttext: "Password",
                  controller: controller.password,
                  keyboardType: TextInputType.emailAddress,
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
                const SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomCupertinoButton(
                    onTap: () {
                      Get.toNamed(Routes.forgetPassword);
                    },
                    child: Text("Forgot password?",
                        style: AppTextStyles.bold.copyWith(
                          fontSize: 14,
                          // fontFamily: ksecondaryFontFamily,
                          color: AppColors.primaryColor,
                        )),
                  ),
                ),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                Obx(
                  () => CommonButton(
                    isLoading: controller.processing,
                    ontap: () {
                      if (form.currentState!.validate()) {
                        // LoaderIndicator.loadingProgressIndicator(context);
                        controller.loginUser(context);
                      }
                    },
                    name: "Log In",
                  ),
                ),
                SizedBox(height: 1 * SizeConfig.heightMultiplier),
                HaveAccount(
                  title: "Don’t have an account? ",
                  subtitle: "Sign up",
                  titleStyle: AppTextStyles.medium.copyWith(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff11142D),
                  ),
                  subtitleStyle: AppTextStyles.bold
                      .copyWith(fontSize: 16, color: AppColors.primaryColor),
                  ontap: () {
                    Get.toNamed(Routes.firstsignup);
                  },
                ),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                20.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
