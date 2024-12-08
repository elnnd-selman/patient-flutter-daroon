import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/app/modules/user/user_offer/controller/user_offers_controller.dart';
import 'package:daroon_user/app/modules/user/user_offer/widget/user_offer_container.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class UserOfferScreen extends GetView<UserOffersController> {
  const UserOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            "My Offers",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackBGColor,
              fontSize: 2 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => SearchBarAnimation(
                isOriginalAnimation: false,
                buttonColour: controller.isAppBarOpen.value
                    ? const Color(0xffF7F7F8)
                    : AppColors.whiteBGColor,
                searchBoxColour: const Color(0xffF7F7F8).withOpacity(1),
                isSearchBoxOnRightSide: true,
                enableBoxShadow: false,
                enableButtonShadow: false,
                hintText: "Search Offer",
                buttonBorderColour: Colors.black45,
                searchBoxWidth: MediaQuery.of(context).size.width * 0.94,
                onFieldSubmitted: (String value) {
                  debugPrint('onFieldSubmitted value $value');
                },
                onPressButton: (open) {
                  controller.isAppBarOpen.value = open;
                },
                textEditingController: controller.offerTextField,
                onChanged: (val) {
                  final query = val.toString();
                  if (query.isEmpty) {
                    controller.isSearch.value = false;
                  } else {
                    controller.isSearch.value = true;
                    controller.searchOffer(query);
                  }
                },
                trailingWidget: SvgPicture.asset(
                  Assets.serachIcon,
                  colorFilter: const ColorFilter.mode(
                      Color(0xff979797), BlendMode.srcIn),
                ),
                secondaryButtonWidget: const Icon(Icons.close),
                buttonWidget: SvgPicture.asset(Assets.serachIcon),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 6 * SizeConfig.widthMultiplier),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 3 * SizeConfig.heightMultiplier),
            Obx(
              () => Text(
                "${controller.userOfferModelList.length} Offers",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff898A8D),
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
            Obx(
              () => controller.processing.value
                  ? const Expanded(child: LoadingWidget())
                  : controller.userOfferModelList.isEmpty
                      ? const Expanded(
                          child: NoDataWidget(
                            text: "No Offer Fund",
                          ),
                        )
                      : controller.isSearch.value
                          ? controller.searchOfferList.isEmpty
                              ? const Expanded(
                                  child: NoDataWidget(
                                    text: "No Offer Fund",
                                  ),
                                )
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount:
                                        controller.searchOfferList.length,
                                    itemBuilder: (context, index) {
                                      return UserOfferContainer(
                                        userOfferModel:
                                            controller.searchOfferList[index],
                                      );
                                    },
                                  ),
                                )
                          : Expanded(
                              child: ListView.builder(
                                itemCount: controller.userOfferModelList.length,
                                itemBuilder: (context, index) {
                                  return UserOfferContainer(
                                    userOfferModel:
                                        controller.userOfferModelList[index],
                                  );
                                },
                              ),
                            ),
            )
          ],
        ),
      ),
    );
  }
}
