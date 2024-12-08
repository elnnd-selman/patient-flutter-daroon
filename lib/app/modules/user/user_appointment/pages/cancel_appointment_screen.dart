import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/cancel_appointment_container.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/upcoming_appointment_container.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelAppointmentScreen extends GetView<UserAppointmentController> {
  const CancelAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? ListView.builder(
              // padding:
              //     EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return const UpcomingAppointmentContainer(
                  isLoading: true,
                  isPadding: false,
                );
              },
            )
          : controller.cancelAppointmentList.isEmpty
              ? Center(
                  child: Text(
                    "No Cancel appointment\nis found.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lighttextColor),
                  ),
                )
              : controller.processing.value
                  ? const LoadingWidget()
                  : controller.isSearch.value
                      ? controller.serachAppointmentList.isEmpty
                          ? Center(
                              child: Text(
                                "No Cancel appointment\nis found.",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.medium.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.lighttextColor),
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.only(
                                  top: 2 * SizeConfig.heightMultiplier),
                              shrinkWrap: true,
                              itemCount:
                                  controller.cancelAppointmentList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: index ==
                                              controller.cancelAppointmentList
                                                      .length -
                                                  1
                                          ? 12 * SizeConfig.heightMultiplier
                                          : 0),
                                  child: CancelAppointmentContainer(
                                    appointmentModel:
                                        controller.cancelAppointmentList[index],
                                  ),
                                );
                              })
                      : ListView.builder(
                          padding: EdgeInsets.only(
                              top: 2 * SizeConfig.heightMultiplier),
                          shrinkWrap: true,
                          itemCount: controller.cancelAppointmentList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: index ==
                                          controller.cancelAppointmentList
                                                  .length -
                                              1
                                      ? 12 * SizeConfig.heightMultiplier
                                      : 0),
                              child: CancelAppointmentContainer(
                                appointmentModel:
                                    controller.cancelAppointmentList[index],
                              ),
                            );
                          }),
    );
  }
}
