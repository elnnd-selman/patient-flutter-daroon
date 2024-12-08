import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daroon_user/app/modules/user/user_podcast/controller/presenter_podcast_detail_ctrl.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/presenter_comment_setion.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/video_player_post.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/check_null_value.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class PresenterPodcastDetails extends GetView<PresenterPodcastDetailCtrl> {
  PresenterPodcastDetails({super.key});

  final podcastData = Get.arguments[0] as PodCastModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PresenterPodcastDetailCtrl>(
      initState: (_) {
        controller.setData(podcastData);
      },
      builder: (_) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1)),
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.whiteBGColor,
                appBar: AppBar(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  elevation: 0,
                  centerTitle: true,
                  automaticallyImplyLeading: true,
                  title: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      podcastData.titleEn!.capitalizeFirst!,
                      style: AppTextStyles.medium.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackBGColor,
                        fontSize: 2 * SizeConfig.heightMultiplier,
                      ),
                    ),
                  ),
                ),
                resizeToAvoidBottomInset: true,
                body: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // _buildHeader(),
                            20.verticalSpace,
                            podcastData.type == "image" ||
                                    podcastData.type == "text"
                                ? Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal:
                                            6 * SizeConfig.widthMultiplier),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xffE8E8E8),
                                          width: 0.5),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        podcastData.type == "text"
                                            ? const SizedBox()
                                            : Container(
                                                height: 30 *
                                                    SizeConfig.heightMultiplier,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                )),
                                                child: CarouselSlider.builder(
                                                    options: CarouselOptions(
                                                      height: 31 *
                                                          SizeConfig
                                                              .heightMultiplier,
                                                      autoPlay: false,
                                                      enlargeCenterPage: true,
                                                      enableInfiniteScroll:
                                                          false,
                                                      viewportFraction: 1,
                                                    ),
                                                    itemCount: podcastData
                                                        .images.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int itemIndex,
                                                            int pageViewIndex) {
                                                      return ClipRRect(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                        ),
                                                        child: Stack(
                                                          children: [
                                                            NetWorkImageLoader(
                                                                boxFit:
                                                                    BoxFit.fill,
                                                                imageURL: podcastData
                                                                        .images[
                                                                    itemIndex],
                                                                height: 30 *
                                                                    SizeConfig
                                                                        .heightMultiplier,
                                                                width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width),
                                                            Positioned(
                                                              top: 2 *
                                                                  SizeConfig
                                                                      .heightMultiplier,
                                                              left: 6 *
                                                                  SizeConfig
                                                                      .widthMultiplier,
                                                              child: Container(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    vertical:
                                                                        10,
                                                                    horizontal:
                                                                        14),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6),
                                                                  color: AppColors
                                                                      .blackBGColor
                                                                      .withOpacity(
                                                                          0.06),
                                                                ),
                                                                child: Text(
                                                                  "$itemIndex/${podcastData.images.length}",
                                                                  style: AppTextStyles
                                                                      .medium
                                                                      .copyWith(
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              AppColors.whiteBGColor),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ),
                                        podcastData.type == "text"
                                            ? 20.verticalSpace
                                            : 10.verticalSpace,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          child: ReadMoreText(
                                            podcastData.contentEn!,
                                            trimMode: TrimMode.Line,
                                            trimLines: 2,
                                            trimLength: 200,
                                            colorClickableText: Colors.pink,
                                            trimCollapsedText: 'More',
                                            trimExpandedText: 'Less',
                                            style:
                                                AppTextStyles.normal.copyWith(
                                              fontSize: 14,
                                              color: AppColors.blackBGColor
                                                  .withOpacity(.6),
                                            ),
                                            moreStyle: AppTextStyles.normal
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                          ),
                                        ),
                                        14.verticalSpace,
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 14),
                                          child: Row(
                                            children: [
                                              CupertinoButton(
                                                pressedOpacity: 0,
                                                padding: EdgeInsets.zero,
                                                minSize: 0,
                                                onPressed: () => controller
                                                    .updateLikeOnPost(),
                                                child: Obx(
                                                  () => Icon(
                                                    controller.podCastModel
                                                            .value!.isLiked!
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    color: controller
                                                            .podCastModel
                                                            .value!
                                                            .isLiked!
                                                        ? AppColors.primaryColor
                                                        : Colors.black,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              CupertinoButton(
                                                pressedOpacity: 0,
                                                padding: EdgeInsets.zero,
                                                minSize: 0,
                                                onPressed: () => controller
                                                    .updateLikeOnPost(),
                                                child: Obx(
                                                  () => Text(
                                                    " ${controller.podCastModel.value!.likes} Likes",
                                                    style: AppTextStyles.normal
                                                        .copyWith(
                                                      color: const Color(
                                                          0xff50555C),
                                                      fontSize: SizeConfig
                                                              .heightMultiplier *
                                                          1.7,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              20.horizontalSpace,
                                              SvgPicture.asset(
                                                Assets.commentIcon,
                                                height: 16,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        AppColors.blackBGColor,
                                                        BlendMode.srcIn),
                                              ),
                                              const SizedBox(width: 4),
                                              Obx(
                                                () => Text(
                                                  " ${controller.commetnModelList.length} Comment",
                                                  style: AppTextStyles.normal
                                                      .copyWith(
                                                    color:
                                                        const Color(0xff50555C),
                                                    fontSize: SizeConfig
                                                            .heightMultiplier *
                                                        1.7,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        14.verticalSpace,
                                        Container(
                                            color: const Color(0xffE8E8E8),
                                            height: 0.5),
                                        20.verticalSpace,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            12.horizontalSpace,
                                            SvgPicture.asset(
                                              "assets/icons/clock.svg",
                                              height: 2.5 *
                                                  SizeConfig.heightMultiplier,
                                            ),
                                            14.horizontalSpace,
                                            Text(
                                              "Created at ${formatDateTime(podcastData.createdAt!)}",
                                              style:
                                                  AppTextStyles.normal.copyWith(
                                                fontSize: 12,
                                                color: AppColors.lighttextColor,
                                              ),
                                            )
                                          ],
                                        ),
                                        20.verticalSpace,
                                      ],
                                    ),
                                  )
                                : Container(
                                    height: 25 * SizeConfig.heightMultiplier,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        color: Colors.transparent),
                                    child: VideoPlayerPost(
                                      showRadius: false,
                                      videoPath: podcastData.videos[0],
                                    ),
                                  ),
                            20.verticalSpace,
                            podcastData.type == "video"
                                ? _buildPostDescription()
                                : const SizedBox(),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 6 * SizeConfig.widthMultiplier),
                              child: Text(
                                "Comments",
                                style: AppTextStyles.bold.copyWith(
                                  color: AppColors.lighttextColor,
                                  fontSize: SizeConfig.heightMultiplier * 2,
                                ),
                              ),
                            ),
                            const PresenterCommentSetion(),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: 1 * SizeConfig.heightMultiplier),
                      child: _buildTextField(context),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.commentsLoading.isTrue) {
                  return const LoadingOverlay();
                }
                return const SizedBox();
              }),
            ],
          ),
        );
      },
    );
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat timeFormat = DateFormat('hh:mm a');
    final DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    String formattedTime = timeFormat.format(dateTime);
    String formattedDate = dateFormat.format(dateTime);
    return '$formattedTime - $formattedDate';
  }

  SizedBox _buildTextField(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.01),
              color: Colors.transparent,
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.72,
              child: TextFormField(
                focusNode: controller.commentFieldFocusNode,
                controller: controller.commentTextController,
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: AppColors.blackBGColor,
                ),
                cursorColor: Colors.black12,
                cursorWidth: 1,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
                  fillColor: const Color(0xffF7F7F8),
                  filled: true,
                  errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE7E8EA)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE7E8EA)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE7E8EA)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE7E8EA)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffE7E8EA)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  isDense: true,
                  suffixIcon: CupertinoButton(
                    pressedOpacity: 0,
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    onPressed: () {
                      if (controller.selectedCommentIndex.value == -1) {
                        controller.sendCommentOnPost();
                      } else {
                        controller.replyOnComment();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        Assets.sendIcon,
                      ),
                    ),
                  ),
                  hintText: "Send Comment",
                  hintStyle: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: const Color(0xff535353),
                  ),
                ),
                onChanged: (val) {
                  if (val.isEmpty) {
                    controller.selectedCommentIndex.value = -1;
                  }
                },
              ),
            ),
          ),
          SizedBox(width: 2 * SizeConfig.widthMultiplier),
          //
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
            height: MediaQuery.of(context).size.height * 0.065,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xffE4E4E4).withOpacity(.3),
              border: Border.all(
                color: const Color(0xffE4E4E4),
              ),
            ),
            child: Center(
              child: Text("😍",
                  style: AppTextStyles.medium.copyWith(
                    color: const Color(0xff11142D),
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  )),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildPostDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6 * SizeConfig.widthMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CupertinoButton(
                pressedOpacity: 0,
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () => controller.updateLikeOnPost(),
                child: Obx(
                  () => Icon(
                    controller.podCastModel.value!.isLiked!
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: controller.podCastModel.value!.isLiked!
                        ? AppColors.primaryColor
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              CupertinoButton(
                pressedOpacity: 0,
                padding: EdgeInsets.zero,
                minSize: 0,
                onPressed: () => controller.updateLikeOnPost(),
                child: Obx(
                  () => Text(
                    " ${controller.podCastModel.value!.likes} Likes",
                    style: AppTextStyles.semiBold.copyWith(
                      color: AppColors.blackBGColor,
                      fontSize: SizeConfig.heightMultiplier * 1.7,
                    ),
                  ),
                ),
              ),
              20.horizontalSpace,
              SvgPicture.asset(
                Assets.commentIcon,
                height: 16,
                colorFilter: const ColorFilter.mode(
                    AppColors.blackBGColor, BlendMode.srcIn),
              ),
              const SizedBox(width: 4),
              Obx(
                () => Text(
                  " ${controller.commetnModelList.length} Comment",
                  style: AppTextStyles.semiBold.copyWith(
                    color: AppColors.blackBGColor,
                    fontSize: SizeConfig.heightMultiplier * 1.7,
                  ),
                ),
              )
            ],
          ),
          16.verticalSpace,
          Text(
            podcastData.titleEn!.capitalizeFirst!,
            style: AppTextStyles.bold.copyWith(
              color: AppColors.blackBGColor,
              fontSize: SizeConfig.heightMultiplier * 2,
            ),
          ),
          10.verticalSpace,
          ReadMoreText(
            podcastData.contentEn!,
            trimMode: TrimMode.Line,
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimCollapsedText: '...More',
            trimExpandedText: '...Less',
            style: AppTextStyles.normal.copyWith(
                fontSize: 16, color: AppColors.blackBGColor.withOpacity(.6)),
            moreStyle: AppTextStyles.normal.copyWith(
                color: AppColors.primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
          3.verticalSpace,
          Text(
            formatDate(podcastData.createdAt!),
            style: AppTextStyles.normal.copyWith(
              color: AppColors.lighttextColor,
              fontSize: SizeConfig.heightMultiplier * 1.6,
            ),
          ),
          14.verticalSpace,
          Container(
            height: 0.5,
            color: const Color(0xff979797),
          ),
          14.verticalSpace,
        ],
      ),
    );
  }

  // ignore: unused_element
  Padding _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4 * SizeConfig.widthMultiplier),
      child: Row(
        children: [
          Center(
            child: Container(
              height: SizeConfig.heightMultiplier * 7,
              width: SizeConfig.heightMultiplier * 7,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.blackBGColor),
              child: podcastData.user!.profilePicture == null
                  ? Center(
                      child: FittedBox(
                        child: Text(
                          '${podcastData.user!.firstName![0].toUpperCase()}${podcastData.user!.firstNameEn![1].toUpperCase()}',
                          style: AppTextStyles.bold.copyWith(
                            color: Colors.white,
                            fontSize: Spaces.fontSize(fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  : CachedNetworkImage(
                      imageUrl: podcastData.user!.profilePicture!,
                      fit: BoxFit.cover,
                      imageBuilder: (context, imageProvider) => Container(
                        height: SizeConfig.heightMultiplier * 12,
                        width: SizeConfig.heightMultiplier * 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      height: SizeConfig.heightMultiplier * 12,
                      width: SizeConfig.heightMultiplier * 12,
                      color: AppColors.blackBGColor.withOpacity(0.3),
                      colorBlendMode: BlendMode.darken,
                      errorWidget: (context, url, error) {
                        return Center(
                          child: FittedBox(
                            child: Text(
                              '${podcastData.user!.firstName![0].toUpperCase()}${podcastData.user!.firstNameEn![1].toUpperCase()}',
                              style: AppTextStyles.bold.copyWith(
                                color: Colors.white,
                                fontSize: Spaces.fontSize(fontSize: 18),
                              ),
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        );
                      },
                      placeholderFadeInDuration: 0.75.seconds,
                    ),
            ),
          ),
          14.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                podcastData.user!.firstName.nullCheck,
                style: AppTextStyles.black.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.blackBGColor,
                  fontSize: 2.2 * SizeConfig.heightMultiplier,
                ),
              ),
              Text(
                podcastData.user!.firstNameEn.nullCheck,
                style: AppTextStyles.semiBold.copyWith(
                  // fontWeight: FontWeight.w400,
                  color: AppColors.lighttextColor,
                  fontSize: 1.6 * SizeConfig.heightMultiplier,
                ),
              ),
              10.verticalSpace,
            ],
          )
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('dd MMM yyyy');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }
}
