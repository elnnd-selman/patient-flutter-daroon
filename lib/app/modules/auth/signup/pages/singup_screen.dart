import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/signup/controller/signup_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/email_validation.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class SignUpScreen extends GetView<SignUpCtrl> {
  SignUpScreen({super.key});

  final form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
        child: SingleChildScrollView(
          child: Form(
            key: form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text("Create account",
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 25,
                      color: AppColors.darkBlackBGColor,
                    )),
                const SizedBox(height: 30),
                Text("create account to use app features.",
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707281),
                    )),
                14.verticalSpace,
                CommonTextfeild(
                  inputFormat: [
                    FilteringTextInputFormatter.deny(RegExp(r'\s')),
                  ],
                  scanIcons: false,
                  obscuretext: false,
                  hinttext: "Username",
                  controller: controller.userName,
                  keyboardType: TextInputType.name,
                  showicon: false,
                  validations: (value) {
                    if (value!.isEmpty) {
                      return "Enter Username";
                    }
                    return null;
                  },
                ),
                15.verticalSpace,
                CommonTextfeild(
                  scanIcons: false,
                  obscuretext: false,
                  hinttext: "E-mail",
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
                15.verticalSpace,
                _buildPhoneContainer(),
                Obx(
                  () => controller.phoneEmpty.value
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10, left: 16),
                          child: Text(
                            controller.errorMessage.value,
                            style: AppTextStyles.medium.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                                color: const Color(0xff8B0000)),
                          ),
                        )
                      : const SizedBox(),
                ),
                15.verticalSpace,
                CommonTextfeild(
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
                15.verticalSpace,
                CommonTextfeild(
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
                SizedBox(height: 4 * SizeConfig.heightMultiplier),
                Obx(
                  () => CommonButton(
                      isLoading: controller.processing,
                      ontap: () {
                        if (form.currentState!.validate()) {
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
                            controller.registerUser(context);
                          }
                        }
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
                      },
                      name: "Next"),
                ),
                // 10.verticalSpace,
                // HaveAccount(
                //   title: "Already have an account? ",
                //   subtitle: "Log in",
                //   titleStyle: AppTextStyles.medium.copyWith(
                //     fontSize: 14,
                //     fontWeight: FontWeight.w500,
                //     color: const Color(0xff11142D),
                //   ),
                //   subtitleStyle: AppTextStyles.bold
                //       .copyWith(fontSize: 16, color: AppColors.primaryColor),
                //   ontap: () {
                //     Get.back();
                //   },
                // ),
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
