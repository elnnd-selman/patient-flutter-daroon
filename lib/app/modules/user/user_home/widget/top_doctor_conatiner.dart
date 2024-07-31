import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class TopDoctorContainer extends StatelessWidget {
  const TopDoctorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryborderColor),
          borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      margin: EdgeInsets.symmetric(horizontal: 1 * SizeConfig.widthMultiplier),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 10 * SizeConfig.heightMultiplier,
                width: 10 * SizeConfig.heightMultiplier,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/temp3.png"),
                    ),
                    borderRadius: BorderRadius.circular(12)),
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
                        "Dr. Doctor Name",
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
                    "Specialist",
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
                        "Level name",
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
          SizedBox(height: 1 * SizeConfig.heightMultiplier),
          CommonButton(ontap: () {}, name: "Make Appointment"),
        ],
      ),
    );
  }
}
