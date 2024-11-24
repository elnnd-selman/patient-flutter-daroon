import 'package:daroon_user/app/modules/user/user_podcast/controller/user_presenter_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/photo_tab.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/podcast_tab.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/text_tab.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/doctor_profile_toggle_button.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPresenterProfileScreen
    extends GetView<UserPresenterProfileController> {
  UserPresenterProfileScreen({super.key});

  final firstName = Get.arguments[0] as String;
  final lastName = Get.arguments[1] as String;
  final id = Get.arguments[2] as String;
  // final pro = Get.arguments[1] as String;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserPresenterProfileController>(initState: (_) {
      controller.setPresenterData(id);
    }, builder: (_) {
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              "Name",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackBGColor,
                fontSize: 2 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 22 * SizeConfig.heightMultiplier,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  Container(
                    height: 18 * SizeConfig.heightMultiplier,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage("assets/images/podcast_image.png"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 4 * SizeConfig.heightMultiplier,
                    child: Container(
                      height: 11 * SizeConfig.heightMultiplier,
                      width: 11 * SizeConfig.heightMultiplier,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset("assets/images/tempImages.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 4 * SizeConfig.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.verticalSpace,
                  Text(
                    firstName,
                    style: AppTextStyles.semiBold
                        .copyWith(color: AppColors.blackBGColor, fontSize: 18),
                  ),
                  Text(
                    lastName,
                    style: AppTextStyles.medium.copyWith(
                        color: AppColors.lighttextColor, fontSize: 16),
                  ),
                  30.verticalSpace,
                  Obx(
                    () => DoctorProfileToggleButton(
                      leftText: 'Podcast',
                      centreText: 'Photo   ',
                      rightText: 'Text',
                      value: controller.selectedTab,
                      onValueChange: controller.selectTab,
                    ),
                  ),
                  SizedBox(height: 2 * SizeConfig.heightMultiplier),
                  Obx(() => controller.selectedTab == 0
                      ? const PodcastTab()
                      : controller.selectedTab == 1
                          ? const PhotoTab()
                          : const TextTab()),
                  SizedBox(height: 6 * SizeConfig.heightMultiplier),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
