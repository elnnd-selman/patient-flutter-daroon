import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeAppointmentTimeBottomSheet
    extends GetView<UserAppointmentController> {
  final AppointmentModel appointmentModel;
  const ChangeAppointmentTimeBottomSheet({
    super.key,
    required this.appointmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Obx(
          () => controller.processing.value
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20 * SizeConfig.heightMultiplier),
                      child: const Center(child: LoadingWidget()),
                    ),
                  ],
                )
              : Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        height: 5,
                        width: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xffC4C4C4),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Reschedule",
                      style: AppTextStyles.medium
                          .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: .5,
                      decoration: BoxDecoration(
                        color: AppColors.blackBGColor.withOpacity(.25),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select day",
                            style: AppTextStyles.medium.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.lighttextColor),
                          ),
                          const SizedBox(height: 20),
                          _buildWeekDaysContainer(context),
                          24.verticalSpace,
                          Text(
                            "Select Time",
                            style: AppTextStyles.medium.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.lighttextColor),
                          ),
                          const SizedBox(height: 20),
                          _buildTimeContainer(context),
                          30.verticalSpace,
                          CommonButton(
                              ontap: () {
                                if (controller.currentIndex.value == -1 ||
                                    controller.currentTimeIndex.value == -1) {
                                  if (controller.currentIndex.value == -1) {
                                    showToastMessage(
                                        message: "Please select day",
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        color: const Color(0xffEC1C24),
                                        icon: Icons.close);
                                    return;
                                  } else if (controller
                                          .currentTimeIndex.value ==
                                      -1) {
                                    showToastMessage(
                                        message: "Please select time",
                                        // ignore: use_build_context_synchronously
                                        context: context,
                                        color: const Color(0xffEC1C24),
                                        icon: Icons.close);
                                    return;
                                  }
                                } else {
                                  controller.reScheduleAppointment(
                                      appointmentModel, context, "completed");
                                }
                              },
                              name: "Send Change Request"),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  SizedBox _buildWeekDaysContainer(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: ListView.builder(
          itemCount: controller.weekDaysList.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return CustomCupertinoButton(
              onTap: () {
                controller.currentIndex.value = index;
                final officeData = appointmentModel.office!.appointmentTimes;
                controller.setAppointmentData(officeData!);
              },
              child: Obx(
                () => Container(
                  width: MediaQuery.of(context).size.width * 0.12,
                  margin: EdgeInsets.only(right: index == 7 ? 0 : 10),
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //     // color: controller.currentIndex.value == index
                      //     //     ? Colors.transparent
                      //     //     : const Color(0xffE0E0E0),
                      //     ),
                      color: controller.currentIndex.value == index
                          ? AppColors.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: controller.currentIndex.value == index
                          ? [
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(.1),
                                offset: const Offset(0, 0),
                                blurRadius: 1,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(.1),
                                offset: const Offset(0, 2),
                                blurRadius: 2,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(.1),
                                offset: const Offset(0, 4),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(.1),
                                offset: const Offset(0, 8),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                              BoxShadow(
                                color: AppColors.primaryColor.withOpacity(.05),
                                offset: const Offset(0, 12),
                                blurRadius: 3,
                                spreadRadius: 0,
                              ),
                            ]
                          : null),
                  child: Center(
                    child: Text(
                      controller.weekDaysList[index],
                      style: AppTextStyles.medium.copyWith(
                        fontWeight: controller.currentIndex.value == index
                            ? FontWeight.w500
                            : FontWeight.w300,
                        color: controller.currentIndex.value == index
                            ? AppColors.whiteBGColor
                            : AppColors.blackBGColor,
                        fontSize: SizeConfig.heightMultiplier * 1.7,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  SizedBox _buildTimeContainer(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: controller.currentIndex.value == -1
            ? const NoDataWidget(text: "Please select day")
            : ListView.builder(
                itemCount: controller.appointmentTimeList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CustomCupertinoButton(
                    onTap: () {
                      if (!controller.appointmentTimeList[index].isBooked!) {
                        controller.currentTimeIndex.value = index;
                        controller.selectedTime.value =
                            controller.appointmentTimeList[index].time!;
                      }
                    },
                    child: Obx(
                      () => Container(
                        width: MediaQuery.of(context).size.width * 0.20,
                        margin: EdgeInsets.only(right: index == 7 ? 0 : 10),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: controller
                                      .appointmentTimeList[index].isBooked!
                                  ? const Color(0xffC4C4C4)
                                  : AppColors.primaryColor,
                            ),
                            color: controller.currentTimeIndex.value == index
                                ? AppColors.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow:
                                controller.currentTimeIndex.value == index
                                    ? [
                                        BoxShadow(
                                          color: AppColors.primaryColor
                                              .withOpacity(.1),
                                          offset: const Offset(0, 0),
                                          blurRadius: 1,
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: AppColors.primaryColor
                                              .withOpacity(.1),
                                          offset: const Offset(0, 2),
                                          blurRadius: 2,
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: AppColors.primaryColor
                                              .withOpacity(.1),
                                          offset: const Offset(0, 4),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: AppColors.primaryColor
                                              .withOpacity(.1),
                                          offset: const Offset(0, 8),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: AppColors.primaryColor
                                              .withOpacity(.05),
                                          offset: const Offset(0, 12),
                                          blurRadius: 3,
                                          spreadRadius: 0,
                                        ),
                                      ]
                                    : null),
                        child: Center(
                          child: Text(
                            controller.appointmentTimeList[index].time!,
                            style: AppTextStyles.medium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: controller.currentTimeIndex.value == index
                                  ? AppColors.whiteBGColor
                                  : AppColors.blackBGColor,
                              fontSize: SizeConfig.heightMultiplier * 1.7,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
