import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/forget/controller/forget_password_controller.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class ForgetPassowrdScreen extends GetView<ForgetPasswordCtrl> {
  const ForgetPassowrdScreen({super.key});

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
                "Select which contact details should we use to reset your password.",
                style: AppTextStyles.medium.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  // fontFamily: ksecondaryFontFamily,
                  color: const Color(0xff707281),
                )),
            40.verticalSpace,
            ListView.builder(
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (context, index) {
                return CustomCupertinoButton(
                  onTap: () {
                    controller.currentIndex.value = index;
                  },
                  child: _buildForgetContainer(index),
                );
              },
            ),
            const Spacer(),
            CommonButton(
                ontap: () {
                  if (controller.currentIndex.value == 0) {
                    Get.toNamed(Routes.forgetEmail);
                  } else {
                    Get.toNamed(Routes.forgetPhone);
                  }
                },
                name: "Next")
          ],
        ),
      ),
    );
  }

  Obx _buildForgetContainer(int index) {
    return Obx(
      () => Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: BoxDecoration(
            color: const Color(0xffF7F7F8),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: controller.currentIndex.value == index
                  ? AppColors.primaryColor
                  : AppColors.borderColor,
            )),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        index == 0 ? Assets.emailBox : Assets.phone,
                        height: 25,
                        color: AppColors.whiteBGColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            10.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(index == 0 ? "Email" : "Phone",
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 14,
                      color: AppColors.darkBlackBGColor,
                    )),
                const SizedBox(height: 4),
                Text(index == 0 ? "Dor****@gmail.com" : "+9*********",
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      // fontFamily: ksecondaryFontFamily,
                      color: const Color(0xff707281),
                    )),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == index
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      border: Border.all(
                          color: controller.currentIndex.value == index
                              ? AppColors.primaryColor
                              : AppColors.borderColor)),
                  child: Icon(
                    Icons.check,
                    size: 15,
                    color: controller.currentIndex.value == index
                        ? AppColors.whiteBGColor
                        : Colors.transparent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
