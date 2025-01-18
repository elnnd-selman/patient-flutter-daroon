import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daroon_user/app/modules/user/user_home/model/top_doctor_content_model.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/video_player_post.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/post_comment_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/top_doctor_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'comment_bottom_sheet.dart';

class DoctorImagePostContainer extends StatefulWidget {
  final ContentData contentData;
  final int index;
  final TopDoctorModel topDoctorModel;

  const DoctorImagePostContainer({
    super.key,
    required this.contentData,
    required this.index,
    required this.topDoctorModel,
  });

  @override
  State<DoctorImagePostContainer> createState() =>
      _DoctorImagePostContainerState();
}

class _DoctorImagePostContainerState extends State<DoctorImagePostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Get.find<TopDoctorProfileController>()
                          .topDoctorData
                          .value!
                          .profilePicture ==
                      null
                  ? Container(
                      height: 5 * SizeConfig.heightMultiplier,
                      width: 5 * SizeConfig.heightMultiplier,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: AppColors.blackBGColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            '${Get.find<TopDoctorProfileController>().topDoctorData.value!.firstName![0].toUpperCase()}${Get.find<TopDoctorProfileController>().topDoctorData.value!.lastNameEn![0].toUpperCase()}',
                            style: AppTextStyles.bold.copyWith(
                              color: Colors.white,
                              fontSize: Spaces.fontSize(fontSize: 18),
                            ),
                          ),
                        ),
                      ))
                  : CircleAvatar(
                      radius: 14,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: Get.find<TopDoctorProfileController>()
                              .topDoctorData
                              .value!
                              .profilePicture!
                              .bg!,
                          fit: BoxFit.cover,
                          height: 5 * SizeConfig.heightMultiplier,
                          width: 5 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    ),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Get.find<TopDoctorProfileController>()
                        .topDoctorData
                        .value!
                        .lastNameEn!,
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackBGColor,
                      fontSize: SizeConfig.heightMultiplier * 1.6,
                    ),
                  ),
                  Text(
                    Get.find<TopDoctorProfileController>().convertDateToformat(
                        widget.contentData.createdAt.toString()),
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: const Color(0xff717171),
                      fontSize: SizeConfig.heightMultiplier * 1.6,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 2.5 * SizeConfig.heightMultiplier),
          Text(
            widget.contentData.contentEn!,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff484848),
              fontSize: SizeConfig.heightMultiplier * 1.6,
            ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          widget.contentData.imageVideoUrl.isEmpty
              ? const SizedBox()
              : CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    // aspectRatio: 2.0,
                    // initialPage: 2,
                  ),
                  itemCount: widget.contentData.imageVideoUrl.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    if (widget.contentData.imageVideoUrl[itemIndex].urlType ==
                        "imageUrl") {
                      return Container(
                        height: 25 * SizeConfig.heightMultiplier,
                        width: MediaQuery.of(context).size.width * .8,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.028),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: CachedNetworkImage(
                            imageUrl: widget
                                .contentData.imageVideoUrl[itemIndex].url!,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            color: AppColors.blackBGColor.withOpacity(0.3),
                            colorBlendMode: BlendMode.darken,
                            placeholder: (context, url) {
                              return const LoadingWidget();
                            },
                            placeholderFadeInDuration: 0.75.seconds,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        height: 25 * SizeConfig.heightMultiplier,
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.028),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                            color: Colors.transparent),
                        child: VideoPlayerPost(
                          showRadius: true,
                          videoPath:
                              widget.contentData.imageVideoUrl[itemIndex].url!,
                        ),
                      );
                    }
                  }),
          SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
          Container(
            height: .5,
            color: const Color(0xffE4E4E4),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          Row(
            children: [
              Row(
                children: [
                  CupertinoButton(
                      pressedOpacity: 0,
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () => Get.find<TopDoctorProfileController>()
                          .updateLikeOnPost(
                              contentData: widget.contentData,
                              index: widget.index),
                      child: Icon(
                        widget.contentData.isLiked!
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.contentData.isLiked!
                            ? AppColors.primaryColor
                            : Colors.black,
                      )),
                  const SizedBox(width: 4),
                  CupertinoButton(
                    pressedOpacity: 0,
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: () {},
                    //     Get.toNamed(Routes.postLikeUserDetail, arguments: [
                    //   widget.contentData,
                    // ]),
                    child: Text(
                      " ${widget.contentData.likes} Likes",
                      style: AppTextStyles.medium.copyWith(
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff484848),
                        fontSize: SizeConfig.heightMultiplier * 1.4,
                      ),
                    ),
                  ),
                ],
              ),
              20.horizontalSpace,
              _buildLikeRow(
                "  ${widget.contentData.commentCount} Comment",
                Assets.commentIcon,
                () {
                  Get.lazyPut(() =>
                      PostCommentController(postID: widget.contentData.id!));

                  Get.bottomSheet(
                    CommentBottomSheet(contentData: widget.contentData),
                    isScrollControlled: true,
                    isDismissible: true,
                    enableDrag: false,
                  ).whenComplete(() {
                    Get.find<TopDoctorProfileController>()
                        .getDoctorPost(doctorID: widget.topDoctorModel.id!);
                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  CupertinoButton _buildLikeRow(
      String title, String iconUrl, Function()? onTap) {
    return CupertinoButton(
      pressedOpacity: 0,
      padding: EdgeInsets.zero,
      minSize: 0,
      onPressed: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            iconUrl,
            height: 16,
          ),
          const SizedBox(width: 4),
          Text(
            title,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff484848),
              fontSize: SizeConfig.heightMultiplier * 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

enum Options { edit, delete }
