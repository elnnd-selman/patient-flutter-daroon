import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/forget/controller/forget_password_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class ForgetPhoneScreen extends GetView<ForgetPasswordCtrl> {
  const ForgetPhoneScreen({super.key});

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
            const Spacer(),
            CommonButton(
                ontap: () {
                  if (controller.phone.text.isEmpty) {
                    controller.phoneEmpty.value = true;
                  } else {
                    String newText = controller.phone.text.replaceAll(' ', '');

                    controller.checkPhoneValidation(
                      newText,
                      controller.dialCode.value,
                    );
                  }
                },
                name: "Send Code"),
            10.verticalSpace,
          ],
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
