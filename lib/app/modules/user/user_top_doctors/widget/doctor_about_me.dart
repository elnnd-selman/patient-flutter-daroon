import 'package:carousel_slider/carousel_slider.dart';
import 'package:daroon_user/app/model/education_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/top_doctor_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/specific_doctor_offer_container.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class DoctorAboutMe extends GetView<TopDoctorProfileController> {
  final TopDoctorModel topDoctorModel;
  const DoctorAboutMe({super.key, required this.topDoctorModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topDoctorModel.education.isEmpty
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: const Center(child: Text("No Education available ")))
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                    ),
                    itemCount: topDoctorModel.education.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return _buildEducationContainer(
                          context, topDoctorModel.education[itemIndex]);
                    }),
              ),
        SizedBox(height: 3 * SizeConfig.heightMultiplier),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
              color: const Color(0xffE8E8E8).withOpacity(.24),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Languages",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.heightMultiplier * 2,
                ),
              ),
              10.verticalSpace,
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  checkLanguageExist("en")
                      ? _languageContainer("English")
                      : const SizedBox(),
                  checkLanguageExist("ar")
                      ? _languageContainer("Arabic")
                      : const SizedBox(),
                  checkLanguageExist("ku")
                      ? _languageContainer("Kurdish")
                      : const SizedBox(),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 3 * SizeConfig.heightMultiplier),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          decoration: BoxDecoration(
              color: const Color(0xffE8E8E8).withOpacity(.24),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Biography",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: SizeConfig.heightMultiplier * 2,
                ),
              ),
              10.verticalSpace,
              Text(
                topDoctorModel.biographyEn ?? "--",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.lighttextColor,
                  fontSize: SizeConfig.heightMultiplier * 1.6,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 3 * SizeConfig.heightMultiplier),
        Row(
          children: [
            Text(
              "Addresses",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackBGColor,
                fontSize: SizeConfig.heightMultiplier * 1.8,
              ),
            ),
            const Spacer(),
            CustomCupertinoButton(
              onTap: () {
                Get.toNamed(Routes.seeOnMapAppointment, arguments: [
                  topDoctorModel,
                ]);
              },
              child: Text(
                "See On Map",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: 14,
                ),
              ),
            ),
            10.horizontalSpace,
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: AppColors.primaryColor,
            )
          ],
        ),
        SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
        Container(
          height: 0.5,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffE8E8E8),
              width: .5,
            ),
          ),
        ),
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          height: MediaQuery.of(context).size.height * 0.22,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Obx(
                () => controller.isSetting.value
                    ? const Center(child: LoadingWidget())
                    : GoogleMap(
                        markers: Set<Marker>.from(
                          controller.markers.map((marker) => marker),
                        ),
                        mapType: MapType.terrain,
                        initialCameraPosition: controller.kGooglePlex,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController googleCtrl) {
                          controller.completer.complete(googleCtrl);
                        },
                      ),
              )),
        ),
        SizedBox(height: 3 * SizeConfig.heightMultiplier),
        Row(
          children: [
            Text(
              "Offers",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w500,
                color: AppColors.blackBGColor,
                fontSize: SizeConfig.heightMultiplier * 1.8,
              ),
            ),
            // const Spacer(),
            // CustomCupertinoButton(
            //   onTap: () {
            //     Get.toNamed(Routes.seeOnMapAppointment, arguments: [
            //       topDoctorModel,
            //     ]);
            //   },
            //   child: Text(
            //     "See All",
            //     style: AppTextStyles.medium.copyWith(
            //       fontWeight: FontWeight.w600,
            //       color: AppColors.primaryColor,
            //       fontSize: 14,
            //     ),
            //   ),
            // ),
            10.horizontalSpace,
            const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: AppColors.primaryColor,
            )
          ],
        ),
        SizedBox(height: 1.5 * SizeConfig.heightMultiplier),
        Container(
          height: 0.5,
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffE8E8E8),
              width: .5,
            ),
          ),
        ),
        SizedBox(height: 1 * SizeConfig.heightMultiplier),
        Obx(
          () => controller.processing.value
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 7 * SizeConfig.heightMultiplier),
                  child: const Center(child: LoadingWidget()),
                )
              : controller.userOfferModelList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 7 * SizeConfig.heightMultiplier),
                      child: const NoDataWidget(
                        text: "No Offer Fund",
                      ),
                    )
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return SpecificDoctorfferContainer(
                          userOfferModel: controller.userOfferModelList[index],
                        );
                      },
                    ),
        ),
        SizedBox(height: 8 * SizeConfig.heightMultiplier),
      ],
    );
  }

  checkLanguageExist(String langName) {
    bool langExist = false;
    langExist = topDoctorModel.languages.contains(langName);
    return langExist;
  }

  Container _buildEducationContainer(
      BuildContext context, Education education) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.045,
          vertical: MediaQuery.of(context).size.height * 0.018),
      decoration: BoxDecoration(
          color: const Color(0xffE8E8E8).withOpacity(.24),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Education",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
              fontSize: SizeConfig.heightMultiplier * 2,
            ),
          ),
          10.verticalSpace,
          Text(
            education.degreeNameEn!,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackBGColor,
              fontSize: SizeConfig.heightMultiplier * 1.8,
            ),
          ),
          7.verticalSpace,
          Text(
            education.instituteEn!,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.lighttextColor,
              fontSize: SizeConfig.heightMultiplier * 1.8,
            ),
          ),
          Text(
            "${education.fromYear!} - ${education.toYear!}",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.lighttextColor,
              fontSize: SizeConfig.heightMultiplier * 1.8,
            ),
          ),
        ],
      ),
    );
  }

  formatDate(String date) {
    final startDate = DateTime.parse(date);
    DateFormat formatter = DateFormat('MMM yy');
    String formattedDate = formatter.format(startDate);
    return formattedDate;
  }

  Container _languageContainer(String language) {
    return Container(
      margin: EdgeInsets.only(right: 4 * SizeConfig.widthMultiplier),
      padding: EdgeInsets.symmetric(
          horizontal: 5 * SizeConfig.widthMultiplier, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.06),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Center(
        child: Text(
          language,
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.blackBGColor,
            fontSize: SizeConfig.heightMultiplier * 1.8,
          ),
        ),
      ),
    );
  }
}
