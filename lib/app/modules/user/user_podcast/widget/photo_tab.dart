import 'package:daroon_user/app/modules/user/user_podcast/controller/user_presenter_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class PhotoTab extends GetView<UserPresenterProfileController> {
  const PhotoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        7.verticalSpace,
        Obx(
          () => Text(
            "${controller.photoList.length} Photo",
            style: AppTextStyles.medium
                .copyWith(color: AppColors.lightgreyColor, fontSize: 16),
          ),
        ),
        10.verticalSpace,
        Obx(
          () => controller.processing.value
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15 * SizeConfig.heightMultiplier),
                  child: const Center(child: LoadingWidget()),
                )
              : controller.photoList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15 * SizeConfig.heightMultiplier),
                      child: const Center(
                          child: NoDataWidget(text: "No Photo Found")),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.photoList.length,
                      itemBuilder: (context, index) {
                        return CustomCupertinoButton(
                          onTap: () {
                            Get.toNamed(Routes.presenterPodCastDetail,
                                arguments: [controller.photoList[index]]);
                          },
                          child: UserPhotoContainer(
                              podCastModel: controller.photoList[index]),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}

class UserPhotoContainer extends StatelessWidget {
  final PodCastModel podCastModel;
  const UserPhotoContainer({
    super.key,
    required this.podCastModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 3 * SizeConfig.heightMultiplier),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffE8E8E8), width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          podCastModel.type == "text"
              ? const SizedBox()
              : Container(
                  height: 20 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 20 * SizeConfig.heightMultiplier,
                          decoration: BoxDecoration(
                            borderRadius: podCastModel.images.length < 2
                                ? BorderRadius.circular(16)
                                : const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                          ),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: podCastModel.images.length < 2
                                    ? BorderRadius.circular(16)
                                    : const BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                      ),
                                child: NetWorkImageLoader(
                                  imageURL: podCastModel.images[0],
                                  height: 20 * SizeConfig.heightMultiplier,
                                  width: MediaQuery.of(context).size.width,
                                  boxFit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: 2 * SizeConfig.heightMultiplier,
                                left: 4 * SizeConfig.widthMultiplier,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite,
                                      color: AppColors.whiteBGColor,
                                    ),
                                    const SizedBox(width: 4),
                                    CupertinoButton(
                                      pressedOpacity: 0,
                                      padding: EdgeInsets.zero,
                                      minSize: 0,
                                      onPressed: () {},
                                      child: Text(
                                        "${podCastModel.likes}",
                                        style: AppTextStyles.medium.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.whiteBGColor,
                                          fontSize:
                                              SizeConfig.heightMultiplier * 1.4,
                                        ),
                                      ),
                                    ),
                                    20.horizontalSpace,
                                    SvgPicture.asset(
                                      Assets.commentIcon,
                                      height: 16,
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.whiteBGColor,
                                          BlendMode.srcIn),
                                    ),
                                    6.horizontalSpace,
                                    Text(
                                      "${podCastModel.commentCount}",
                                      style: AppTextStyles.medium.copyWith(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.whiteBGColor,
                                        fontSize:
                                            SizeConfig.heightMultiplier * 1.4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      podCastModel.images.length >= 2
                          ? Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                      child: NetWorkImageLoader(
                                        imageURL: podCastModel.images[1],
                                        height:
                                            20 * SizeConfig.heightMultiplier,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        boxFit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
          10.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ReadMoreText(
              podCastModel.contentEn!,
              trimMode: TrimMode.Line,
              trimLines: 2,
              trimLength: 200,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'More',
              trimExpandedText: 'Less',
              style: AppTextStyles.normal.copyWith(
                fontSize: 14,
                color: AppColors.blackBGColor.withOpacity(.6),
              ),
              moreStyle: AppTextStyles.normal.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
          ),
          10.verticalSpace,
          Container(color: const Color(0xffE8E8E8), height: 0.5),
          10.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              10.horizontalSpace,
              SvgPicture.asset(
                "assets/icons/clock.svg",
                height: 2.5 * SizeConfig.heightMultiplier,
              ),
              14.horizontalSpace,
              Text(
                "Created at ${formatDateTime(podCastModel.createdAt!)}",
                style: AppTextStyles.normal.copyWith(
                  fontSize: 12,
                  color: AppColors.lighttextColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat timeFormat = DateFormat('hh:mm a');
    final DateFormat dateFormat = DateFormat('dd MMMM yyyy');
    String formattedTime = timeFormat.format(dateTime);
    String formattedDate = dateFormat.format(dateTime);
    return '$formattedTime - $formattedDate';
  }
}
