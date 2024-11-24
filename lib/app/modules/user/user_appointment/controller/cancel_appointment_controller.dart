// ignore_for_file: use_build_context_synchronously

import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/cancel_appointment_model.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CancelAppointmentController extends GetxController {
  RxInt currentIndex = 0.obs;

  final _processing = false.obs;
  bool get processing => _processing.value;

  final TextEditingController reasonTextField = TextEditingController();

  cancelAppointmentApi(BuildContext context, AppointmentModel appointmentModel,
      String previousCategory, bool isMainPage) async {
    try {
      _processing.value = true;
      final response = await ApiService.patchWithHeader(
        userToken: {
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
        endPoint:
            '${AppTokens.apiURl}/appointments/${appointmentModel.id}/cancelled',
        body: {
          "cancelledReason": currentIndex.value == 4
              ? reasonTextField.text
              : cancelAppointmentList[currentIndex.value].title,
        },
      );
      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          // if (previousCategory == "requesting") {
          //   Get.find<UserAppointmentController>()
          //       .requestAppointmentList
          //       .removeWhere((item) => item.id == appointmentModel.id);
          // } else if (previousCategory == 'upcoming') {
          //   Get.find<UserAppointmentController>()
          //       .upcomingAppointmentList
          //       .removeWhere((item) => item.id == appointmentModel.id);
          // } else if (previousCategory == "confirmed") {
          //   Get.find<UserAppointmentController>()
          //       .confirmedAppointmentList
          //       .removeWhere((item) => item.id == appointmentModel.id);
          // }

          // appointmentModel.cancelledReason = currentIndex.value == 4
          //     ? reasonTextField.text
          //     : cancelAppointmentList[currentIndex.value].title;
          Get.find<UserAppointmentController>().getDoctorAppointments();
          if (isMainPage) {
            Get.back();
          } else {
            Get.back();
            Get.back();
          }

          showToastMessage(
              message: "Appointment cancelled successfully.",
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);
        } else {
          showToastMessage(
              message: response.body,
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.check);
        }
      }
      _processing.value = false;
    } catch (e) {
      _processing.value = false;
      printInfo(info: e.toString());
    }
    _processing.value = false;
  }
}
