import 'package:carousel_slider/carousel_slider.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/office_on_map_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/model/top_doctor_model.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SeeOnMapAppointment extends GetView<OfficeOnMapController> {
  SeeOnMapAppointment({super.key});

  final topDoctorModel = Get.arguments[0] as TopDoctorModel;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OfficeOnMapController>(initState: (_) {
      controller.setMarker(topDoctorModel);
    }, builder: (_) {
      return Scaffold(
        body: Container(
          // margin: const EdgeInsets.symmetric(vertical: 6),
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Obx(
                  () => controller.isSetting.value
                      ? const Center(child: LoadingWidget())
                      : GoogleMap(
                          markers: Set<Marker>.from(
                            controller.markers.map((marker) => marker),
                          ),
                          mapType: MapType.terrain,
                          initialCameraPosition: controller.kGooglePlex.value,
                          myLocationEnabled: true,
                          onMapCreated: (GoogleMapController googleCtrl) {
                            controller.mapController = googleCtrl;
                            controller.completer.complete(googleCtrl);
                          },
                        ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: SizedBox(
                  // color: AppColors.w,
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.23,
                  child: CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: .9,
                        onPageChanged: (val, v) {
                          onMapInitialized(
                              topDoctorModel
                                  .offices[val].address!.coordinate!.latitude!,
                              topDoctorModel.offices[val].address!.coordinate!
                                  .longitude!);
                        },
                      ),
                      itemCount: topDoctorModel.offices.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return SeeOnMapContainer(
                          topDoctorModel: topDoctorModel,
                          officeAddreesModel: topDoctorModel.offices[itemIndex],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  void onMapInitialized(double lat, double long) {
    controller.mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(lat, long),
        16,
      ),
    );
  }
}

class SeeOnMapContainer extends StatelessWidget {
  final TopDoctorModel topDoctorModel;
  final Office officeAddreesModel;
  const SeeOnMapContainer(
      {super.key,
      required this.officeAddreesModel,
      required this.topDoctorModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
          vertical: 2 * SizeConfig.heightMultiplier,
          horizontal: 4 * SizeConfig.widthMultiplier),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.whiteBGColor,
          border: Border.all(color: const Color(0xffE8E8E8), width: 0.5)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 12,
                width: 12,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xff6FCF84)),
              ),
              10.horizontalSpace,
              CustomCupertinoButton(
                child: Text(
                  "${officeAddreesModel.daysOpen.length} days per week",
                  style: AppTextStyles.medium.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff898A8D),
                    fontSize: 1.4 * SizeConfig.heightMultiplier,
                  ),
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
                      border: Border.all(color: AppColors.primaryColor),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        Assets.locationIcon,
                        colorFilter: const ColorFilter.mode(
                            AppColors.whiteBGColor, BlendMode.srcIn),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 2 * SizeConfig.heightMultiplier),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      officeAddreesModel.title!,
                      maxLines: 1,
                      style: AppTextStyles.black.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackBGColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      officeAddreesModel.description!,
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
          ),
          SizedBox(height: 2.5 * SizeConfig.heightMultiplier),
          CustomButton(
              ontap: () {
                Get.toNamed(Routes.createAppointment, arguments: [
                  topDoctorModel,
                  officeAddreesModel,
                ]);
              },
              name: "Select"),
        ],
      ),
    );
  }
}
