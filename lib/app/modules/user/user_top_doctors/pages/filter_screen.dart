import 'package:daroon_user/app/model/level_model.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_home/model/speciality_model.dart';
import 'package:daroon_user/app/modules/user/user_home/pages/user_home_screen.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/user_top_doctor_controller.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterScreen extends GetView<UserTopDoctorController> {
  const FilterScreen({super.key});

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
            "Filter",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackBGColor,
              fontSize: 2 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 6 * SizeConfig.widthMultiplier),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              Text(
                "Speciality",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackBGColor,
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                        Get.find<UserHomeController>().specialityList.length,
                        (index) {
                      return _specialtyContainer(
                        Get.find<UserHomeController>().specialityList[index],
                        context,
                        () {
                          controller.selectSpeciality.value = index;
                        },
                        index,
                      );
                    }),
                  ],
                ),
              ),
              24.verticalSpace,
              const Divider(color: Color(0xffE8E8E8)),
              18.verticalSpace,
              Text(
                "Level",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackBGColor,
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: [
                      ...List.generate(
                          controller.isLevelLoading.value
                              ? 6
                              : controller.doctorLevelList.length, (index) {
                        return controller.isLevelLoading.value
                            ? ShimmerLoader(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  // width: MediaQuery.of(Get.context!).size.width * 0.4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: controller.selectLevel.value == index
                                        ? AppColors.primaryColor
                                            .withOpacity(0.07)
                                        : const Color(0xffE8E8E8)
                                            .withOpacity(.5),
                                    border: Border.all(
                                        color: controller.selectLevel.value ==
                                                index
                                            ? AppColors.primaryColor
                                                .withOpacity(0.5)
                                            : const Color(0xffE8E8E8)
                                                .withOpacity(.5)),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              )
                            : _levelContainer(
                                controller.doctorLevelList[index],
                                context,
                                () {
                                  controller.selectLevel.value = index;
                                },
                                index,
                              );
                      }),
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              const Divider(color: Color(0xffE8E8E8)),
              18.verticalSpace,

              Text(
                "Language",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackBGColor,
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: [
                      ...List.generate(controller.languageList.length, (index) {
                        return _languageContainer(
                          controller.languageList[index],
                          context,
                          () {
                            controller.selectlanguage.value = index;
                          },
                          index,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              const Divider(color: Color(0xffE8E8E8)),
              18.verticalSpace,
              Row(
                children: [
                  Text(
                    "Rating",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackBGColor,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                  Text(
                    " (out of 5)",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff898A8D),
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ],
              ),
              // 8.verticalSpace,
              Obx(() => SfRangeSlider(
                    min: 1,
                    max: 5,
                    values: controller.currentRangeValues.value,
                    interval: 1,
                    showTicks: true,
                    showLabels: true,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: const Color(0xffD9D9D9),
                    stepSize: 1,
                    enableTooltip: false,
                    tooltipShape: const SfPaddleTooltipShape(),
                    minorTicksPerInterval: 1,
                    onChanged: (SfRangeValues values) {
                      controller.currentRangeValues.value = values;
                    },
                  )),
              24.verticalSpace,
              const Divider(color: Color(0xffE8E8E8)),
              18.verticalSpace,
              Row(
                children: [
                  Text(
                    "Distance ",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackBGColor,
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                  Text(
                    "(Km)",
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff898A8D),
                      fontSize: 2 * SizeConfig.heightMultiplier,
                    ),
                  ),
                ],
              ),
              // 8.verticalSpace,
              Obx(() => SfRangeSlider(
                    min: 0,
                    max: 100,
                    values: controller.distanceRangeValues.value,
                    interval: 10,
                    showTicks: true,
                    showLabels: true,
                    activeColor: AppColors.primaryColor,
                    inactiveColor: const Color(0xffD9D9D9),
                    stepSize: 10,
                    enableTooltip: false,
                    tooltipShape: const SfPaddleTooltipShape(),
                    minorTicksPerInterval: 0,
                    onChanged: (SfRangeValues values) {
                      controller.distanceRangeValues.value = values;
                    },
                  )),

              24.verticalSpace,
              const Divider(color: Color(0xffE8E8E8)),
              18.verticalSpace,
              Text(
                "Gender",
                style: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackBGColor,
                  fontSize: 2 * SizeConfig.heightMultiplier,
                ),
              ),
              SizedBox(height: 2 * SizeConfig.heightMultiplier),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => Row(
                    children: [
                      ...List.generate(controller.genderList.length, (index) {
                        return _genderContainer(
                          controller.genderList[index],
                          context,
                          () {
                            controller.selectGender.value = index;
                          },
                          index,
                        );
                      }),
                    ],
                  ),
                ),
              ),
              24.verticalSpace,
              Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      onPressed: () {
                        controller.resetFilter();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Reset",
                            style: AppTextStyles.bold.copyWith(
                              fontSize: 16,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        controller.setApi();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 15),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            "Apply",
                            style: AppTextStyles.bold.copyWith(
                              fontSize: 16,
                              color: AppColors.whiteBGColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _specialtyContainer(
    SpecialityModel specialityModel,
    BuildContext context,
    Function()? onTap,
    int index,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(right: 10),
          // width: MediaQuery.of(Get.context!).size.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: controller.selectSpeciality.value == index
                ? AppColors.primaryColor.withOpacity(0.07)
                : const Color(0xffE8E8E8).withOpacity(.5),
            border: Border.all(
                color: controller.selectSpeciality.value == index
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : const Color(0xffE8E8E8).withOpacity(.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NetWorkImageLoader(
                shape: BoxShape.circle,
                boxFit: BoxFit.contain,
                imageURL: specialityModel.image!.md!,
                height: MediaQuery.of(context).size.height * .02,
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.01,
              ),
              Text(
                specialityModel.specialityEn!.capitalizeFirst!,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff1C1B1F),
                  fontSize: SizeConfig.heightMultiplier * 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _levelContainer(
    Level levelModel,
    BuildContext context,
    Function()? onTap,
    int index,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(right: 10),
          // width: MediaQuery.of(Get.context!).size.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: controller.selectLevel.value == index
                ? AppColors.primaryColor.withOpacity(0.07)
                : const Color(0xffE8E8E8).withOpacity(.5),
            border: Border.all(
                color: controller.selectLevel.value == index
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : const Color(0xffE8E8E8).withOpacity(.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                levelModel.levelEn!.capitalizeFirst!,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff1C1B1F),
                  fontSize: SizeConfig.heightMultiplier * 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _languageContainer(
    String title,
    BuildContext context,
    Function()? onTap,
    int index,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(right: 10),
          // width: MediaQuery.of(Get.context!).size.width * 0.4,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: controller.selectlanguage.value == index
                ? AppColors.primaryColor.withOpacity(0.07)
                : const Color(0xffE8E8E8).withOpacity(.5),
            border: Border.all(
                color: controller.selectlanguage.value == index
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : const Color(0xffE8E8E8).withOpacity(.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title.capitalizeFirst!,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff1C1B1F),
                  fontSize: SizeConfig.heightMultiplier * 1.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _genderContainer(
    String title,
    BuildContext context,
    Function()? onTap,
    int index,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Obx(
        () => Container(
          margin: const EdgeInsets.only(right: 14),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: controller.selectGender.value == index
                ? AppColors.primaryColor.withOpacity(0.07)
                : const Color(0xffE8E8E8).withOpacity(.5),
            border: Border.all(
                color: controller.selectGender.value == index
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : const Color(0xffE8E8E8).withOpacity(.5)),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Container(
                  height: 3 * SizeConfig.heightMultiplier,
                  width: 3 * SizeConfig.heightMultiplier,
                  decoration: BoxDecoration(
                      color: controller.selectGender.value == index
                          ? AppColors.primaryColor
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: controller.selectGender.value == index
                              ? AppColors.primaryColor
                              : const Color(0xffE8E8E8),
                          width: 0.5)),
                  child: const Icon(
                    Icons.check,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.height * 0.01),
              Text(
                title,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff1C1B1F),
                  fontSize: SizeConfig.heightMultiplier * 1.8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
