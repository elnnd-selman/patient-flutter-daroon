import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/user/user_home/widget/top_doctor_conatiner.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class UserTopDoctorScreen extends StatelessWidget {
  const UserTopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
          vertical: 3 * SizeConfig.heightMultiplier),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPatientTextField(),
            SizedBox(height: 3 * SizeConfig.heightMultiplier),
            const TopDoctorContainer(),
          ],
        ),
      ),
    );
  }

  TextFormField _buildPatientTextField() {
    return TextFormField(
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      cursorColor: Colors.black12,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            Assets.serachIcon,
            colorFilter: const ColorFilter.mode(
                AppColors.lighttextColor, BlendMode.srcIn),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () => Get.toNamed(Routes.filterScreen),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              Assets.filterIcon,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        ),
        isDense: true,
        hintText: "Search Patient",
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff787B80),
        ),
      ),
    );
  }
}
