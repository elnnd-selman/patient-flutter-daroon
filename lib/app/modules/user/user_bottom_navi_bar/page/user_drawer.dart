import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/page/user_bottom_navi_bar.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/widget/user_drawer_option.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class UserDrawerScreen extends StatelessWidget {
  const UserDrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: ZoomDrawerController(),
      menuScreen: UserDrawerOption(
        setIndex: (index) {
          if (index == 0) {
            Get.toNamed(Routes.userOfferScreen);
          } else if (index == 1) {
            Get.toNamed(Routes.inVoiceScreen);
          }
        },
      ),
      mainScreen: const UserBottomNaviBar(),
      borderRadius: 40,
      mainScreenScale: 0.3,
      showShadow: true,
      angle: 0,
      drawerShadowsBackgroundColor: const Color(0xff3893ff),
      slideWidth: 280,
      shadowLayer2Color: Colors.transparent,
      shadowLayer1Color: const Color(0xff3893ff),
      // overlayBlend: BlendMode.difference,
      menuBackgroundColor: AppColors.primaryColor,
    );
  }
}
