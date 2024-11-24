import 'package:daroon_user/app/modules/user/user_top_doctors/controller/top_doctor_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_rating.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DoctorReviews extends GetView<TopDoctorProfileController> {
  const DoctorReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        24.verticalSpace,
        Obx(
          () => controller.isLoading.value
              ? Padding(
                  padding:
                      EdgeInsets.only(top: 20 * SizeConfig.heightMultiplier),
                  child: const LoadingWidget(),
                )
              : controller.doctorRatingList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: 20 * SizeConfig.heightMultiplier),
                      child: const NoDataWidget(text: "No Rating available"))
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.doctorRatingList.length,
                      itemBuilder: (context, index) {
                        return DoctorRatingContainer(
                          doctorRatingModel: controller.doctorRatingList[index],
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

class DoctorRatingContainer extends StatelessWidget {
  final DoctorRatingModel doctorRatingModel;
  const DoctorRatingContainer({
    super.key,
    required this.doctorRatingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2 * SizeConfig.heightMultiplier),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              doctorRatingModel.patient!.profilePicture == null
                  ? Container(
                      height: 5 * SizeConfig.heightMultiplier,
                      width: 5 * SizeConfig.heightMultiplier,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: AppColors.blackBGColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            '${doctorRatingModel.patient!.firstName![0].toUpperCase()}${doctorRatingModel.patient!.username![0].toUpperCase()}',
                            style: AppTextStyles.bold.copyWith(
                              color: Colors.white,
                              fontSize: Spaces.fontSize(fontSize: 16),
                            ),
                          ),
                        ),
                      ))
                  : ClipOval(
                      child: NetWorkImageLoader(
                        shape: BoxShape.circle,
                        boxFit: BoxFit.cover,
                        height: 5 * SizeConfig.heightMultiplier,
                        width: 5 * SizeConfig.heightMultiplier,
                        imageURL:
                            doctorRatingModel.patient!.profilePicture!.bg!,
                      ),
                    ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorRatingModel.patient!.username!,
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBGColor,
                      fontSize: SizeConfig.heightMultiplier * 1.6,
                    ),
                  ),
                  Text(
                    formatDate(doctorRatingModel.createdAt!),
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
                doctorRatingModel.rate.toString(),
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
            doctorRatingModel.comment!,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff484848),
              fontSize: SizeConfig.heightMultiplier * 1.6,
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd-MMM-yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
