import 'package:daroon_user/app/modules/user/user_top_doctors/controller/top_doctor_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfileHeaderRow extends StatelessWidget {
  final TopDoctorModel topDoctorModel;
  const DoctorProfileHeaderRow({super.key, required this.topDoctorModel});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Expanded(child: SizedBox()),
          _headerText(
            title: "+${topDoctorModel.completedAppointments}",
            subTitle: "Patients",
          ),
          const Expanded(child: SizedBox()),
          const HorizontalDivider(),
          const Expanded(child: SizedBox()),
          _headerText(
            title: "+${topDoctorModel.experienceByYear}",
            subTitle: "Year Exp.",
          ),
          const Expanded(child: SizedBox()),
          const HorizontalDivider(),
          const Expanded(child: SizedBox()),
          Obx(
            () => _headerText(
              title:
                  "+${Get.find<TopDoctorProfileController>().doctorRatingList.length}",
              subTitle: "Reviews",
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Column _headerText({
    required String title,
    required String subTitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$title  ",
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color(0xff11142D),
            fontSize: SizeConfig.heightMultiplier * 2,
          ),
        ),
        // 4.verticalSpace,
        Text(
          subTitle,
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xff707281),
            fontSize: SizeConfig.heightMultiplier * 1.6,
          ),
        ),
      ],
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  final Color? dividerColor;
  const HorizontalDivider({
    super.key,
    this.dividerColor = const Color(0xffE4E4E4),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 12.responsiveWidth),
      width: 1,
      color: dividerColor,
    );
  }
}
