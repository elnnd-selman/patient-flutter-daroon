// ignore_for_file: use_build_context_synchronously

import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAppointmentController extends GetxController {
  RxInt currentIndex = RxInt(-1);
  RxInt currentTimeIndex = RxInt(-1);
  RxInt selectedGender = RxInt(-1);
  RxString selectedTime = ''.obs;

  RxList<String> weekDaysList = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ].obs;

  RxList<String> bookForList = [
    "For Brother",
    "For Mother",
    "For Father",
    "Your Self",
    "other",
  ].obs;
  RxString bookFor = ''.obs;

  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;

  RxInt selectedPacakge = RxInt(-1);

  void selectTab(int value) async {
    currentTimeIndex.value = -1;
    _selectedTab.value = value;
  }

  Rxn<TopDoctorModel> topDoctorModel = Rxn();
  Rxn<Office> officeAddreesModel = Rxn();

  RxBool processing = false.obs;
  setData(TopDoctorModel doctorData, Office officeModel) {
    processing.value = true;
    topDoctorModel.value = doctorData;
    officeAddreesModel.value = officeModel;
  }

  RxList<Day> morningList = <Day>[].obs;
  RxList<Day> eveningList = <Day>[].obs;

  setAppointmentData() {
    morningList.value = [];
    eveningList.value = [];

    if (officeAddreesModel.value!.appointmentTimes != null) {
      final appointmentTimes = officeAddreesModel.value!.appointmentTimes;
      if (currentIndex.value == 0) {
        final data = splitByTimeOfDay(appointmentTimes!.sunday);
        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      } else if (currentIndex.value == 1) {
        final data = splitByTimeOfDay(appointmentTimes!.monday);
        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      } else if (currentIndex.value == 2) {
        final data = splitByTimeOfDay(appointmentTimes!.tuesday);
        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      } else if (currentIndex.value == 3) {
        final data = splitByTimeOfDay(appointmentTimes!.wednesday);
        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      } else if (currentIndex.value == 4) {
        final data = splitByTimeOfDay(appointmentTimes!.thursday);
        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      } else if (currentIndex.value == 5) {
        final data = splitByTimeOfDay(appointmentTimes!.friday);
        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      } else if (currentIndex.value == 6) {
        final data = splitByTimeOfDay(appointmentTimes!.saturday);

        morningList.value = data["morning"]!;
        eveningList.value = data["evening"]!;
      }
    }
  }

  Map<String, List<Day>> splitByTimeOfDay(List<Day> times) {
    List<Day> morningTimes = [];
    List<Day> eveningTimes = [];

    for (int i = 0; i < times.length; i++) {
      var hour = int.parse(times[i].time!.split(':')[0]);

      if (hour >= 8 && hour < 12) {
        // Morning: 8 AM to 11:59 AM
        morningTimes.add(times[i]);
      } else {
        // Evening: 12 PM onward
        eveningTimes.add(times[i]);
      }
    }

    return {
      'morning': morningTimes,
      'evening': eveningTimes,
    };
  }

  checkValidation(BuildContext context) {
    if (currentIndex.value == -1 ||
        currentTimeIndex.value == -1 ||
        selectedPacakge.value == -1) {
      if (currentIndex.value == -1) {
        showToastMessage(
            message: "Please select day",
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
        return;
      } else if (currentTimeIndex.value == -1) {
        showToastMessage(
            message: "Please select time",
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
        return;
      } else {
        showToastMessage(
            message: "Please select package",
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
      }
    } else {
      Get.toNamed(Routes.createPatientDetail);
    }
  }

  /////////////
  final TextEditingController name = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController extraInfo = TextEditingController();

  checkPaitentValidation(BuildContext context) {
    if (bookFor.value == "") {
      showToastMessage(
          message: "Please booking  for",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
      return;
    } else if (name.text.isEmpty) {
      showToastMessage(
          message: "Please enter name",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
      return;
    } else if (age.text.isEmpty) {
      showToastMessage(
          message: "Please enter age",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
      return;
    } else if (selectedGender.value == -1) {
      showToastMessage(
          message: "Please select gender",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
      return;
    } else if (extraInfo.text.isEmpty) {
      showToastMessage(
          message: "Please enter extra info",
          context: context,
          color: const Color(0xffEC1C24),
          icon: Icons.close);
      return;
    } else {
      createAppointment(context);
    }
  }

  RxBool loading = false.obs;
  createAppointment(BuildContext context) async {
    loading.value = true;
    FocusManager.instance.primaryFocus?.unfocus();
    final response = await ApiService.postwithHeader(
      userToken: {
        'Content-Type': 'application/json',
        'Authorization':
            "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      },
      endPoint: '${AppTokens.apiURl}/appointments',
      body: {
        "doctor": topDoctorModel.value!.id!,
        "office": officeAddreesModel.value!.id,
        "selectedDay": currentIndex.value == 0
            ? "sunday"
            : currentIndex.value == 1
                ? "monday"
                : currentIndex.value == 2
                    ? "tuesday"
                    : currentIndex.value == 3
                        ? "wednesday"
                        : currentIndex.value == 4
                            ? "thursday"
                            : currentIndex.value == 5
                                ? "friday"
                                : "saturday",
        "selectedTime": selectedTime.value,
        "age": int.parse(age.text),
        "fullName": name.text,
        "gender": selectedGender.value == 0 ? "male" : 'female',
        "appointmentType": [
          selectedPacakge.value == 0
              ? "feeClinic"
              : selectedPacakge.value == 1
                  ? "feeMessage"
                  : selectedPacakge.value == 2
                      ? "feeCall"
                      : "feeVideoCall"
        ],
        "dateOfBirth": "2004-08-09",
        "extraInformation": extraInfo.text,
        "bookedFor": bookFor.value
      },
    );

    if (response != null) {
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.back();
        Get.back();
        Get.back();
        showToastMessage(
            message: "Successfully book appointmetn.",
            context: context,
            color: const Color(0xff5BA66B),
            icon: Icons.check);
        loading.value = false;
      } else {
        showToastMessage(
            message: response.body,
            context: context,
            color: const Color(0xffEC1C24),
            icon: Icons.close);
        loading.value = false;
        loading.value = false;
      }
    } else {
      loading.value = false;
    }
  }
}
