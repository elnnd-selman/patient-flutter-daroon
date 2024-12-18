import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/controller/user_custom_navi_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class UserTopDoctorAppBar extends GetView<UserCustomNaviController> {
  const UserTopDoctorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.white,
      bottomOpacity: 0.0,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          "Doctors",
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackBGColor,
            fontSize: 2 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
    );
  }
}
