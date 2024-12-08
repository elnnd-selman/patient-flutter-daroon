import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetSucessfully extends StatelessWidget {
  const ResetSucessfully({super.key});

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
              child: Text("Great! your password\nhas changed",
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
                  "Don't worry, we'll let you know if there's a\nproblem with your account",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.bold.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: const Color(0xff707281),
                  )),
            ),
            const Spacer(),
            CommonButton(
                ontap: () => Get.offAllNamed(Routes.login),
                name: "Back to Login"),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
