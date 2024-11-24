import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPost extends StatefulWidget {
  final String videoPath;
  const VideoPlayerPost({super.key, required this.videoPath});

  @override
  State<VideoPlayerPost> createState() => _VideoPlayerPostState();
}

class _VideoPlayerPostState extends State<VideoPlayerPost> {
  ValueNotifier<VideoPlayerValue?> currentPosition = ValueNotifier(null);
  VideoPlayerController? controller;
  late Future<void> futureController;

  initVideo() {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));

    futureController = controller!.initialize();
  }

  @override
  void initState() {
    initVideo();
    controller!.addListener(() {
      if (controller!.value.isInitialized) {
        currentPosition.value = controller!.value;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureController,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitSpinningLines(
              color: AppColors.primaryColor,
            ),
          );
        } else {
          return Container(
            color: Colors.transparent,
            height: 25 * SizeConfig.heightMultiplier,
            width: MediaQuery.of(context).size.width * 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                  aspectRatio: 25 * SizeConfig.heightMultiplier,
                  child: Stack(children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: AppColors.greyBGColor.withOpacity(1),
                            spreadRadius: 4,
                            blurRadius: 3,
                            offset: const Offset(2, 4),
                          )
                        ]),
                        child: VideoPlayer(controller!),
                      ),
                    ),
                    Positioned.fill(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: [
                                const Expanded(
                                  flex: 3,
                                  child: SizedBox(),
                                  //  CustomCupertinoButton(
                                  //   onDoubleTap: () async {
                                  //     Duration? position =
                                  //         await controller!.position;
                                  //     setState(() {
                                  //       controller!.seekTo(Duration(
                                  //           seconds: position!.inSeconds - 10));
                                  //     });
                                  //   },
                                  //   child: const Icon(
                                  //     Icons.fast_rewind_rounded,
                                  //     color: Colors.black,
                                  //     size: 40,
                                  //   ),
                                  // ),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: CupertinoButton(
                                      pressedOpacity: 0,
                                      padding: EdgeInsets.zero,
                                      minSize: 0,
                                      onPressed: () {
                                        setState(() {
                                          if (controller!.value.isPlaying) {
                                            controller!.pause();
                                          } else {
                                            controller!.play();
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.whiteBGColor,
                                              width: 1.5),
                                          color: AppColors.primaryColor
                                              .withOpacity(1),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: SvgPicture.asset(
                                            controller!.value.isPlaying
                                                ? Assets.videoPauseIcon
                                                : Assets.videoPlayIcon,
                                            colorFilter: const ColorFilter.mode(
                                                AppColors.whiteBGColor,
                                                BlendMode.srcIn),
                                          ),
                                        ),
                                      ),
                                    )),
                                const Expanded(
                                  flex: 3,
                                  child: SizedBox(),

                                  // CustomCupertinoButton(
                                  //   onDoubleTap: () async {
                                  //     Duration? position =
                                  //         await controller!.position;
                                  //     setState(() {
                                  //       controller!.seekTo(Duration(
                                  //           seconds: position!.inSeconds + 10));
                                  //     });
                                  //   },
                                  //   child: const Icon(
                                  //     Icons.fast_forward_rounded,
                                  //     color: Colors.black,
                                  //     size: 40,
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                          // Expanded(
                          //     flex: 2,
                          //     child: Align(
                          //       alignment: Alignment.bottomCenter,
                          //       child: ValueListenableBuilder(
                          //           valueListenable: currentPosition,
                          //           builder: (context,
                          //               VideoPlayerValue? videoPlayerValue, w) {
                          //             return Padding(
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 20, vertical: 10),
                          //               child: Row(
                          //                 children: [
                          //                   Text(
                          //                     videoPlayerValue!.position
                          //                         .toString()
                          //                         .substring(
                          //                             videoPlayerValue.position
                          //                                     .toString()
                          //                                     .indexOf(':') +
                          //                                 1,
                          //                             videoPlayerValue.position
                          //                                 .toString()
                          //                                 .indexOf('.')),
                          //                     style: const TextStyle(
                          //                         color: Colors.white,
                          //                         fontSize: 22),
                          //                   ),
                          //                   const Spacer(),
                          //                   Text(
                          //                     videoPlayerValue.duration
                          //                         .toString()
                          //                         .substring(
                          //                             videoPlayerValue.duration
                          //                                     .toString()
                          //                                     .indexOf(':') +
                          //                                 1,
                          //                             videoPlayerValue.duration
                          //                                 .toString()
                          //                                 .indexOf('.')),
                          //                     style: const TextStyle(
                          //                         color: Colors.white,
                          //                         fontSize: 22),
                          //                   ),
                          //                 ],
                          //               ),
                          //             );
                          //           }),
                          //     ))
                        ],
                      ),
                    ),
                  ])),
            ),
          );
        }
      },
    );
  }
}
