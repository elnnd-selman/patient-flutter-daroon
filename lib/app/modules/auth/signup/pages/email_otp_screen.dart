import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/signup/controller/opt_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:pinput/pinput.dart';

class EmailOtpScreen extends GetView<OptController> {
  const EmailOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: AppTextStyles.semiBold
          .copyWith(fontSize: 15, color: AppColors.darkBlackBGColor),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F8),
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: const Color(0xffF7F7F8),
      border: Border.all(
        color: AppColors.borderColor,
      ),
      borderRadius: BorderRadius.circular(10),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color(0xffF7F7F8),
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
    );
    return GetBuilder<OptController>(initState: (_) {
      controller.setEmailOTPCode(Get.arguments["userToken"], context);
    }, builder: (_) {
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
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Text("Enter verification code",
                      style: AppTextStyles.bold.copyWith(
                        fontSize: 25,
                        color: AppColors.darkBlackBGColor,
                      )),
                  const SizedBox(height: 10),
                  Text(
                    "Please enter verification code we sent to your",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff707281),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Email ",
                        textAlign: TextAlign.center,
                        style: AppTextStyles.medium.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707281),
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        Get.arguments["email"],
                        textAlign: TextAlign.center,
                        style: AppTextStyles.medium.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackBGColor,
                        ),
                      ),
                    ],
                  ),
                  40.verticalSpace,
                  Pinput(
                      length: 6,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      showCursor: true,
                      onChanged: (pin) {
                        controller.otpCode.value = pin;
                      }),
                  30.verticalSpace,
                  CustomCupertinoButton(
                    onTap: () {
                      if (controller.startDuration.value == 0) {
                        controller.resendCodebyEmail(
                            Get.arguments["userToken"], context);
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Resend code",
                          textAlign: TextAlign.center,
                          style: AppTextStyles.medium.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackBGColor,
                          ),
                        ),
                        10.horizontalSpace,
                        Obx(
                          () => Text(
                            "00:${controller.startDuration}",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.medium.copyWith(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  CommonButton(
                      ontap: () {
                        if (controller.otpCode.value.length == 6) {
                          controller.verifyEmailOtpCode(
                            userToken: Get.arguments["userToken"],
                            code: controller.otpCode.value,
                            context: context,
                            phone: Get.arguments["phone"],
                            email: Get.arguments["email"],
                          );
                        } else {
                          showToastMessage(
                              message: "Complete Otp Code",
                              // ignore: use_build_context_synchronously
                              context: context,
                              color: const Color(0xffEC1C24),
                              icon: Icons.close);
                        }
                      },
                      name: "Verify"),
                  10.verticalSpace,
                  CustomCupertinoButton(
                    onTap: () {
                      Get.offAllNamed(Routes.profilePic, arguments: {
                        "userToken": Get.arguments["userToken"],
                      });
                    },
                    child: Container(
                      // margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 18),
                      decoration: BoxDecoration(
                        // color: AppColors.primaryColor,
                        border: Border.all(color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: Text(
                          "Skip",
                          style: AppTextStyles.bold.copyWith(
                            fontSize: 16,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  20.verticalSpace,
                ],
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
    });
  }
}
