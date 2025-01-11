import 'dart:convert';

import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/app/model/user_model.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAppointmentController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAppBarOpen = false.obs;

  final TextEditingController review = TextEditingController();

  RxList<AppointmentModel> appointmentModelList = RxList();

  RxInt rating = RxInt(-1);

  RxList<AppointmentModel> cancelAppointmentList = RxList();
  RxList<AppointmentModel> upcomingAppointmentList = RxList();
  RxList<AppointmentModel> confirmedAppointmentList = RxList();
  RxList<AppointmentModel> completedAppointmentList = RxList();
  // RxList<AppointmentModel> pendingAppointmentList = RxList();
  RxList<AppointmentModel> requestAppointmentList = RxList();

// const APPOINTMENTS_STATUS = {
//   PENDING: "pending",
//   CONFIRMED: "confirmed",
//   CANCELLED: "cancelled",
//   UPCOMING: "upcoming",
//   COMPLETED: "completed",
// }

  getDoctorAppointments() async {
    try {
      isLoading.value = true;
      cancelAppointmentList.value = [];

      upcomingAppointmentList.value = [];
      confirmedAppointmentList.value = [];

      completedAppointmentList.value = [];
      requestAppointmentList.value = [];

      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/appointments",
        userToken: {
          "Authorization": "Bearer ${userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];
        appointmentModelList.value = jsonResponse
            .map((data) => AppointmentModel.fromJson(data))
            .toList();

        if (appointmentModelList.isNotEmpty) {
          for (int i = 0; i < appointmentModelList.length; i++) {
            if (appointmentModelList[i].status == "requesting") {
              requestAppointmentList.add(appointmentModelList[i]);
            } else if (appointmentModelList[i].status == "confirmed") {
              confirmedAppointmentList.add(appointmentModelList[i]);
            } else if (appointmentModelList[i].status == "cancelled") {
              cancelAppointmentList.add(appointmentModelList[i]);
            } else if (appointmentModelList[i].status == "upcoming") {
              upcomingAppointmentList.add(appointmentModelList[i]);
            } else {
              completedAppointmentList.add(appointmentModelList[i]);
            }
          }
        }

        upcomingAppointmentList
            .sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
        cancelAppointmentList
            .sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
        completedAppointmentList
            .sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
        confirmedAppointmentList
            .sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));
        requestAppointmentList
            .sort((a, b) => a.updatedAt!.compareTo(b.updatedAt!));

        isLoading.value = false;
      } else {
        isLoading.value = false;
      }
    } catch (e) {
      isLoading.value = false;
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Rxn<UserModel> userModel = Rxn();
  @override
  Future<void> onInit() async {
    super.onInit();

    userModel.value = await Get.find<LocalStorageController>()
        .daroonBox!
        .get("userModel", defaultValue: UserModel);
    await getDoctorAppointments();
  }

/////////////////
  RxInt currentIndex = RxInt(-1);

  RxList<String> weekDaysList = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ].obs;

  RxInt currentTimeIndex = RxInt(-1);
  RxString selectedTime = "".obs;

  RxList<String> weekDaysListFull = [
    "sunday",
    "monday",
    "tuesday",
    "wednesday",
    "thursday",
    "friday",
    "saturday"
  ].obs;

  RxBool processing = false.obs;
  reScheduleAppointment(
    AppointmentModel appointmentModel,
    BuildContext context,
    String appointmetType,
  ) async {
    try {
      processing.value = true;
      final response = await ApiService.putWithHeader(
          userToken: {
            'Content-Type': 'application/json',
            "Authorization":
                "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
          },
          endPoint:
              '${AppTokens.apiURl}/appointments/${appointmentModel.id}/reschedule',
          body: {
            "selectedDay": weekDaysListFull[currentIndex.value],
            "selectedTime": selectedTime.value,
          });

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (appointmetType == "completed") {
            completedAppointmentList
                .removeWhere((item) => item.id == appointmentModel.id);

            requestAppointmentList.add(appointmentModel);
          }
          Get.back();
          showToastMessage(
              message:
                  'You send a request for appointment with Dr.${appointmentModel.doctor!.firstName!}',
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        } else {
          showToastMessage(
              message: response.body.extractErrorMessage(),
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      }
      processing.value = false;
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }

  final _confirmProcessing = false.obs;
  bool get confirmProcessing => _confirmProcessing.value;
  confirmAppointment(
    AppointmentModel appointmentModel,
    BuildContext context,
    String status,
    bool isMain,
  ) async {
    try {
      _confirmProcessing.value = true;
      final response = await ApiService.patchWithHeader(
          userToken: {
            'Content-Type': 'application/json',
            "Authorization":
                "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
          },
          endPoint:
              '${AppTokens.apiURl}/appointments/${appointmentModel.id}/confirmed',
          body: {});

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          requestAppointmentList
              .removeWhere((item) => item.id == appointmentModel.id);
          confirmedAppointmentList.add(appointmentModel);
          if (!isMain) {
            Get.back();
          }
          _confirmProcessing.value = false;
          showToastMessage(
              message: "Successfully confirmed appointmetnt",
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);
        } else {
          _confirmProcessing.value = false;
          showToastMessage(
              message: response.body.extractErrorMessage(),
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      _confirmProcessing.value = false;
    }
  }

  reviewAppointment(
    AppointmentModel appointmentModel,
    BuildContext context,
  ) async {
    try {
      processing.value = true;
      final response = await ApiService.postwithHeader(
          userToken: {
            'Content-Type': 'application/json',
            "Authorization":
                "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
          },
          endPoint:
              '${AppTokens.apiURl}/appointments/${appointmentModel.id}/ratting',
          body: {
            "rate": 4,
            "comment": "Here is Comment",
          });

      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          rating.value = -1;
          review.clear();
          Get.back();
          showToastMessage(
              message:
                  "You submit your review for ${appointmentModel.doctor!.firstName!} successfully.",
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xff5BA66B),
              icon: Icons.check);
        } else {
          final jsonData = jsonDecode(response.body);

          showToastMessage(
              message: jsonData['message'],
              // ignore: use_build_context_synchronously
              context: context,
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      }
      processing.value = false;
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }

  removeAppointment(
    AppointmentModel appointmentModel,
    BuildContext context,
  ) async {
    try {
      processing.value = true;
      final response = await ApiService.deleteWithHeader(
        userToken: {
          'Content-Type': 'application/json',
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
        endPoint:
            '${AppTokens.apiURl}/appointments/${appointmentModel.id}/delete',
        body: {},
      );
      // print(response!.body);
      if (response != null) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          cancelAppointmentList
              .removeWhere((item) => item.id == appointmentModel.id);
          processing.value = false;
          successTextMessage(
              message: "Successfully deleted appointment.",
              // ignore: use_build_context_synchronously

              color: const Color(0xff5BA66B),
              icon: Icons.check);
        } else {
          processing.value = false;

          successTextMessage(
              message: response.body.extractErrorMessage(),
              // ignore: use_build_context_synchronously
              color: const Color(0xffEC1C24),
              icon: Icons.close);
        }
      }
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }

  RxList<Day> appointmentTimeList = <Day>[].obs;
  setAppointmentData(AppointmentTimes appointmentTimes) {
    appointmentTimeList.value = [];

    if (currentIndex.value == 0) {
      appointmentTimeList.value = appointmentTimes.sunday;
    } else if (currentIndex.value == 1) {
      appointmentTimeList.value = appointmentTimes.monday;
    } else if (currentIndex.value == 2) {
      appointmentTimeList.value = appointmentTimes.tuesday;
    } else if (currentIndex.value == 3) {
      appointmentTimeList.value = appointmentTimes.wednesday;
    } else if (currentIndex.value == 4) {
      appointmentTimeList.value = appointmentTimes.thursday;
    } else if (currentIndex.value == 5) {
      appointmentTimeList.value = appointmentTimes.friday;
    } else if (currentIndex.value == 6) {
      appointmentTimeList.value = appointmentTimes.saturday;
    }
  }

  //////////
  RxBool isSearch = false.obs;
  final searchTextField = TextEditingController();

  TabController? tabController;
  RxList<AppointmentModel> serachAppointmentList = RxList();
  serachAppointment(String query) {
    // FocusManager.instance.primaryFocus?.unfocus();
    serachAppointmentList.value = [];
    List<AppointmentModel> tempAppointment = [];
    if (tabController!.index == 0) {
      tempAppointment = requestAppointmentList;
    } else if (tabController!.index == 1) {
      tempAppointment = upcomingAppointmentList;
    } else if (tabController!.index == 2) {
      tempAppointment = confirmedAppointmentList;
    } else if (tabController!.index == 3) {
      tempAppointment = completedAppointmentList;
    } else if (tabController!.index == 4) {
      tempAppointment = cancelAppointmentList;
    }

    serachAppointmentList.value = tempAppointment
        .where((message) =>
            message.fullName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  Future<void> refreshAppointment() async {
    await getDoctorAppointments();
    await Future.delayed(const Duration(seconds: 2));
  }
}
