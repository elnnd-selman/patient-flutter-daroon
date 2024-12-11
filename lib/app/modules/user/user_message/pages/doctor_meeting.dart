import 'package:daroon_user/app/modules/user/user_message/model/user_message_model.dart';
import 'package:daroon_user/app/modules/user/user_message/model/video_call_model.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:dyte_core/dyte_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/doctor_meeting_controller.dart';

class VideoMeetingPages extends StatefulWidget {
  const VideoMeetingPages({super.key});

  @override
  State<VideoMeetingPages> createState() => _VideoMeetingPagesState();
}

class _VideoMeetingPagesState extends State<VideoMeetingPages> {
  final roomStateNotifier = Get.put(DoctorMeetingController());
  final data = Get.arguments[0] as UserMessageModelData;
  final isVideoCall = Get.arguments[1] as bool;

  final isCall = Get.arguments[2] as bool;

  final videoData = Get.arguments[3] as VideoCallModel;
  @override
  void initState() {
    super.initState();
    roomStateNotifier.roomStateNotifier(
      "Testing",
      videoData.token!,
      videoData.token!,
      isCall,
      isVideoCall,
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        roomStateNotifier.dyteClient.value.leaveRoom();
        roomStateNotifier.dyteClient.value.cleanAllNativeListeners();
        roomStateNotifier.dyteClient.value.cleanNativeChatListener();
        roomStateNotifier.dyteClient.value.cleanNativeDataEventsListener();
        roomStateNotifier.dyteClient.value.cleanNativePollListener();
        roomStateNotifier.dyteClient.value.disableCache();
        if (roomStateNotifier.roomJoin.value) {
          return true;
        }

        return true;
      },
      child: Scaffold(
          backgroundColor: AppColors.whiteBGColor,
          body: SafeArea(
            child: Obx(
              () => !roomStateNotifier.roomJoin.value
                  ? const LoadingWidget()
                  : SizedBox(
                      height: height,
                      width: width,
                      child: Stack(
                        children: [
                          Container(
                            height: height * 1,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(.2),
                            ),
                            child: roomStateNotifier.remotePeer.value == null
                                ? Container(
                                    height: height * 1,
                                    width: width,
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor
                                          .withOpacity(.4),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: height * 0.05),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${data.doctor!.firstName!.capitalizeFirst}${data.doctor!.lastNameEn!.capitalizeFirst}',
                                                style:
                                                    AppTextStyles.bold.copyWith(
                                                  color: Colors.white,
                                                  fontSize: Spaces.fontSize(
                                                      fontSize: 18),
                                                ),
                                              ),
                                              Text(
                                                "Waiting for Other User",
                                                style: AppTextStyles.medium
                                                    .copyWith(
                                                  color: Colors.white,
                                                  fontSize: Spaces.fontSize(
                                                      fontSize: 13),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        data.doctor!.profilePicture == null
                                            ? Container(
                                                height: 18 *
                                                    SizeConfig.heightMultiplier,
                                                width: 18 *
                                                    SizeConfig.heightMultiplier,
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: const BoxDecoration(
                                                    color:
                                                        AppColors.blackBGColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Text(
                                                      '${data.doctor!.firstName![0].toUpperCase()}${data.doctor!.lastNameEn![0].toUpperCase()}',
                                                      style: AppTextStyles.bold
                                                          .copyWith(
                                                        color: Colors.white,
                                                        fontSize:
                                                            Spaces.fontSize(
                                                                fontSize: 18),
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                            : ClipOval(
                                                child: NetWorkImageLoader(
                                                  shape: BoxShape.circle,
                                                  boxFit: BoxFit.cover,
                                                  height: 18 *
                                                      SizeConfig
                                                          .heightMultiplier,
                                                  width: 18 *
                                                      SizeConfig
                                                          .heightMultiplier,
                                                  imageURL: data.doctor!
                                                      .profilePicture!.md!,
                                                ),
                                              ),
                                        const SizedBox(),
                                        const SizedBox(),
                                      ],
                                    ),
                                  )
                                : VideoView(
                                    meetingParticipant:
                                        roomStateNotifier.remotePeer.value,
                                  ),
                          ),
                          Positioned(
                            bottom: height * 0.15,
                            right: 20,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.width * 0.31,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(17),
                                child: Obx(
                                  () => roomStateNotifier.roomJoin.value ==
                                          false
                                      ? const SizedBox()
                                      : roomStateNotifier.isVideoOn.value
                                          ? const VideoView(
                                              isSelfParticipant: true)
                                          : Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.18,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.31,
                                              decoration: BoxDecoration(
                                                color: AppColors.blackBGColor,
                                                borderRadius:
                                                    BorderRadius.circular(17),
                                              ),
                                              child: Center(
                                                child: FittedBox(
                                                  child: Text(
                                                    '${data.patient!.firstName![0].toUpperCase()}${data.patient!.lastNameEn![0].toUpperCase()}',
                                                    style: AppTextStyles.bold
                                                        .copyWith(
                                                      color: Colors.white,
                                                      fontSize: Spaces.fontSize(
                                                          fontSize: 18),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                ),
                              ),
                            ),
                          ),
                          Obx(
                            () => roomStateNotifier.roomJoin.value
                                ? Positioned(
                                    bottom: height * 0.01,
                                    child: Container(
                                      width: width * 0.88,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 30, bottom: 20),
                                      decoration: BoxDecoration(
                                        color: AppColors.whiteBGColor,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                roomStateNotifier.toggleAudio();
                                              },
                                              icon: Obx(
                                                () => Icon(
                                                    roomStateNotifier
                                                            .isAudioOn.value
                                                        ? Icons.mic
                                                        : Icons.mic_off_rounded,
                                                    color: roomStateNotifier
                                                            .isAudioOn.value
                                                        ? AppColors.primaryColor
                                                        : Colors.red),
                                              )),
                                          GestureDetector(
                                            onTap: () {
                                              roomStateNotifier.dyteClient.value
                                                  .leaveRoom();
                                              Get.back();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              child: const Icon(
                                                Icons.call_end,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                roomStateNotifier.toggleVideo();
                                              },
                                              icon: Obx(
                                                () => Icon(
                                                  roomStateNotifier
                                                          .isVideoOn.value
                                                      ? Icons.videocam
                                                      : Icons
                                                          .videocam_off_rounded,
                                                  color: roomStateNotifier
                                                          .isVideoOn.value
                                                      ? AppColors.primaryColor
                                                      : Colors.red,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                        ],
                      ),
                    ),
            ),
          )

          //  Column(
          //   children: [
          //     // Obx(
          //     //   () => Expanded(
          //     //     child: roomStateNotifier.remotePeer.value == null
          //     //         // Room Id

          //     //   ),
          //     // ),
          //     Flexible(
          //       flex: 1,
          //       child: LayoutBuilder(builder: (context, boxConstraints) {
          //         double size = min(boxConstraints.biggest.height,
          //                 boxConstraints.biggest.width) -
          //             10;
          //         return Stack(children: [
          //           roomStateNotifier.remotePeer.value == null
          //               ? SizedBox()
          //               : Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     Container(
          //                       height: 100,
          //                       width: 100,
          //                       margin: const EdgeInsets.only(left: 10),
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(17),
          //                         // boxShadow: [
          //                         //   if (!roomStateNotifier
          //                         //       .localUserTurn.value) ...[
          //                         //     const BoxShadow(
          //                         //       color: Colors.red,
          //                         //       spreadRadius: 4,
          //                         //       blurRadius: 10,
          //                         //     ),
          //                         //     const BoxShadow(
          //                         //       color: Colors.red,
          //                         //       spreadRadius: -4,
          //                         //       blurRadius: 5,
          //                         //     )
          //                         //   ]
          //                         // ],
          //                       ),
          //                       child: ClipRRect(
          //                         borderRadius: BorderRadius.circular(17),
          //                         child: VideoView(
          //                           meetingParticipant:
          //                               roomStateNotifier.remotePeer.value,
          //                         ),
          //                       ),
          //                     ),
          //                     const SizedBox(
          //                       width: 10,
          //                     ),
          //                     Text(
          //                       roomStateNotifier.remotePeer.value!.name,
          //                       style: const TextStyle(
          //                           color: Colors.black,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                     const Spacer()
          //                   ],
          //                 ),
          //           Obx(
          //             () => SizedBox(
          //               child: roomStateNotifier.remotePeer.value != null
          //                   ? const SizedBox()
          //                   : SizedBox(
          //                       width: size,
          //                       height: size,
          //                       child: const Center(
          //                         child: Text(
          //                           "Waiting player to join",
          //                           textAlign: TextAlign.center,
          //                           maxLines: 3,
          //                           style: TextStyle(
          //                               fontSize: 25,
          //                               fontWeight: FontWeight.bold),
          //                         ),
          //                       ),
          //                     ),
          //             ),
          //           )
          //         ]);
          //       }),
          //     ),
          //     // Local user video tile and name
          //     Expanded(
          //       child: Row(
          //         children: [
          //           const Spacer(),
          //
          //         ],
          //       ),
          //     ),

          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomStateNotifier.dyteClient.value.leaveRoom();
  }
}
