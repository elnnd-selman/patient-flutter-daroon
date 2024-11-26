import 'package:cached_network_image/cached_network_image.dart';
import 'package:daroon_user/app/modules/linkfy_text/src/enum.dart';
import 'package:daroon_user/app/modules/linkfy_text/src/linkify.dart';
import 'package:daroon_user/app/modules/user/user_podcast/controller/presenter_podcast_detail_ctrl.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PresenterCommentSetion extends GetView<PresenterPodcastDetailCtrl> {
  const PresenterCommentSetion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.commentsLoading.value
          ? Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 5 * SizeConfig.heightMultiplier),
              child: const Center(child: LoadingWidget()),
            )
          : controller.commetnModelList.isEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20 * SizeConfig.heightMultiplier),
                  child: const Center(
                      child: NoDataWidget(text: "No Comment available")),
                )
              : ListView.builder(
                  padding: EdgeInsets.symmetric(
                      horizontal: 4 * SizeConfig.widthMultiplier),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.commetnModelList.length,
                  itemBuilder: (context, index) {
                    return _buildComment(commentIndex: index);
                  }),
    );

    // Container(

    //     // child: Stack(
    //     //   children: [
    //     //     Obx(
    //     //       () => Column(
    //     //         children: [
    //     //           if (controller.commentsLoading.isFalse)
    //     //             Expanded(
    //     //               child: FadeIn(
    //     //                 child: Padding(
    //     //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //     //                   child: SingleChildScrollView(
    //     //                     controller: controller.commentSectionScrollController,
    //     //                     child: Column(
    //     //                       crossAxisAlignment: CrossAxisAlignment.start,
    //     //                       mainAxisSize: MainAxisSize.min,
    //     //                       children: [
    //     //                         RichText(
    //     //                           text: TextSpan(
    //     //                             text: 'Comments',
    //     //                             style: AppTextStyles.semiBold.copyWith(
    //     //                               fontSize: 22.responsiveFontSize,
    //     //                               color: AppColors.blackBGColor,
    //     //                             ),
    //     //                             // children: [
    //     //                             //   TextSpan(
    //     //                             //     text:
    //     //                             //         ' (${controller.commentsList.length})',
    //     //                             //     style: AppTextStyles.semiBold.copyWith(
    //     //                             //       fontSize: 20,
    //     //                             //       color: AppColors.blackBGColor,
    //     //                             //     ),
    //     //                             //   ),
    //     //                             // ],
    //     //                           ),
    //     //                         ),
    //     //                         14.verticalSpace,
    //     //                         Obx(
    //     //                           () => (controller.commentsList.isNotEmpty)
    //     //                               ? Column(
    //     //                                   children: [
    //     //                                     for (var commentIndex = 0;
    //     //                                         commentIndex <
    //     //                                             controller
    //     //                                                 .commentsList.length;
    //     //                                         commentIndex++) ...[
    //     //                                       _buildComment(
    //     //                                         commentIndex: commentIndex,
    //     //                                       ),
    //     //                                       if (commentIndex <
    //     //                                           controller.commentsList.length -
    //     //                                               1)
    //     //                                         14.verticalSpace,
    //     //                                     ],
    //     //                                     150.verticalSpace,
    //     //                                     SizedBox(
    //     //                                       height: MediaQuery.of(Get.context!)
    //     //                                           .viewInsets
    //     //                                           .bottom,
    //     //                                     ),
    //     //                                   ],
    //     //                                 )
    //     //                               : _buildNoCommentsSection(),
    //     //                         ),
    //     //                       ],
    //     //                     ),
    //     //                   ),
    //     //                 ),
    //     //               ),
    //     //             )
    //     //           else
    //     //             const Expanded(
    //     //               child: Center(
    //     //                 child: CircularProgressIndicator(
    //     //                   strokeWidth: 1,
    //     //                   color: AppColors.blackBGColor,
    //     //                 ),
    //     //               ),
    //     //             ),
    //     //         ],
    //     //       ),
    //     //     ),
    //     //   ],
    //     // ),
    //     );
  }

  // ignore: unused_element
  Widget _buildNoCommentsSection() {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Colors.white,
      ),
      child: const NoDataWidget(
        text: 'No Comments',
      ),
    );
  }

  Widget _buildComment({required int commentIndex}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: AppColors.whiteBGColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              controller.commetnModelList[commentIndex].user!
                          .usePictureAsLink ==
                      false
                  ? Container(
                      height: 3.5 * SizeConfig.heightMultiplier,
                      width: 3.5 * SizeConfig.heightMultiplier,
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: AppColors.blackBGColor,
                          shape: BoxShape.circle),
                      child: Center(
                        child: FittedBox(
                          child: Text(
                            '${controller.commetnModelList[commentIndex].user!.firstName![0].toUpperCase()}${controller.commetnModelList[commentIndex].user!.lastNameEn![0].toUpperCase()}',
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
                          imageUrl: controller.commetnModelList[commentIndex]
                              .user!.profilePicture!.md!,
                          fit: BoxFit.cover,
                          height: 3.5 * SizeConfig.heightMultiplier,
                          width: 3.5 * SizeConfig.heightMultiplier,
                        ),
                      ),
                    ),
              12.horizontalSpace,
              Flexible(
                // height: 30,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: .5 * SizeConfig.heightMultiplier),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: controller.commetnModelList[commentIndex]
                                  .user!.username!,
                              style: AppTextStyles.semiBold.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff11142D),
                              ),
                            ),
                            // 10.horizontalSpace,
                            TextSpan(
                                text: "",
                                children: [
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: LinkifyText(
                                        controller
                                            .commetnModelList[commentIndex]
                                            .comment!,
                                        textStyle:
                                            AppTextStyles.normal.copyWith(
                                          fontSize: 12,
                                          color: const Color(0xff11142D),
                                        ),
                                        linkTypes: const [
                                          LinkType.userTag,
                                          LinkType.hashTag
                                        ],
                                        linkStyle:
                                            AppTextStyles.semiBold.copyWith(
                                          fontSize: 12,
                                          color: AppColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                                style: const TextStyle(
                                  color: Color(0xff11142D),
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 43),
            child: Text(
              controller.getCommentTimeDifference(
                commentIndex: commentIndex,
              ),
              style: AppTextStyles.normal.copyWith(
                fontSize: 12,
                color: AppColors.greyColor,
              ),
            ),
          ),

          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.only(left: 43),
            child: CupertinoButton(
              onPressed: () {
                controller.setReplyMode(commentIndex: commentIndex);
              },
              minSize: 0,
              padding: EdgeInsets.zero,
              child: Text(
                'Reply',
                style: AppTextStyles.semiBold.copyWith(
                  color: AppColors.greyColor,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 60),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [

          //       Row(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           CupertinoButton(
          //             onPressed: () {
          //               // controller.addLike(
          //               //     commentIndex: commentIndex, isReplay: false);
          //             },
          //             minSize: 0,
          //             padding: EdgeInsets.zero,
          //             child: Text(
          //               '${controller.commetnModelList.value!.data[commentIndex].likes != null ? controller.commetnModelList.value!.data[commentIndex].likes! : 0}   Likes',
          //               style: AppTextStyles.semiBold.copyWith(
          //                 color: controller.commentLikedByMe(
          //                         commentIndex: commentIndex)
          //                     ? AppColors.blackBGColor
          //                     : AppColors.greyColor,
          //                 fontSize: 14,
          //               ),
          //             ),
          //           ),
          //           10.horizontalSpace,

          //           20.horizontalSpace,
          //           // SizedBox(
          //           //   width: MediaQuery.of(Get.context!).size.width * 0.6,
          //           //   child: EmojiListWidget(
          //           //     emojiList:
          //           //         controller.commentsList[commentIndex].commentEmojiList,
          //           //     onEmojiTap: (emoji) {
          //           //       controller.addEmojiToComment(
          //           //         emoji.emoji,
          //           //         commentIndex,
          //           //       );
          //           //     },
          //           //   ),
          //           // ),
          //         ],
          //       ),
          //       // CupertinoButton(
          //       //   onPressed: () {
          //       //     final uid = Get.find<AuthController>().user!.uid;
          //       //     final isVerified =
          //       //         Get.find<AppConfigurationController>().isAdminUser();
          //       //     if (isVerified ||
          //       //         controller.commentsList[commentIndex].commentAuthorID ==
          //       //             uid) {
          //       //       showModalBottomSheet(
          //       //         context: Get.context!,
          //       //         constraints: BoxConstraints(
          //       //             maxWidth: MediaQuery.of(Get.context!).size.width),
          //       //         builder: (context) => AuthorOptionsSheet(
          //       //           onEditPressed: () => controller.editComment(
          //       //             commentIndex: commentIndex,
          //       //           ),
          //       //           onDeletePressed: () => controller.deleteComment(
          //       //             comment: controller.commentsList[commentIndex],
          //       //           ),
          //       //         ),
          //       //         isScrollControlled: true,
          //       //         isDismissible: true,
          //       //         shape: const RoundedRectangleBorder(
          //       //           borderRadius: BorderRadius.only(
          //       //             topLeft: Radius.circular(24),
          //       //             topRight: Radius.circular(24),
          //       //           ),
          //       //         ),
          //       //       );
          //       //     } else {
          //       //       showModalBottomSheet(
          //       //         context: Get.context!,
          //       //         constraints: BoxConstraints(
          //       //             maxWidth: MediaQuery.of(Get.context!).size.width),
          //       //         builder: (context) => ReportSheet(
          //       //           reportingOn: 'Comment',
          //       //           username: controller
          //       //               .commentsList[commentIndex].commentAuthorUsername,
          //       //           onReport: (reason) => controller.reportComment(
          //       //             comment: controller.commentsList[commentIndex],
          //       //             reason: reason,
          //       //           ),
          //       //           onBlock: () async {
          //       //             final blocked =
          //       //                 await Get.find<CommunityController>().blockUser(
          //       //               controller
          //       //                   .commentsList[commentIndex].commentAuthorID,
          //       //               controller.commentsList[commentIndex]
          //       //                   .commentAuthorUsername,
          //       //             );

          //       //             if (blocked) {
          //       //               final uid = controller
          //       //                   .commentsList[commentIndex].commentAuthorID;
          //       //               controller.commentsList.removeWhere(
          //       //                 (e) => e.commentAuthorID == uid,
          //       //               );
          //       //             }
          //       //           },
          //       //         ),
          //       //         isScrollControlled: true,
          //       //         isDismissible: true,
          //       //         shape: const RoundedRectangleBorder(
          //       //           borderRadius: BorderRadius.only(
          //       //             topLeft: Radius.circular(24),
          //       //             topRight: Radius.circular(24),
          //       //           ),
          //       //         ),
          //       //       );
          //       //     }
          //       //   },
          //       //   padding: EdgeInsets.zero,
          //       //   minSize: 0,
          //       //   child: SvgPicture.asset(Assets.svgDotsMenu),
          //       // ),
          //     ],
          //   ),
          // ),
          10.verticalSpace,

          controller.commetnModelList[commentIndex].replies.isNotEmpty
              ? _buildReplies(commentIndex: commentIndex)
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget _buildReplies({required int commentIndex}) {
    return Obx(() => (controller
            .commetnModelList[commentIndex].replies.isNotEmpty)
        ? Container(
            padding: const EdgeInsets.only(left: 45),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  controller.commetnModelList[commentIndex].replies.length,
              reverse: true,
              itemBuilder: (context, replyIndex) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller
                                    .commetnModelList[commentIndex]
                                    .replies[replyIndex]
                                    .user!
                                    .usePictureAsLink ==
                                false
                            ? Container(
                                height: 3.5 * SizeConfig.heightMultiplier,
                                width: 3.5 * SizeConfig.heightMultiplier,
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    color: AppColors.blackBGColor,
                                    shape: BoxShape.circle),
                                child: Center(
                                  child: FittedBox(
                                    child: Text(
                                      '${controller.commetnModelList[commentIndex].replies[replyIndex].user!.firstName![0].toUpperCase()}${controller.commetnModelList[commentIndex].replies[replyIndex].user!.lastNameEn![0].toUpperCase()}',
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
                                    imageUrl: controller
                                        .commetnModelList[commentIndex]
                                        .replies[replyIndex]
                                        .user!
                                        .profilePicture!
                                        .md!,
                                    fit: BoxFit.cover,
                                    height: 3.5 * SizeConfig.heightMultiplier,
                                    width: 3.5 * SizeConfig.heightMultiplier,
                                  ),
                                ),
                              ),
                        12.horizontalSpace,
                        Flexible(
                          // height: 30,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: .5 * SizeConfig.heightMultiplier),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller
                                            .commetnModelList[commentIndex]
                                            .replies[replyIndex]
                                            .user!
                                            .username,
                                        style: AppTextStyles.semiBold.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: const Color(0xff11142D),
                                        ),
                                      ),
                                      // 10.horizontalSpace,
                                      TextSpan(
                                          text: "",
                                          children: [
                                            WidgetSpan(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10),
                                                child: LinkifyText(
                                                  controller
                                                      .commetnModelList[
                                                          commentIndex]
                                                      .replies[replyIndex]
                                                      .comment!,
                                                  textStyle: AppTextStyles
                                                      .normal
                                                      .copyWith(
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xff11142D),
                                                  ),
                                                  linkTypes: const [
                                                    LinkType.userTag,
                                                    LinkType.hashTag
                                                  ],
                                                  linkStyle: AppTextStyles
                                                      .semiBold
                                                      .copyWith(
                                                    fontSize: 12,
                                                    color:
                                                        AppColors.primaryColor,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                          style: const TextStyle(
                                            color: Color(0xff11142D),
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     // if (controller
                    //     //     .commentsList[commentIndex]
                    //     //     .commentReplies[replyIndex]
                    //     //     .replyAuthorImageUrl
                    //     //     .isNotEmpty)
                    //     //   SizedBox(
                    //     //     width: 50,
                    //     //     height: 50,
                    //     //     child: CircleAvatar(
                    //     //       backgroundColor: AppColors.whiteBGColor,
                    //     //       backgroundImage: CachedNetworkImageProvider(
                    //     //         controller
                    //     //             .commentsList[commentIndex]
                    //     //             .commentReplies[replyIndex]
                    //     //             .replyAuthorImageUrl,
                    //     //       ),
                    //     //     ),
                    //     //   )
                    //     // else
                    //     Container(
                    //       height: 45,
                    //       width: 45,
                    //       decoration: BoxDecoration(
                    //         color: AppColors.blackBGColor,
                    //         borderRadius: BorderRadius.circular(8.0),
                    //       ),
                    //       child: CircleAvatar(
                    //         backgroundColor: AppColors.blackBGColor,
                    //         child: Text(
                    //           "Reply comment User Name",
                    //           // '${controller.commentsList[commentIndex].commentReplies[replyIndex].replyAuthorFirstName[0]}${controller.commentsList[commentIndex].commentReplies[replyIndex].replyAuthorLastName[0]}',
                    //           style: AppTextStyles.bold.copyWith(
                    //             fontSize: 20,
                    //             color: Colors.white,
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     12.horizontalSpace,
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Text(
                    //           "Reply Commetn User Name",
                    //           // '@${controller.commentsList[commentIndex].commentReplies[replyIndex].replyAuthorUsername}',
                    //           style: AppTextStyles.semiBold.copyWith(
                    //             fontSize: 14,
                    //             color: AppColors.blackBGColor,
                    //             fontFamily: 'SF Pro Display',
                    //             fontWeight: FontWeight.w700,
                    //           ),
                    //         ),
                    //         2.verticalSpace,
                    //         Text(
                    //           controller.getReplyTimeDifference(
                    //             commentIndex: commentIndex,
                    //             replyID: replyIndex,
                    //           ),
                    //           style: AppTextStyles.medium.copyWith(
                    //             fontSize: 12,
                    //             color: AppColors.greyColor,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),

                    Padding(
                      padding: const EdgeInsets.only(left: 43),
                      child: Text(
                        controller.getReplyTimeDifference(
                          commentIndex: commentIndex,
                          replyID: replyIndex,
                        ),
                        style: AppTextStyles.normal.copyWith(
                          fontSize: 12,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ),

                    10.verticalSpace,
                    Padding(
                      padding: const EdgeInsets.only(left: 43),
                      child: CupertinoButton(
                        onPressed: () {
                          controller.setReplyMode(
                            commentIndex: commentIndex,
                            replyIndex: replyIndex,
                          );
                        },
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: Text(
                          'Reply',
                          style: AppTextStyles.semiBold.copyWith(
                            color: AppColors.greyColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                    replyIndex > 0 ? 12.verticalSpace : 0.verticalSpace
                  ],
                );
              },
            ),
          )
        : 0.verticalSpace);
  }
}
