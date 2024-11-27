import 'package:daroon_user/app/modules/user/user_podcast/model/user_presenter_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMostActiveContainer extends StatelessWidget {
  final UserPresenterModel userPresenterModel;
  const UserMostActiveContainer({
    super.key,
    required this.userPresenterModel,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoButton(
      onTap: () {
        Get.toNamed(Routes.userPresenterProfile, arguments: [
          userPresenterModel.firstName,
          userPresenterModel.lastNameEn,
          userPresenterModel.id
        ]);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 22),
        decoration: BoxDecoration(
            color: AppColors.whiteBGColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xffE8E8E8),
            )),
        child: Row(
          children: [
            userPresenterModel.profilePicture == null
                ? Container(
                    height: 10 * SizeConfig.heightMultiplier,
                    width: 10 * SizeConfig.heightMultiplier,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.blackBGColor,
                      // color: const Color(0xffFFFFFF).withOpacity(.3),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          '${userPresenterModel.firstNameEn![0].toUpperCase()}${userPresenterModel.lastNameEn![0].toUpperCase()}',
                          style: AppTextStyles.bold.copyWith(
                            color: Colors.white,
                            fontSize: Spaces.fontSize(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: NetWorkImageLoader(
                      imageURL: userPresenterModel.profilePicture!.bg!,
                      height: 10 * SizeConfig.heightMultiplier,
                      width: 10 * SizeConfig.heightMultiplier,
                      // containerColor: const Color(0xffFFFFFF).withOpacity(.3),
                      shape: BoxShape.circle,
                      boxFit: BoxFit.fill,
                    ),
                  ),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
            ),
            14.horizontalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userPresenterModel.firstName!,
                  style: AppTextStyles.semiBold
                      .copyWith(color: AppColors.blackBGColor, fontSize: 18),
                ),
                Text(
                  "@${userPresenterModel.lastNameEn!}",
                  style: AppTextStyles.medium
                      .copyWith(color: AppColors.lighttextColor, fontSize: 16),
                ),
                10.verticalSpace,
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: 4),
                  height: 0.5,
                  width: 50 * SizeConfig.widthMultiplier,
                  color: const Color(0xffE8E8E8),
                ),
                10.verticalSpace,
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
                  decoration: BoxDecoration(
                      color: const Color(0xffE8E8E8).withOpacity(.15),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xffE8E8E8),
                      )),
                  child: Row(
                    children: [
                      Text(
                        "Podcast",
                        style: AppTextStyles.normal.copyWith(
                            fontSize: 14, color: AppColors.lighttextColor),
                      ),
                      10.horizontalSpace,
                      Text(
                        "+30",
                        style: AppTextStyles.normal.copyWith(
                            fontSize: 14, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
