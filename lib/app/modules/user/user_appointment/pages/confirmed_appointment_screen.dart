import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/confirmed_appointment_container.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/upcoming_appointment_container.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmedAppointmentScreen extends GetView<UserAppointmentController> {
  const ConfirmedAppointmentScreen({super.key});

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
          : controller.confirmedAppointmentList.isEmpty
              ? Center(
                  child: Text(
                    "No Confirmed appointment\nis found.",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lighttextColor),
                  ),
                )
              : controller.isSearch.value
                  ? controller.serachAppointmentList.isEmpty
                      ? Center(
                          child: Text(
                            "No Confirmed appointment\nis found.",
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
                          itemCount: controller.serachAppointmentList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: index ==
                                          controller.serachAppointmentList
                                                  .length -
                                              1
                                      ? 12 * SizeConfig.heightMultiplier
                                      : 0),
                              child: ConfirmedAppointmentContainer(
                                  appointmentModel:
                                      controller.serachAppointmentList[index]),
                            );
                          })
                  : ListView.builder(
                      padding:
                          EdgeInsets.only(top: 2 * SizeConfig.heightMultiplier),
                      shrinkWrap: true,
                      itemCount: controller.confirmedAppointmentList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: index ==
                                      controller
                                              .confirmedAppointmentList.length -
                                          1
                                  ? 12 * SizeConfig.heightMultiplier
                                  : 0),
                          child: ConfirmedAppointmentContainer(
                              appointmentModel:
                                  controller.confirmedAppointmentList[index]),
                        );
                      }),
    );
  }
}
