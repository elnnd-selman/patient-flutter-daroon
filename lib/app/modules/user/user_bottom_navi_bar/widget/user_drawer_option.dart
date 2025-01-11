import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class UserDrawerOption extends StatelessWidget {
  final ValueSetter setIndex;
  const UserDrawerOption({super.key, required this.setIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: 6 * SizeConfig.widthMultiplier,
            top: 20 * SizeConfig.heightMultiplier),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Daroon",
              style: AppTextStyles.bold.copyWith(
                fontSize: 2.5 * SizeConfig.heightMultiplier,
                color: AppColors.whiteBGColor,
              ),
            ),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            _drawerTexttile(
                icon: "assets/icons/offers.svg", text: "My Offers", index: 0),
            SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
            _drawerTexttile(
                icon: Assets.inVoiceIcon, text: "My InVoice", index: 1),
            const Spacer(),
            _drawerTexttile(icon: Assets.aboutIcon, text: "About Us", index: 2),
            SizedBox(height: 1 * SizeConfig.heightMultiplier),
            _drawerTexttile(
                icon: Assets.settingIcon, text: "Setting", index: 3),
            SizedBox(height: 1 * SizeConfig.heightMultiplier),
            _drawerTexttile(
                onTap: () {
                  Get.find<LocalStorageController>()
                      .daroonBox!
                      .delete("isLogin");
                  Get.offAllNamed(Routes.login);
                },
                icon: "assets/icons/logout.svg",
                text: "Log Out",
                index: 3),
            SizedBox(height: 20 * SizeConfig.heightMultiplier),
          ],
        ),
      ),
    );
  }

  CustomCupertinoButton _drawerTexttile({
    required String icon,
    required String text,
    required int index,
    Function()? onTap,
  }) {
    return CustomCupertinoButton(
      onTap: onTap ??
          () {
            setIndex(index);
          },
      child: Row(
        children: [
          Container(
            height: 4.5 * SizeConfig.heightMultiplier,
            width: 8 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: AppColors.whiteBGColor.withOpacity(.18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  height: 3.8 * SizeConfig.imageSizeMultiplier,
                  colorFilter: const ColorFilter.mode(
                      AppColors.whiteBGColor, BlendMode.srcIn),
                ),
              ],
            ),
          ),
          SizedBox(width: 2 * SizeConfig.widthMultiplier),
          Text(text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: AppColors.whiteBGColor,
                fontSize: 1.5 * SizeConfig.heightMultiplier,
              )),
        ],
      ),
    );
  }
}
