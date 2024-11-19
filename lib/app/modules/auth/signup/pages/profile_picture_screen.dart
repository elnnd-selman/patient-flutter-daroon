import 'dart:io';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/signup/controller/profile_pic_controller.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';

class ProfilePictureScreen extends GetView<ProfilePicController> {
  const ProfilePictureScreen({super.key});

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
              Icons.arrow_back,
            )),
      ),
      backgroundColor: AppColors.whiteBGColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                Text("Profile Picture",
                    style: AppTextStyles.bold.copyWith(
                      fontSize: 25,
                      color: AppColors.darkBlackBGColor,
                    )),
                const SizedBox(height: 10),
                Text("Upload your profile picture to recognize more.",
                    style: AppTextStyles.medium.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      // fontFamily: ksecondaryFontFamily,
                      color: const Color(0xff707281),
                    )),
                40.verticalSpace,
                Center(
                  child: Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 20 * SizeConfig.heightMultiplier,
                        width: 20 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.17),
                        ),
                        child: Obx(
                          () => controller.isNoPhoto.value
                              ? Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: Image.asset(
                                    "assets/images/noProfile.png",
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Image.file(
                                    File(controller.selectedimageName!.value),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 6,
                        right: 10,
                        child: CustomCupertinoButton(
                          onTap: () {
                            controller.addPhoto(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 5 * SizeConfig.heightMultiplier,
                            width: 5 * SizeConfig.heightMultiplier,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor,
                                border: Border.all(
                                    color: AppColors.whiteBGColor, width: 2.5)),
                            child: const Icon(
                              Icons.edit,
                              color: AppColors.whiteBGColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                CommonButton(
                    ontap: () {
                      if (controller.isNoPhoto.value) {
                        showToastMessage(
                            message: "Please Selected Image",
                            // ignore: use_build_context_synchronously
                            context: context,
                            color: const Color(0xffEC1C24),
                            icon: Icons.close);
                      } else {
                        controller.uploadProfilePic(
                          context: context,
                          image: controller.selectedimageName!.value,
                          userToken: Get.arguments["userToken"],
                        );
                      }
                    },
                    name: "Next"),
                8.verticalSpace,
                CustomCupertinoButton(
                  onTap: () {
                    Get.offAllNamed(Routes.welcome);
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
                15.verticalSpace,
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
  }
}
