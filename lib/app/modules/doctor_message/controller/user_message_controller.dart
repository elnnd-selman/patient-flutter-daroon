import 'dart:convert';

import 'package:daroon_user/app/modules/doctor_message/model/user_message_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/services/api.dart';
import 'package:get/get.dart';

class UserMessageController extends GetxController {
  RxList<UserMessageModelData> doctorConversationList =
      <UserMessageModelData>[].obs;
  RxBool isLoading = false.obs;
  //

  getDoctorAllConversation() async {
    try {
      isLoading.value = true;
      final response = await ApiService.getwithUserToken(
        endPoint: "${AppTokens.apiURl}/conversations",
        userToken: {
          "Authorization":
              "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
        },
      );
      if (response!.statusCode == 200 || response.statusCode == 201) {
        List<dynamic> jsonResponse = jsonDecode(response.body)['data'];

        doctorConversationList.value = jsonResponse
            .map((data) => UserMessageModelData.fromJson(data))
            .toList();
      }
      doctorConversationList
          .sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      printInfo(info: e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getDoctorAllConversation();
  }
}
