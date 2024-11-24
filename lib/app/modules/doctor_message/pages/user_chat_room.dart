// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:daroon_user/app/modules/doctor_message/controller/chat_room_controller.dart';
import 'package:daroon_user/app/modules/doctor_message/model/user_message_model.dart';
import 'package:daroon_user/app/modules/doctor_message/widget/chat_title.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/app_tokens.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:get/get.dart';

class UserChatPage extends StatefulWidget {
  const UserChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _UserChatPageState createState() => _UserChatPageState();
}

final ctrl = Get.put(ChatRoomController());

class _UserChatPageState extends State<UserChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            _topChat(),
            _bodyChat(),
            _formChat(),
          ],
        ),
      ),
    );
  }

  late io.Socket socket;
  late UserMessageModelData userMessageModelData;
  @override
  void initState() {
    super.initState();
    userMessageModelData = Get.arguments[0];
    connect();
    ctrl.getUserChatConversation(userMessageModelData.id!);
  }

  Future<void> connect() async {
    print(userMessageModelData.id!);
    socket = io.io(AppTokens.apiURl, <String, dynamic>{
      'autoConnect': true,
      'transports': ['websocket'],
    });

    joinChat();
    socket.on("new_message", (msg) {
      print(msg);
    });
    socket.onConnect((_) {
      print('connect');
      // socket.emit('msg', 'test');
    });

    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));
    socket.onConnect((val) {
      print(val);
      print("frfr");
    });
    print(socket.connected);
  }

  getData() {
    try {
      socket.onConnect((data) {
        print("Connected");
        print(data);
      });
    } catch (e) {
      print(e.toString());
    }
  }

  joinChat() async {
    socket.emit("join_conversation", [
      userMessageModelData.id!,
      "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
    ]);
  }

  sendMessage() {
    print(userMessageModelData.id);
    socket.emit("send_message", {
      'conversationId': userMessageModelData.id!,
      "token":
          "Bearer ${Get.find<UserHomeController>().userModel.value!.token!}",
      "text": "Test Chehcefhf",
    });
  }

  void listenForMessages() {
    socket.on('new_message', (data) {
      // Handle the received message
      print('Received message: $data');
      // Update your UI or perform other actions based on the message
    });
  }

  _topChat() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CustomCupertinoButton(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.arrow_back_ios,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {
                  socket.onConnect((val) {});
                  // connect();
                  // joinChat();
                  // sendMessage();

                  // getData();
                  // sendMessage();
                },
                child: Text(
                  "${userMessageModelData.doctor!.firstNameEn!.capitalizeFirst!} ${userMessageModelData.doctor!.lastNameEn!.capitalizeFirst!}",
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: const Icon(
                  Icons.call,
                  size: 25,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black12,
                ),
                child: const Icon(
                  Icons.videocam,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _bodyChat() {
    return Expanded(
      child: Container(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 0),
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45)),
            color: Colors.white,
          ),
          child: Obx(
            () => ctrl.isLoading.value
                ? const LoadingWidget()
                : ctrl.userChatList.isEmpty
                    ? const NoDataWidget(text: "No chat available")
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: ctrl.userChatList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                bottom: index == ctrl.userChatList.length - 1
                                    ? 14
                                    : 0),
                            child: ChatTitle(
                              showImage: Get.find<UserHomeController>()
                                          .userModel
                                          .value!
                                          .user!
                                          .id ==
                                      ctrl.userChatList[index].senderId!.id!
                                  ? false
                                  : true,
                              firstName: Get.find<UserHomeController>()
                                          .userModel
                                          .value!
                                          .user!
                                          .id ==
                                      ctrl.userChatList[index].senderId!.id!
                                  ? ctrl
                                      .userChatList[index].senderId!.firstName!
                                  : ctrl.userChatList[index].receiverId!
                                      .firstName!,
                              lastName: Get.find<UserHomeController>()
                                          .userModel
                                          .value!
                                          .user!
                                          .id ==
                                      ctrl.userChatList[index].senderId!.id!
                                  ? ctrl
                                      .userChatList[index].senderId!.lastNameEn!
                                  : ctrl.userChatList[index].receiverId!
                                      .lastNameEn!,
                              isImageNull: Get.find<UserHomeController>()
                                          .userModel
                                          .value!
                                          .user!
                                          .id ==
                                      ctrl.userChatList[index].senderId!.id!
                                  ? ctrl.userChatList[index].senderId!
                                              .profilePicture ==
                                          null
                                      ? true
                                      : false
                                  : ctrl.userChatList[index].receiverId!
                                              .profilePicture ==
                                          null
                                      ? true
                                      : false,
                              avatar: Get.find<UserHomeController>()
                                          .userModel
                                          .value!
                                          .user!
                                          .id ==
                                      ctrl.userChatList[index].senderId!.id!
                                  ? ctrl.userChatList[index].senderId!
                                              .profilePicture ==
                                          null
                                      ? ""
                                      : ctrl.userChatList[index].senderId!
                                          .profilePicture!.bg!
                                  : ctrl.userChatList[index].receiverId!
                                              .profilePicture ==
                                          null
                                      ? ""
                                      : ctrl.userChatList[index].receiverId!
                                          .profilePicture!.bg,
                              chat: Get.find<UserHomeController>()
                                          .userModel
                                          .value!
                                          .user!
                                          .id ==
                                      ctrl.userChatList[index].senderId!.id!
                                  ? 0
                                  : 1,
                              message: ctrl.userChatList[index].text,
                              time: formateDate(ctrl
                                  .userChatList[index].updatedAt!
                                  .toString()),
                            ),
                          );
                        },
                      ),
          )),
    );
  }

  formateDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedTime = DateFormat('HH:mm').format(dateTime);
    return formattedTime;
  }

  Widget _formChat() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: AppColors.whiteBGColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 25, right: 25, bottom: 10, top: 10),
          child: TextField(
            style: AppTextStyles.normal.copyWith(
              color: AppColors.blackBGColor,
              fontWeight: FontWeight.w500,
              fontSize: 1.6 * SizeConfig.heightMultiplier,
            ),
            decoration: InputDecoration(
              hintText: 'Type your message...',
              hintStyle: AppTextStyles.normal.copyWith(
                color: const Color(0xff535353),
                fontSize: 1.6 * SizeConfig.heightMultiplier,
              ),
              // prefixIcon: Container(
              //   // color: Colors.red,
              //   width: 14 * SizeConfig.widthMultiplier,
              //   margin: EdgeInsets.only(
              //       left: 4 * SizeConfig.widthMultiplier,
              //       right: 4 * SizeConfig.widthMultiplier),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SvgPicture.asset(
              //         "assets/icons/camer_up.svg",
              //         height: 3 * SizeConfig.heightMultiplier,
              //       ),
              //       SizedBox(width: 1 * SizeConfig.widthMultiplier),
              //       SvgPicture.asset(
              //         "assets/icons/mic_icon.svg",
              //         height: 3 * SizeConfig.heightMultiplier,
              //       ),
              //     ],
              //   ),
              // ),
              suffixIcon: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(14),
                child: Text(
                  "Send",
                  style: AppTextStyles.bold.copyWith(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xff535353),
                    fontSize: 1.7 * SizeConfig.heightMultiplier,
                  ),
                ),
              ),
              filled: true,
              fillColor: const Color(0xffF7F7F8),
              labelStyle: const TextStyle(fontSize: 12),
              contentPadding: const EdgeInsets.all(20),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffF7F7F8)),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffF7F7F8)),
                borderRadius: BorderRadius.circular(12),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffF7F7F8)),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffF7F7F8)),
                borderRadius: BorderRadius.circular(12),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffF7F7F8)),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
