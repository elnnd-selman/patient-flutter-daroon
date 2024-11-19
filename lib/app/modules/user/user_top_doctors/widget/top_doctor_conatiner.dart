import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:get/get.dart';

class TopDoctorContainer extends StatelessWidget {
  final TopDoctorModel topDoctorModel;
  const TopDoctorContainer({
    super.key,
    required this.topDoctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryborderColor),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.only(left: 14, right: 14, top: 15),
      margin: EdgeInsets.symmetric(
          horizontal: 1 * SizeConfig.widthMultiplier,
          vertical: 1 * SizeConfig.heightMultiplier),
      child: Column(
        children: [
          CustomCupertinoButton(
            onTap: () {
              Get.toNamed(Routes.topDotocrProfileDetail,
                  arguments: [topDoctorModel]);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                topDoctorModel.profilePicture == null
                    ? Container(
                        height: 10 * SizeConfig.heightMultiplier,
                        width: 10 * SizeConfig.heightMultiplier,
                        decoration: BoxDecoration(
                            color: AppColors.blackBGColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              '${topDoctorModel.firstName![0].toUpperCase()}${topDoctorModel.lastNameEn![1].toUpperCase()}',
                              style: AppTextStyles.bold.copyWith(
                                color: Colors.white,
                                fontSize: Spaces.fontSize(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: NetWorkImageLoader(
                          containerColor: Colors.black54,
                          imageURL: topDoctorModel.profilePicture!.bg!,
                          height: 10 * SizeConfig.heightMultiplier,
                          width: 10 * SizeConfig.heightMultiplier,
                        ),
                      ),
                14.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${topDoctorModel.firstNameEn} ${topDoctorModel.lastNameEn}",
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackBGColor,
                            fontSize: SizeConfig.heightMultiplier * 1.8,
                          ),
                        ),
                      ],
                    ),
                    4.verticalSpace,
                    Text(
                      topDoctorModel.speciality == null
                          ? '--'
                          : topDoctorModel
                              .speciality!.specialityEn!.capitalizeFirst!,
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
                          topDoctorModel.speciality == null
                              ? '--'
                              : topDoctorModel
                                  .speciality!.specialityEn!.capitalizeFirst!,
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lighttextColor,
                            fontSize: SizeConfig.heightMultiplier * 1.6,
                          ),
                        ),
                        20.horizontalSpace,
                        Container(
                          height: MediaQuery.of(context).size.height * 0.018,
                          width: 0.5,
                          color: const Color(0xff898A8D),
                        ),
                        20.horizontalSpace,
                        SvgPicture.asset(
                          Assets.ratingStarIcon,
                          height: 15,
                        ),
                        10.horizontalSpace,
                        Text(
                          "4.5",
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.lighttextColor,
                            fontSize: SizeConfig.heightMultiplier * 1.6,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    SizedBox(height: 1 * SizeConfig.heightMultiplier),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.primaryColor,
                          size: 18,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
          CommonButton(ontap: () {}, name: "Make Appointment"),
        ],
      ),
    );
  }
}
