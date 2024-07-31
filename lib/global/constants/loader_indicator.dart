import 'package:flutter/material.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class LoaderIndicator {
  static void loadingProgressIndicator(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      builder: (ctx) {
        return const Center(
          child: CircularProgressIndicator.adaptive(
            backgroundColor: AppColors.primaryColor,
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
      },
      context: context,
    );
  }
}
