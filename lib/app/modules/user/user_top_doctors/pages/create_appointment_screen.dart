import 'package:daroon_user/app/modules/user/user_top_doctors/controller/create_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/appointment_toggle_button.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreateAppointmentScreen extends GetView<CreateAppointmentController> {
  CreateAppointmentScreen({super.key});

  final topDoctorData = Get.arguments[0] as TopDoctorModel;
  final officeData = Get.arguments[1] as Office;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAppointmentController>(initState: (_) {
      controller.setData(topDoctorData, officeData);
    }, builder: (_) {
      return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: true,
          title: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              topDoctorData.firstNameEn!,
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackBGColor,
                fontSize: 2 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 2 * SizeConfig.heightMultiplier,
              horizontal: 6 * SizeConfig.widthMultiplier),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Set schedule to make appointment with Dr.${topDoctorData.firstNameEn!}",
                  style: AppTextStyles.normal.copyWith(
                    fontSize: 1.6 * SizeConfig.heightMultiplier,
                    color: AppColors.lighttextColor,
                  ),
                ),
                30.verticalSpace,
                Text(
                  "Select day",
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.lighttextColor,
                  ),
                ),
                const SizedBox(height: 20),
                _buildWeekDaysContainer(context),
                30.verticalSpace,
                Text(
                  "Select Time",
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.lighttextColor,
                  ),
                ),
                20.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 2.5 * SizeConfig.heightMultiplier,
                      horizontal: 4 * SizeConfig.widthMultiplier),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border:
                        Border.all(color: const Color(0xffE8E8E8), width: 0.5),
                  ),
                  child: Column(
                    children: [
                      Obx(() => AppointmentToggleButton(
                            leftText: 'Morning',
                            centreText: 'Evening',
                            value: controller.selectedTab,
                            onValueChange: controller.selectTab,
                          )),
                      30.verticalSpace,
                      Obx(
                        () => GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 14,
                              crossAxisCount: 3,
                              childAspectRatio: 2,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.selectedTab == 0
                                ? controller.morningList.length
                                : controller.eveningList.length,
                            itemBuilder: (context, index) {
                              return _buildTimeContainer(
                                  context,
                                  controller.selectedTab == 0
                                      ? controller.morningList[index]
                                      : controller.eveningList[index],
                                  index);
                            }),
                      )
                    ],
                  ),
                ),
                30.verticalSpace,
                Text(
                  "Select Package",
                  style: AppTextStyles.medium.copyWith(
                    fontSize: 16,
                    color: AppColors.lighttextColor,
                  ),
                ),
                20.verticalSpace,
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 0.4,
                          color: const Color(0xffE0E0E0),
                        )),
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return _buildFeeContainer(
                              index: index,
                              title: index == 0
                                  ? "In-Clinic"
                                  : index == 1
                                      ? "Messaging"
                                      : index == 2
                                          ? "Call"
                                          : "Video Call",
                              subTitle: index == 0
                                  ? "Patient can visit your address."
                                  : index == 1
                                      ? "Patient can send message to you."
                                      : index == 2
                                          ? "Patient can call to your phone number."
                                          : "Use video to consultant.",
                              icon: index == 0
                                  ? Assets.locationIcon
                                  : index == 1
                                      ? Assets.messageIcon
                                      : index == 2
                                          ? "assets/icons/phoneIcon.svg"
                                          : Assets.videoCallIcon,
                              fees: index == 0
                                  ? officeData.fee!.feeClinic!
                                  : index == 1
                                      ? officeData.fee!.feeMessage!
                                      : index == 2
                                          ? officeData.fee!.feeCall!
                                          : officeData.fee!.feeVideoCall!);
                        })),
                20.verticalSpace,
                CommonButton(
                  ontap: () {
                    controller.checkValidation(context);
                  },
                  name: "Next",
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Container _buildFeeContainer({
    required String title,
    required String subTitle,
    required String icon,
    required int fees,
    required int index,
  }) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 || index == 4 ? 0 : 14),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xffF7F5FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                icon,
                colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor, BlendMode.srcIn),
              ),
            ),
          ),
          10.horizontalSpace,
          SizedBox(
            width: MediaQuery.of(Get.context!).size.width * 0.42,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                    fontSize: SizeConfig.heightMultiplier * 1.8,
                  ),
                ),
                2.verticalSpace,
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        subTitle,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff8E8E95),
                          fontSize: SizeConfig.heightMultiplier * 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Text(
            "\$ ${fees.toString()}",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
              fontSize: SizeConfig.heightMultiplier * 2,
            ),
          ),
          SizedBox(width: 3 * SizeConfig.widthMultiplier),
          CustomCupertinoButton(
              onTap: () {
                controller.selectedPacakge.value = index;
              },
              child: Obx(
                () => Container(
                  height: 6 * SizeConfig.heightMultiplier,
                  width: 6 * SizeConfig.widthMultiplier,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.selectedPacakge.value == index
                        ? AppColors.primaryColor
                        : Colors.white,
                    border: Border.all(
                        color: controller.selectedPacakge.value == index
                            ? AppColors.primaryColor
                            : const Color(0xffE8E8E8),
                        width: 0.5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        size: 2 * SizeConfig.heightMultiplier,
                        color: AppColors.whiteBGColor,
                      ),
                    ),
                  ),
                ),
              ))
        ],
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
                controller.setAppointmentData();
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

  SizedBox _buildTimeContainer(BuildContext context, Day dayTime, int index) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: Obx(
        () => CustomCupertinoButton(
          onTap: () {
            if (!dayTime.isBooked!) {
              controller.currentTimeIndex.value = index;
              controller.selectedTime.value = dayTime.time!;
            }
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: dayTime.isBooked!
                      ? const Color(0xffC4C4C4)
                      : AppColors.primaryColor,
                ),
                color: controller.currentTimeIndex.value == index
                    ? AppColors.primaryColor
                    : Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: controller.currentTimeIndex.value == index
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
                dayTime.time!,
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
      ),
    );
  }
}
