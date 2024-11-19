import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorReviews extends StatelessWidget {
  const DoctorReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
              border:
                  Border.all(color: AppColors.secondaryborderColor, width: 0.5),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 5 * SizeConfig.heightMultiplier,
                    width: 5 * SizeConfig.heightMultiplier,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/tempImages.png"),
                        ),
                        shape: BoxShape.circle),
                  ),
                  12.horizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dr. Doctor Name",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackBGColor,
                          fontSize: SizeConfig.heightMultiplier * 1.6,
                        ),
                      ),
                      Text(
                        "10-Jun-2020",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff717171),
                          fontSize: SizeConfig.heightMultiplier * 1.6,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    Assets.ratingStarIcon,
                    height: 16,
                  ),
                  6.horizontalSpace,
                  Text(
                    "4.5",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.lighttextColor,
                      fontSize: SizeConfig.heightMultiplier * 1.4,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2.5 * SizeConfig.heightMultiplier),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a form of a   form of a  document In publishing and graphic design form of a  document ...",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff484848),
                  fontSize: SizeConfig.heightMultiplier * 1.6,
                ),
              ),
              SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "Delete",
                  style: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffFF0000),
                    fontSize: SizeConfig.heightMultiplier * 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
