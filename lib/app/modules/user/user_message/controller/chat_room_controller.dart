import 'dart:convert';

import 'package:daroon_user/app/modules/user/user_message/model/user_chat_model.dart';
import 'package:daroon_user/app/modules/user/user_message/model/user_message_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_message/model/video_call_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/utils/json_message_extension.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  RxList<UserChatModel> userChatList = <UserChatModel>[].obs;
  RxBool isLoading = false.obs;
  Rxn<ErId> senderUserModel = Rxn();
  Rxn<ErId> receiverUserModel = Rxn();

  //
  Rx<ScrollController> scrollController = ScrollController().obs;

  getUserChatConversation(String chatID) async {
    try {
      isLoading.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/conversations/$chatID/messages",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];

        userChatList.value =
            jsonResponse.map((data) => UserChatModel.fromJson(data)).toList();
        userChatList.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      }

      await movetoEnd();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  RxBool hasScrolled = false.obs;
  setUserData(PatientClass patientClass, PatientClass doctor) {
    senderUserModel.value = ErId(
      id: patientClass.id,
      firstName: patientClass.firstName,
      firstNameKu: patientClass.firstNameKu,
      firstNameEn: patientClass.firstNameEn,
      firstNameAr: patientClass.firstNameAr,
      username: patientClass.username,
      gender: patientClass.gender,
      lastNameKu: patientClass.lastNameKu,
      lastNameAr: patientClass.lastNameAr,
      lastNameEn: patientClass.lastNameEn,
      profilePicture: patientClass.profilePicture,
      isThirdParty: patientClass.isThirdParty,
      usePictureAsLink: patientClass.usePictureAsLink,
      dateOfBirth: patientClass.dateOfBirth,
    );
    receiverUserModel.value = ErId(
      id: doctor.id,
      firstName: doctor.firstName,
      firstNameKu: doctor.firstNameKu,
      firstNameEn: doctor.firstNameEn,
      firstNameAr: doctor.firstNameAr,
      username: doctor.username,
      gender: doctor.gender,
      lastNameKu: doctor.lastNameKu,
      lastNameAr: doctor.lastNameAr,
      lastNameEn: doctor.lastNameEn,
      profilePicture: null,
      isThirdParty: doctor.isThirdParty,
      usePictureAsLink: doctor.usePictureAsLink,
      dateOfBirth: doctor.dateOfBirth,
    );
  }

  movetoEnd() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.value.hasClients) {
        if (!hasScrolled.value) {
          scrollController.value.animateTo(
            scrollController.value.position.maxScrollExtent + 100,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );

          hasScrolled.value = true;
        }
      }
    });
  }

  addNewMessagetoList({
    required String conversationID,
    required String message,
  }) {
    var chatMessage = UserChatModel(
      id: "674a3b629cb7f905513e33ac${userChatList.length + 1}",
      conversation: conversationID,
      senderId: senderUserModel.value,
      receiverId: receiverUserModel.value,
      text: message,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      v: 0,
    );

    String jsonString = jsonEncode(chatMessage.toJson());
    var decodedJson = jsonDecode(jsonString);
    var decodedChatMessage = UserChatModel.fromJson(decodedJson);

    userChatList.add(decodedChatMessage);
    userChatList.refresh();
    endtoChat();
  }

  endtoChat() {
    if (scrollController.value.hasClients) {
      scrollController.value.animateTo(
        scrollController.value.position.maxScrollExtent + 100,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  RxBool processing = false.obs;
  /////////////// Video Call ////////////
  setVideoData(UserMessageModelData data) async {
    processing.value = true;

    if (data.meetingInfo == null) {
      successTextMessage(
          message: "Wait for doctor to create meeting",
          color: const Color(0xffEC1C24),
          icon: Icons.close);
    } else {
      await joinMeeting(data.id!, data);
    }

    processing.value = false;
  }

  Rxn<VideoCallModel> videoModel = Rxn();
  joinMeeting(String conversationID, UserMessageModelData userdata) async {
    try {
      processing.value = true;
      final response = await ApiService.postwithHeader(
          endPoint: "${AppTokens.apiURl}/meeting/$conversationID/participants",
          userToken: {
            "Authorization":
                "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
          },
          body: {
            "conversation_id": conversationID,
          });
      if (response!.statusCode == 200 || response.statusCode == 201) {
        final jsonResponse = jsonDecode(response.body)['data'];
        videoModel.value = VideoCallModel.fromJson(jsonResponse);

        Get.toNamed(Routes.meetingScreen, arguments: [
          userdata,
          true,
          true,
          videoModel.value,
        ]);
      } else {
        successTextMessage(
            message: response.body.extractErrorMessage(),
            color: const Color(0xffEC1C24),
            icon: Icons.close);
      }

      processing.value = false;
    } catch (e) {
      processing.value = false;
      printInfo(info: e.toString());
    }
  }
}
