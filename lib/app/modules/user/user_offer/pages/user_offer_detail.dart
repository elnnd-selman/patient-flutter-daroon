import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';

class UserOfferDetailScreen extends StatelessWidget {
  const UserOfferDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.45,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/temp1.png"),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5 * SizeConfig.heightMultiplier),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4 * SizeConfig.widthMultiplier),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back,
                            color: AppColors.whiteBGColor,
                          ),
                        ),
                        Text(
                          "My Offers",
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.whiteBGColor,
                            fontSize: 2 * SizeConfig.heightMultiplier,
                          ),
                        ),
                        Container(
                          height: 7 * SizeConfig.heightMultiplier,
                          width: 7 * SizeConfig.widthMultiplier,
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .41,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: AppColors.whiteBGColor,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 8 * SizeConfig.widthMultiplier),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6 * SizeConfig.heightMultiplier),
                      Text(
                        "Offer Title",
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
                              "• 31 Oct - 15 Nov",
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
                              "• 40% Off",
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
                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to the visual form of a form of a   form of a  document In publishing and graphic desi",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff484848),
                          fontSize: SizeConfig.heightMultiplier * 1.6,
                        ),
                      ),
                      SizedBox(height: 4 * SizeConfig.heightMultiplier),
                      CommonButton(ontap: () {}, name: "Book"),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .387,
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
