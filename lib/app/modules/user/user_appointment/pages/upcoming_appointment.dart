import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/upcoming_appointment_container.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpcomingAppointment extends GetView<UserAppointmentController> {
  const UpcomingAppointment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const LoadingWidget()
          : controller.upcomingAppointmentList.isEmpty
              ? Center(
                  child: Text(
                    "No Upcoming appointment\nis found.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lighttextColor),
                  ),
                )
              : ListView.builder(
                  padding:
                      EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                  shrinkWrap: true,
                  itemCount: controller.upcomingAppointmentList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: index ==
                                  controller.upcomingAppointmentList.length - 1
                              ? 12 * SizeConfig.heightMultiplier
                              : 0),
                      child: UpcomingAppointmentContainer(
                        isPadding: true,
                        appointmentModel:
                            controller.upcomingAppointmentList[index],
                      ),
                    );
                  },
                ),
    );
  }
}