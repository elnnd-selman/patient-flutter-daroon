import 'package:daroon_user/app/modules/user/user_top_doctors/controller/top_doctor_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/doctor_about_me.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/doctor_profile_header.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/doctor_profile_header_row.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/doctor_profile_toggle_button.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/doctor_reviews.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopDoctorProfileScreen extends GetView<TopDoctorProfileController> {
  TopDoctorProfileScreen({super.key});

  final doctorData = Get.arguments[0] as TopDoctorModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopDoctorProfileController>(initState: (_) {
      controller.setMarker(doctorData);
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
              "${doctorData.firstNameEn!.capitalizeFirst!} ${doctorData.lastNameEn!..capitalizeFirst}",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackBGColor,
                fontSize: 2 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 4 * SizeConfig.widthMultiplier,
              vertical: 3 * SizeConfig.heightMultiplier),
          child: ListView(
            controller: controller.scrollController,
            physics: const BouncingScrollPhysics(),
            children: [
              DoctorProfileHeadrer(topDoctorModel: doctorData),
              SizedBox(height: 5 * SizeConfig.heightMultiplier),
              DoctorProfileHeaderRow(topDoctorModel: doctorData),
              SizedBox(height: 5 * SizeConfig.heightMultiplier),
              Obx(
                () => DoctorProfileToggleButton(
                  leftText: 'About Me',
                  centreText: 'Posts',
                  rightText: 'Reviews',
                  value: controller.selectedTab,
                  onValueChange: controller.selectTab,
                ),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Obx(() => controller.selectedTab == 0
                  ? DoctorAboutMe(topDoctorModel: doctorData)
                  : controller.selectedTab == 1
                      ? Container()
                      : const DoctorReviews()),
              SizedBox(height: 6 * SizeConfig.heightMultiplier),
            ],
          ),
        ),
      );
    });
  }
}
