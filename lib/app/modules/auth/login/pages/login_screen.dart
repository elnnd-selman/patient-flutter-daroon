import 'package:daroon_user/app/modules/auth/login/widget/login_toggle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/login/controller/login_controller.dart';
import 'package:daroon_user/app/modules/on_boarding/pages/login_selection_screen.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/email_validation.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

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
            key: controller.form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 12 * SizeConfig.heightMultiplier,
                    width: 55 * SizeConfig.widthMultiplier,
                    decoration: const BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/icons_png/splash_image.png",
                          ),
                          fit: BoxFit.contain),
                    ),
                  ),
                ),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                // Row(
                //   children: [
                //     // Image.asset(
                //     //   ,
                //     //   height: ,
                //     //   fit: BoxFit.fill,
                //     // ),
                //     const SizedBox(width: 6),
                //     Text("Daroon",
                //         style: AppTextStyles.bold.copyWith(
                //           fontSize: 25,
                //           fontFamily: ksecondaryFontFamily,
                //           color: AppColors.blackBGColor,
                //         )),
                //   ],
                // ),
                // SizedBox(height: 6 * SizeConfig.heightMultiplier),
                Obx(() => LogInToggleButton(
                      leftText: 'Email',
                      centreText: 'Phone',
                      value: controller.selectedTab,
                      onValueChange: controller.selectTab,
                    )),
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                Text("Log in to make your memories.",
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707281),
                    )),
                SizedBox(height: 2 * SizeConfig.heightMultiplier),
                Obx(
                  () => controller.selectedTab == 1
                      ? _buildPhoneContainer()
                      : CommonTextfeild(
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
                ),
                Obx(
                  () => controller.selectedTab == 1
                      ? Obx(
                          () => controller.phoneEmpty.value
                              ? Padding(
                                  padding:
                                      const EdgeInsets.only(top: 10, left: 16),
                                  child: Text(
                                    controller.errorMessage.value,
                                    style: AppTextStyles.medium.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: const Color(0xff8B0000)),
                                  ),
                                )
                              : const SizedBox(),
                        )
                      : const SizedBox(),
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
                  child: CupertinoButton(
                    pressedOpacity: 0,
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: () {
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
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                Obx(
                  () => CommonButton(
                    isLoading: controller.processing,
                    ontap: () {
                      if (controller.form.currentState!.validate()) {
                        if (controller.selectedTab == 1) {
                          if (controller.phone.text.isEmpty) {
                            controller.phoneEmpty.value = true;
                          } else {
                            String newText =
                                controller.phone.text.replaceAll(' ', '');

                            controller.checkPhoneValidation(
                              newText,
                              controller.dialCode.value,
                            );
                          }
                          if (!controller.phoneEmpty.value) {
                            controller.loginUser(context);
                          }
                        } else {
                          controller.loginUser(context);
                        }
                      }
                      if (controller.selectedTab == 1) {
                        if (controller.phone.text.isEmpty) {
                          controller.phoneEmpty.value = true;
                        } else {
                          String newText =
                              controller.phone.text.replaceAll(' ', '');

                          controller.checkPhoneValidation(
                            newText,
                            controller.dialCode.value,
                          );
                        }
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

  _buildPhoneContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
          color: const Color(0xffF7F7F8),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.borderColor,
          )),
      child: InternationalPhoneNumberInput(
        validator: (p0) {
          return null;
        },
        onInputChanged: (PhoneNumber number) {
          controller.dialCode.value = number.dialCode!;
          controller.phoneNumberFormat = PhoneNumber(
              phoneNumber: number.phoneNumber,
              isoCode: number.isoCode,
              dialCode: number.dialCode);
        },
        initialValue: controller.phoneNumberFormat,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        inputBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(15),
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: AppColors.blackBGColor),
        textFieldController: controller.phone,
        formatInput: true,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        cursorColor: Colors.black,
        inputDecoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 0, left: 0),
          border: InputBorder.none,
          isCollapsed: true,
          isDense: false,
          hintText: 'Phone Number',
          hintStyle: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: const Color(0xffA0A1AB),
          ),
        ),
        onSaved: (PhoneNumber number) {},
      ),
    );
  }
}
