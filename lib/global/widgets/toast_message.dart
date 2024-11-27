import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';

showToastMessage({
  required String message,
  required BuildContext context,
  required Color color,
  required IconData icon,
}) {
  FToast().init(context);
  FToast().showToast(
    child: Container(
      width: MediaQuery.of(context).size.width * 1,
      // margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteBGColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 5 * SizeConfig.heightMultiplier,
            width: 10 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 3 * SizeConfig.heightMultiplier,
                  width: 3 * SizeConfig.heightMultiplier,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteBGColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: color,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.horizontalSpace,
          Flexible(
            child: Text(
              message,
              // overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.blackBGColor,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ),
    gravity: ToastGravity.TOP,
  );
}

successTextMessage({
  required String message,
  required Color color,
  required IconData icon,
}) {
  BotToast.showCustomText(
    align: Alignment.topCenter,
    toastBuilder: (cancelFunc) => Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteBGColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: color,
        ),
      ),
      child: Row(
        children: [
          Container(
            height: 5 * SizeConfig.heightMultiplier,
            width: 10 * SizeConfig.widthMultiplier,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 3 * SizeConfig.heightMultiplier,
                  width: 3 * SizeConfig.heightMultiplier,
                  decoration: const BoxDecoration(
                    color: AppColors.whiteBGColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      icon,
                      color: color,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          10.horizontalSpace,
          Flexible(
            child: Text(
              message,
              // overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.blackBGColor,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
