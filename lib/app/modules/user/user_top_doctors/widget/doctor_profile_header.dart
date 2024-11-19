import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorProfileHeadrer extends StatelessWidget {
  final TopDoctorModel topDoctorModel;
  const DoctorProfileHeadrer({
    super.key,
    required this.topDoctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        topDoctorModel.profilePicture == null
            ? Container(
                height: 10 * SizeConfig.heightMultiplier,
                width: 10 * SizeConfig.heightMultiplier,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.blackBGColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      '${topDoctorModel.firstName![0].toUpperCase()}${topDoctorModel.lastNameEn![0].toUpperCase()}',
                      style: AppTextStyles.bold.copyWith(
                        color: Colors.white,
                        fontSize: Spaces.fontSize(fontSize: 18),
                      ),
                    ),
                  ),
                ))
            : Container(
                height: 10 * SizeConfig.heightMultiplier,
                width: 10 * SizeConfig.heightMultiplier,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.blackBGColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: NetWorkImageLoader(
                    imageURL: topDoctorModel.profilePicture!.bg!,
                    height: 10 * SizeConfig.heightMultiplier,
                    width: 10 * SizeConfig.heightMultiplier,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
        14.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1 * SizeConfig.heightMultiplier),
            Text(
              "${topDoctorModel.firstNameEn} ${topDoctorModel.lastNameEn!}",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackBGColor,
                fontSize: SizeConfig.heightMultiplier * 1.8,
              ),
            ),
            4.verticalSpace,
            Text(
              "${topDoctorModel.speciality == null ? "--" : topDoctorModel.speciality!.specialityEn}",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.lighttextColor,
                fontSize: SizeConfig.heightMultiplier * 1.6,
              ),
            ),
            4.verticalSpace,
            Row(
              children: [
                SvgPicture.asset(
                  Assets.levelIcon,
                  height: 15,
                ),
                10.horizontalSpace,
                Text(
                  "${topDoctorModel.level == null ? "--" : topDoctorModel.level!.levelEn}",
                  style: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.lighttextColor,
                    fontSize: SizeConfig.heightMultiplier * 1.6,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
