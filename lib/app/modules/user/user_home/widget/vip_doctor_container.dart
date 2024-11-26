import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class VipDoctorContainer extends StatelessWidget {
  final TopDoctorModel topDoctorModel;
  const VipDoctorContainer({
    super.key,
    required this.topDoctorModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  Text(
                    "Dr. ${topDoctorModel.firstName!.capitalizeFirst!} ${topDoctorModel.lastNameEn!.capitalizeFirst}",
                    style: AppTextStyles.semiBold.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: MediaQuery.of(context).size.height * 0.024,
                        color: AppColors.whiteBGColor),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.02,
                        vertical: MediaQuery.of(context).size.height * 0.005),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.whiteBGColor, width: 0.2),
                        color: AppColors.whiteBGColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/vip_star.svg",
                          height: MediaQuery.of(context).size.height * 0.016,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01),
                        Text(
                          "VIP",
                          style: AppTextStyles.normal.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.012,
                              color: AppColors.whiteBGColor),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              6.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.04),
                child: Text(
                  topDoctorModel.speciality == null
                      ? "---"
                      : topDoctorModel
                          .speciality!.specialityEn!.capitalizeFirst!,
                  style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                      color: AppColors.whiteBGColor.withOpacity(0.72)),
                ),
              ),
              const Spacer(),
              CustomCupertinoButton(
                onTap: () {
                  Get.toNamed(Routes.topDotocrProfileDetail, arguments: [
                    topDoctorModel,
                  ]);
                },
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.02,
                    left: MediaQuery.of(context).size.width * 0.04,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1,
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  decoration: BoxDecoration(
                      color: AppColors.whiteBGColor,
                      borderRadius: BorderRadius.circular(4)),
                  child: Center(
                    child: Text(
                      "View Profile",
                      style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.of(context).size.height * 0.016,
                          color: AppColors.primaryColor),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Spacer(),
          Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.32,
                    decoration: BoxDecoration(
                      //  color: Colors.red,
                      image: DecorationImage(
                        image: const AssetImage("assets/images/ellipse.png"),
                        colorFilter: ColorFilter.mode(
                            AppColors.whiteBGColor.withOpacity(.1),
                            BlendMode.srcIn),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: MediaQuery.of(context).size.width * 0.04,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: MediaQuery.of(context).size.width * 0.32,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/onboarding3.png"),
                          // colorFilter: ColorFilter.mode(
                          //     AppColors.whiteBGColor
                          //         .withOpacity(.1),
                          //     BlendMode.srcIn),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
