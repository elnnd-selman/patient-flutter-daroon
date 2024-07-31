import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(),
            const Spacer(),
            Center(
              child: Image.asset(
                "assets/images/welcome.png",
                height: 250,
                width: 250,
              ),
            ),
            Center(
              child: Text("Great! you signed up\nsuccessfully.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                    color: AppColors.darkBlackBGColor,
                  )),
            ),
            10.verticalSpace,
            Center(
              child: Text(
                  "Now you can use app feature, and\nexperience a good journey",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xff707281),
                  )),
            ),
            const Spacer(),
            CommonButton(
                ontap: () => Get.offAllNamed(Routes.userdrawerScreen),
                name: "Go To Home"),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
