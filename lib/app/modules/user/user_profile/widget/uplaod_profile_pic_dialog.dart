import 'package:daroon_user/app/modules/user/user_profile/controller/user_edit_profile_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

Future<void> updateProfilePhoto(BuildContext context) async {
  final controller = Get.find<UserEditProfileController>();
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              controller.getGalleryImage(context);
              Get.back();
            },
            child: Text('Gallery Image',
                style: AppTextStyles.medium.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  // fontFamily: ksecondaryFontFamily,
                  color: AppColors.blackBGColor,
                )),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              controller.getCameraImage(context);
              Get.back();
            },
            child: Text('Camera Image',
                style: AppTextStyles.medium.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackBGColor,
                )),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel',
              style: AppTextStyles.medium.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.blackBGColor,
              )),
        ),
      );
    },
  );
}
