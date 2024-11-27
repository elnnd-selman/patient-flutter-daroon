import 'dart:convert';

import 'package:daroon_user/app/modules/doctor_message/model/user_chat_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomController extends GetxController {
  RxList<UserChatModel> userChatList = <UserChatModel>[].obs;
  RxBool isLoading = false.obs;
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

  movetoEnd() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!hasScrolled.value) {
        scrollController.value.animateTo(
          scrollController.value.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );

        hasScrolled.value = true;
      }
    });
  }
}
