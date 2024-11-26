import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:daroon_user/app/modules/user/user_home/widget/home_upcoming_appointment.dart';
import 'package:daroon_user/app/modules/user/user_home/widget/vip_doctor_container.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/top_doctor_conatiner.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_home/widget/user_doctor_special_container.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class UserHomeScreen extends GetView<UserHomeController> {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
          vertical: 3 * SizeConfig.heightMultiplier),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => controller.isAdsLoading.value
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                          color: AppColors.lightgreyColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Center(child: LoadingWidget()),
                    )
                  : controller.publicADSList.isEmpty
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.2,
                          decoration: BoxDecoration(
                              color: AppColors.lightgreyColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Center(
                              child: NoDataWidget(text: "No Ads available")))
                      : _buildImageSlider(context),
            ),
            SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
            _buildCirclurContainer(),
            SizedBox(height: 4 * SizeConfig.heightMultiplier),
            SizedBox(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              child: Obx(
                () => controller.isVipLoading.value
                    ? const Center(child: LoadingWidget())
                    : controller.vipDoctorModelList.isEmpty
                        ? const Center(
                            child:
                                NoDataWidget(text: "No Vip Doctor\n available"))
                        : AppinioSwiper(
                            loop: true,
                            invertAngleOnBottomDrag: false,
                            backgroundCardOffset: const Offset(1, 20),
                            backgroundCardCount: 2,
                            swipeOptions: const SwipeOptions.all(),
                            controller: controller.appinioSwiperController,
                            onCardPositionChanged: (
                              SwiperPosition position,
                            ) {},
                            onSwipeEnd: controller.swipeEnd,
                            onEnd: controller.onEnd,
                            cardCount: controller.vipDoctorModelList.length,
                            cardBuilder: (BuildContext context, int index) {
                              return VipDoctorContainer(
                                  topDoctorModel:
                                      controller.vipDoctorModelList[index]);
                            },
                          ),
              ),
            ),
            SizedBox(height: 5 * SizeConfig.heightMultiplier),
            _buildTitleRow("Doctor Specialty"),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            const UserDoctorSpecialtyContainer(),
            SizedBox(height: 4 * SizeConfig.heightMultiplier),
            _buildTitleRow("Upcoming Appointment"),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            const HomeUpcomingAppointment(),
            CustomCupertinoButton(
              onTap: () {
                Get.toNamed(Routes.userOfferScreen);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/Ad Banner.png"),
                  ),
                ),
              ),
            ),
            SizedBox(height: 4 * SizeConfig.heightMultiplier),
            _buildTitleRow("Top Doctors"),
            SizedBox(height: 2 * SizeConfig.heightMultiplier),
            Obx(
              () => controller.isLoading.value
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 7 * SizeConfig.heightMultiplier),
                      child: const Center(child: LoadingWidget()),
                    )
                  : controller.topDoctorModelList.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 7 * SizeConfig.heightMultiplier),
                          child: const Center(
                              child: NoDataWidget(text: "No Doctor Found")),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 1,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return TopDoctorContainer(
                              topDoctorModel:
                                  controller.topDoctorModelList[index],
                            );
                          },
                        ),
            ),
            SizedBox(
              height: 60 * SizeConfig.heightMultiplier,
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTitleRow(String title) {
    return Row(
      children: [
        Text(
          title,
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackBGColor,
            fontSize: SizeConfig.heightMultiplier * 2,
          ),
        ),
        // const Spacer(),
        // Text(
        //   "See All",
        //   style: AppTextStyles.medium.copyWith(
        //     fontWeight: FontWeight.w500,
        //     color: AppColors.primaryColor,
        //     fontSize: 12,
        //   ),
        // ),
      ],
    );
  }

  Obx _buildCirclurContainer() {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(controller.publicADSList.length, (int index) {
              return Obx(() => Container(
                    margin: const EdgeInsets.only(right: 6),
                    height: controller.isSelected.value == index ? 8 : 8,
                    width: controller.isSelected.value == index ? 8 : 8,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: controller.isSelected.value == index
                            ? AppColors.primaryColor
                            : Colors.black.withOpacity(0.12)),
                  ));
            }),
          ],
        ));
  }

  CarouselSlider _buildImageSlider(BuildContext context) {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.2,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        // enlargeCenterPage: false,
        enlargeFactor: 0,
        scrollDirection: Axis.horizontal,
        onPageChanged: (val, v) {
          controller.isSelected.value = val;
        },
      ),
      itemCount: controller.publicADSList.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        height: MediaQuery.of(context).size.height * 0.2,
        width: 100 * SizeConfig.widthMultiplier,
        padding: EdgeInsets.only(left: 3 * SizeConfig.widthMultiplier),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // image: const DecorationImage(
          //   image: AssetImage("assets/images/tempImage.png"),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: NetWorkImageLoader(
                boxFit: BoxFit.cover,
                imageURL: controller.publicADSList[itemIndex].image!.md!,
                height: MediaQuery.of(context).size.height * 0.2,
                width: 100 * SizeConfig.widthMultiplier,
              ),
            ),
            // SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            //   decoration: BoxDecoration(
            //       color: Colors.white, borderRadius: BorderRadius.circular(20)),
            //   child: Text(
            //     "Special for you",
            //     style: AppTextStyles.medium.copyWith(
            //       fontWeight: FontWeight.w500,
            //       color: AppColors.primaryColor,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 2.8 * SizeConfig.heightMultiplier),
            Positioned(
              bottom: 5 * SizeConfig.heightMultiplier,
              left: 6 * SizeConfig.widthMultiplier,
              child: Text(
                controller.publicADSList[itemIndex].titleAr!,
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.whiteBGColor,
                  fontSize: 20,
                ),
              ),
            ),
            Positioned(
              bottom: 2 * SizeConfig.heightMultiplier,
              left: 6 * SizeConfig.widthMultiplier,
              child: Text(
                controller.publicADSList[itemIndex].descriptionEn!,
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lightgreyColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
