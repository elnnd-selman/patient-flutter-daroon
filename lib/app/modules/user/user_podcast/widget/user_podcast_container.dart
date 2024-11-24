import 'package:daroon_user/app/modules/user/user_podcast/model/user_podcast_model.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class UserPodCastContainer extends StatelessWidget {
  final PodCastModel podCastModel;
  const UserPodCastContainer({
    super.key,
    required this.podCastModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 1,
      height: 30 * SizeConfig.heightMultiplier,
      margin: EdgeInsets.symmetric(horizontal: 0 * SizeConfig.widthMultiplier),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          podCastModel.images.isEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: 30 * SizeConfig.heightMultiplier,
                    margin: EdgeInsets.symmetric(
                        horizontal: 0 * SizeConfig.widthMultiplier),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: const DecorationImage(
                          image: AssetImage("assets/images/podcast_image.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: NetWorkImageLoader(
                    imageURL: podCastModel.images[0],
                    width: MediaQuery.of(context).size.width * 1,
                    height: 31 * SizeConfig.heightMultiplier,
                    boxFit: BoxFit.cover,
                  ),
                ),
          Positioned(
            top: 2 * SizeConfig.heightMultiplier,
            left: 6 * SizeConfig.widthMultiplier,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 14),
              decoration: BoxDecoration(
                color: AppColors.blackBGColor.withOpacity(.14),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                "10:20",
                style: AppTextStyles.medium
                    .copyWith(fontSize: 14, color: AppColors.whiteBGColor),
              ),
            ),
          ),
          Positioned(
            right: 6 * SizeConfig.widthMultiplier,
            bottom: 13 * SizeConfig.heightMultiplier,
            child: Container(
              height: 6 * SizeConfig.heightMultiplier,
              width: 6 * SizeConfig.heightMultiplier,
              decoration: const BoxDecoration(
                color: AppColors.whiteBGColor,
                shape: BoxShape.circle,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 1 * SizeConfig.widthMultiplier),
                    child: SvgPicture.asset(
                      "assets/icons/pause.svg",
                      height: 2.6 * SizeConfig.heightMultiplier,
                      colorFilter: const ColorFilter.mode(
                          AppColors.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 1 * SizeConfig.heightMultiplier,
                  horizontal: 6 * SizeConfig.widthMultiplier),
              width: MediaQuery.of(context).size.width,
              height: 16 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF).withOpacity(.3),
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  6.verticalSpace,
                  Row(
                    children: [
                      podCastModel.user!.profilePicture == null
                          ? Container(
                              height: 4 * SizeConfig.heightMultiplier,
                              width: 4 * SizeConfig.heightMultiplier,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffFFFFFF).withOpacity(.3),
                              ),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    '${podCastModel.user!.firstNameEn![0].toUpperCase()}${podCastModel.user!.firstName![0].toUpperCase()}',
                                    style: AppTextStyles.bold.copyWith(
                                      color: Colors.white,
                                      fontSize: Spaces.fontSize(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : NetWorkImageLoader(
                              imageURL: podCastModel.user!.profilePicture!,
                              height: 4 * SizeConfig.heightMultiplier,
                              width: 4 * SizeConfig.heightMultiplier,
                              containerColor:
                                  const Color(0xffFFFFFF).withOpacity(.3),
                              shape: BoxShape.circle,
                            ),
                      14.horizontalSpace,
                      Text(
                        podCastModel.user!.firstName!.capitalizeFirst!,
                        style: AppTextStyles.medium.copyWith(
                            fontSize: 1.7 * SizeConfig.heightMultiplier,
                            color: AppColors.whiteBGColor),
                      ),
                    ],
                  ),
                  10.verticalSpace,
                  Text(
                    podCastModel.titleEn!.capitalizeFirst!,
                    style: AppTextStyles.medium.copyWith(
                        fontSize: 2.2 * SizeConfig.heightMultiplier,
                        color: AppColors.whiteBGColor),
                  ),
                  10.verticalSpace,
                  Row(
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
                          " ${podCastModel.likes} Likes",
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColors.whiteBGColor,
                            fontSize: SizeConfig.heightMultiplier * 1.4,
                          ),
                        ),
                      ),
                      20.horizontalSpace,
                      SvgPicture.asset(
                        Assets.commentIcon,
                        height: 16,
                        colorFilter: const ColorFilter.mode(
                            AppColors.whiteBGColor, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "${podCastModel.commentCount} Comment",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.whiteBGColor,
                          fontSize: SizeConfig.heightMultiplier * 1.4,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
