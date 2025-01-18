import 'package:daroon_user/global/constants/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBGColor,
      body: Center(
        child: Container(
          height: 12 * SizeConfig.heightMultiplier,
          width: 55 * SizeConfig.widthMultiplier,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/icons_png/splash_image.png",
                ),
                fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _handleNavigation();
  }

  void _handleNavigation() async {
    await Future.delayed(const Duration(seconds: 3));

    if (Get.find<LocalStorageController>().daroonBox!.get("isLogin") != null) {
      if (Get.find<LocalStorageController>().daroonBox!.get("isLogin")!) {
        if (Get.find<LocalStorageController>().daroonBox!.get("userRole") ==
            "doctor") {
          // Get.offAllNamed(Routes.doctordrawerScreen);
        }
        Get.offAllNamed(Routes.userdrawerScreen);
      } else {
        Get.offAllNamed(Routes.onboarding);
      }
    } else {
      Get.offAllNamed(Routes.onboarding);
    }
  }
}
