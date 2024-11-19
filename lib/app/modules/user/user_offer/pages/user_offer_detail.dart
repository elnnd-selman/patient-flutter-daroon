import 'package:daroon_user/app/modules/user/user_offer/model/user_offer_model.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:intl/intl.dart';

class UserOfferDetailScreen extends StatelessWidget {
  UserOfferDetailScreen({super.key});

  final offerData = Get.arguments[0] as UserOfferModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(Get.context!).size.width * 1,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  NetWorkImageLoader(
                      imageURL: offerData.image!.bg!,
                      height: MediaQuery.of(context).size.height * 0.45,
                      boxFit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 5 * SizeConfig.heightMultiplier,
                        horizontal: 4 * SizeConfig.widthMultiplier),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomCupertinoButton(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteBGColor,
                          ),
                        ),
                        Text(
                          offerData.titleEn!,
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteBGColor,
                            fontSize: 2 * SizeConfig.heightMultiplier,
                          ),
                        ),
                        const SizedBox(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .60,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: AppColors.whiteBGColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8 * SizeConfig.widthMultiplier),
                  child: ListView(
                    // physics: ,
                    // physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,

                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6 * SizeConfig.heightMultiplier),
                      Text(
                        offerData.titleEn!,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: AppColors.blackBGColor,
                          fontSize: SizeConfig.heightMultiplier * 2.4,
                        ),
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      Wrap(
                        children: [
                          _moreOfferContainer(
                              "assets/icons/calendar.svg",
                              "• ${formatDate(offerData.startTime!, offerData.endTime!)}",
                              AppColors.primaryColor,
                              MediaQuery.of(context).size.width * 0.47),
                          5.horizontalSpace,
                          _moreOfferContainer(
                              "assets/icons/key.svg",
                              "• 12BC4",
                              AppColors.primaryColor,
                              MediaQuery.of(context).size.width * 0.35),
                          _moreOfferContainer(
                              "assets/icons/newoffer.svg",
                              "• ${offerData.discountPercentage}% Off",
                              Colors.red,
                              MediaQuery.of(context).size.width * 0.35),
                        ],
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Container(
                        // margin: EdgeInsets.symmetric(horizontal: 4),
                        height: 0.5,
                        color: const Color(0xffC4C4C4),
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Text(
                        offerData.descriptionEn!,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff484848),
                          fontSize: SizeConfig.heightMultiplier * 1.6,
                        ),
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Container(
                        height: 0.5,
                        color: const Color(0xffC4C4C4),
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Text(
                        'Available addresses',
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff898A8D),
                          fontSize: SizeConfig.heightMultiplier * 2,
                        ),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.symmetric(
                            vertical: 2 * SizeConfig.heightMultiplier,
                            horizontal: 5 * SizeConfig.widthMultiplier),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: const Color(0xffE8E8E8), width: 0.5)),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 12,
                                  width: 12,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff6FCF84)),
                                ),
                                10.horizontalSpace,
                                Text(
                                  "${offerData.office!.daysOpen.length} days per week",
                                  style: AppTextStyles.medium.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff898A8D),
                                    fontSize: 1.4 * SizeConfig.heightMultiplier,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2 * SizeConfig.heightMultiplier),
                            Container(
                              height: 0.5,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(0xffE8E8E8),
                                  width: .5,
                                ),
                              ),
                            ),
                            SizedBox(height: 2 * SizeConfig.heightMultiplier),
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 42,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: AppColors.primaryColor,
                                        border: Border.all(
                                            color: AppColors.primaryColor),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SvgPicture.asset(
                                          Assets.locationIcon,
                                          colorFilter: const ColorFilter.mode(
                                              AppColors.whiteBGColor,
                                              BlendMode.srcIn),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    width: 2 * SizeConfig.heightMultiplier),
                                Flexible(
                                  child: Column(
                                    children: [
                                      Text(
                                        offerData.office!.description!,
                                        maxLines: 2,
                                        style: AppTextStyles.black.copyWith(
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.blackBGColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      CommonButton(ontap: () {}, name: "Book"),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .378,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/ph_user.svg",
                      height: 20,
                      width: 20,
                    ),
                    10.horizontalSpace,
                    Text(
                      "Booked 30+ times",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteBGColor,
                        fontSize: 1.4 * SizeConfig.heightMultiplier,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime startDate, DateTime endDate) {
    DateFormat formatter = DateFormat('dd MMM');
    String formattedDate = formatter.format(startDate);

    String formatEndDate = formatter.format(endDate);
    return "$formattedDate - $formatEndDate";
  }

  Container _moreOfferContainer(
      String icon, String text, Color color, double width) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 10),
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffC4C4C4).withOpacity(0.15),
          border: Border.all(
              color: const Color(0xffC4C4C4).withOpacity(0.5), width: 0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 18,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
          6.horizontalSpace,
          Text(
            text,
            maxLines: 1,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              color: color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
