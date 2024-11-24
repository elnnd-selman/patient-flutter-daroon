import 'package:daroon_user/app/modules/user/user_appointment/controller/cancel_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/cancel_appointment_model.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelAppointmentDetail extends GetView<CancelAppointmentController> {
  const CancelAppointmentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        // leading: const SizedBox(),
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          "Cancel Appointment",
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackBGColor,
            fontSize: 2 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 6 * SizeConfig.widthMultiplier),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  Text(
                    "Please select a reason for cancelation :",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.lighttextColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: cancelAppointmentList.length,
                    itemBuilder: (context, index) {
                      return CustomCupertinoButton(
                        onTap: () {
                          controller.currentIndex.value = index;
                        },
                        child: _buildForgetContainer(index),
                      );
                    },
                  ),
                  25.verticalSpace,
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 0.4,
                    color: const Color(0xffC4C4C4),
                  ),
                  25.verticalSpace,
                  Text(
                    "Other",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.blackBGColor,
                      fontSize: 16,
                    ),
                  ),
                  15.verticalSpace,
                  TextFormField(
                    controller: controller.reasonTextField,
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.blackBGColor,
                    ),
                    maxLines: 10,
                    cursorColor: Colors.black12,
                    cursorWidth: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 20),
                      fillColor: const Color(0xffF7F7F8),
                      filled: true,
                      errorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      isDense: true,
                      hintText: "Enter your reason..",
                      hintStyle: AppTextStyles.medium.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: const Color(0xffA0A1AB),
                      ),
                    ),
                  ),
                  SizedBox(height: 7 * SizeConfig.heightMultiplier),
                  CommonButton(
                      ontap: () {
                        if (controller.currentIndex.value == 4) {
                          if (controller.reasonTextField.text.isNotEmpty) {
                            controller.cancelAppointmentApi(
                              context,
                              Get.arguments[0],
                              Get.arguments[1],
                              Get.arguments[2],
                            );
                          } else {
                            showToastMessage(
                                message: "Please give reason",
                                context: context,
                                color: const Color(0xffEC1C24),
                                icon: Icons.check);
                          }
                        } else {
                          controller.cancelAppointmentApi(
                            context,
                            Get.arguments[0],
                            Get.arguments[1],
                            Get.arguments[2],
                          );
                        }
                        // showToastMessage(
                        //     message: "Appointment cancelled successfully.",
                        //     context: context,
                        //     color: const Color(0xff5BA66B),
                        //     icon: Icons.check);

                        // Future.delayed(const Duration(seconds: 1), () {
                        //   Get.back();
                        //   Get.offAndToNamed(Routes.doctorAppointmentDetail,
                        //       arguments: {
                        //         "buttonName": "cancelled",
                        //         "type": "cancelled",
                        //         "textColor": const Color(0xffEC1C24),
                        //         "isReschedule": false,
                        //         "title": "Cancelled Appointment",
                        //         "showButton": false,
                        //       });
                        // });
                      },
                      name: "Send"),
                ],
              ),
            ),
          ),
          Obx(() {
            if (controller.processing) {
              return const LoadingOverlay();
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }

  Obx _buildForgetContainer(int index) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          children: [
            Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppColors.primaryColor, width: 1.5)),
                child: Padding(
                  padding: const EdgeInsets.all(3.5),
                  child: Container(
                    height: 12,
                    width: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentIndex.value == index
                          ? AppColors.primaryColor
                          : Colors.transparent,
                    ),
                  ),
                )),
            10.horizontalSpace,
            Text(cancelAppointmentList[index].title,
                style: AppTextStyles.bold.copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blackBGColor,
                )),
          ],
        ),
      ),
    );
  }
}
