import 'package:daroon_user/app/modules/user/user_offer/model/user_offer_model.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:intl/intl.dart';

class SpecificDoctorfferContainer extends StatelessWidget {
  final UserOfferModel userOfferModel;
  const SpecificDoctorfferContainer({super.key, required this.userOfferModel});

  @override
  Widget build(BuildContext context) {
    return CustomCupertinoButton(
      onTap: () => Get.toNamed(Routes.userOffersDetails, arguments: [
        userOfferModel,
      ]),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xffE8E8E8),
              width: 0.5,
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 24 * SizeConfig.heightMultiplier,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: NetWorkImageLoader(
                        height: 24 * SizeConfig.heightMultiplier,
                        width: MediaQuery.of(context).size.width,
                        imageURL: userOfferModel.image!.bg!,
                      ),
                    ),
                    Positioned(
                      top: 2 * SizeConfig.heightMultiplier,
                      right: 14,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                            color: AppColors.whiteBGColor.withOpacity(0.43),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.whiteBGColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 2 * SizeConfig.heightMultiplier,
                      right: 14,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 14),
                        // height: 7 * SizeConfig.heightMultiplier,
                        // width: 7 * SizeConfig.widthMultiplier,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.88),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20))
                            // shape: BoxShape.circle,
                            ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/offerBookIcon.svg",
                                height: 14),
                            10.horizontalSpace,
                            Text("Booked 30+ times",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.blackBGColor,
                                  fontSize: 12,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userOfferModel.titleEn!,
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackBGColor,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    userOfferModel.descriptionEn!,
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyBGColor.withOpacity(0.6),
                      fontSize: 15,
                    ),
                  ),
                  10.verticalSpace,
                  Container(
                    // margin: EdgeInsets.symmetric(horizontal: 4),
                    height: 0.2,
                    color: const Color(0xffC4C4C4),
                  ),
                  4.verticalSpace,
                  Wrap(
                    children: [
                      _moreOfferContainer(
                          "assets/icons/calendar.svg",
                          "• ${formatDate(userOfferModel.startTime!, userOfferModel.endTime!)}",
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
                          "• ${userOfferModel.discountPercentage}% Off",
                          Colors.red,
                          MediaQuery.of(context).size.width * 0.35),
                    ],
                  ),
                  4.verticalSpace,
                  CommonButton(ontap: () {}, name: "Book")
                ],
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
