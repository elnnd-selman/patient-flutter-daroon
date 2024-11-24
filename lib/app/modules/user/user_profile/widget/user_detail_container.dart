import 'package:cached_network_image/cached_network_image.dart';
import 'package:daroon_user/app/modules/user/user_profile/model/user_profile_model.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/check_null_value.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserDetailContainer extends StatelessWidget {
  final UserProfileModel userProfileModel;
  const UserDetailContainer({
    super.key,
    required this.userProfileModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: SizeConfig.heightMultiplier * 12,
                  width: SizeConfig.heightMultiplier * 12,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blackBGColor
                      // color: Colors.red,
                      // image: DecorationImage(
                      //   image: AssetImage("assets/images/tempImages.png"),
                      // ),
                      ),
                  child: userProfileModel.profilePicture == null
                      ? Center(
                          child: FittedBox(
                            child: Text(
                              '${userProfileModel.firstName![0].toUpperCase()}${userProfileModel.lastNameEn![1].toUpperCase()}',
                              style: AppTextStyles.bold.copyWith(
                                color: Colors.white,
                                fontSize: Spaces.fontSize(fontSize: 18),
                              ),
                            ),
                          ),
                        )
                      : CachedNetworkImage(
                          imageUrl: userProfileModel.profilePicture!.md!,
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
                                  '${userProfileModel.firstName![0].toUpperCase()}${userProfileModel.lastNameEn![1].toUpperCase()}',
                                  style: AppTextStyles.bold.copyWith(
                                    color: Colors.white,
                                    fontSize: Spaces.fontSize(fontSize: 18),
                                  ),
                                ),
                              ),
                            );
                            // return Padding(
                            //   padding: const EdgeInsets.all(25),
                            //   child: SvgPicture.asset(
                            //     "assets/icons/alert_error.svg",
                            //     colorFilter: ColorFilter.mode(
                            //         Colors.white, BlendMode.srcIn),
                            //   ),
                            // );
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
              20.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  20.verticalSpace,
                  Text(
                    userProfileModel.firstName.nullCheck,
                    style: AppTextStyles.black.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackBGColor,
                      fontSize: 3 * SizeConfig.heightMultiplier,
                    ),
                  ),
                  Text(
                    userProfileModel.username.nullCheck,
                    style: AppTextStyles.semiBold.copyWith(
                      // fontWeight: FontWeight.w400,
                      color: AppColors.lighttextColor,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: 5 * SizeConfig.widthMultiplier,
                vertical: 2 * SizeConfig.heightMultiplier),
            margin: EdgeInsets.only(top: 5.5 * SizeConfig.heightMultiplier),
            // height: 200,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xffF2F8FF),
                borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                _buildUserContainer(
                    context: context,
                    title: "Birthdate",
                    subtitle:
                        formatDate(userProfileModel.dateOfBirth!.toString())),
                _buildUserContainer(
                    context: context,
                    title: "Gender",
                    subtitle:
                        userProfileModel.gender.nullCheck.capitalizeFirst!),
                _buildUserContainer(
                    context: context,
                    title: "Phone Number",
                    subtitle: userProfileModel.phone!.number.nullCheck),
                _buildUserContainer(
                    context: context,
                    title: "Email",
                    subtitle: userProfileModel.email.nullCheck),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat("dd MMM yyyy").format(dateTime);

    return formattedDate;
  }

  Container _buildUserContainer({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5 * SizeConfig.heightMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
          vertical: 2.4 * SizeConfig.heightMultiplier),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: AppColors.whiteBGColor,
          border: Border.all(color: const Color(0XFFE8E8E8), width: 0.5)),
      child: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.30,
            child: Text(
              title,
              style: AppTextStyles.medium.copyWith(
                // fontWeight: FontWeight.w400,
                color: AppColors.lighttextColor,
                fontSize: 1.7 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
          Flexible(
            child: Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.medium.copyWith(
                // fontWeight: FontWeight.w400,
                color: AppColors.blackBGColor,
                fontSize: 1.7 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
