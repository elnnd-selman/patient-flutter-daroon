import 'package:daroon_user/app/modules/user/user_top_doctors/controller/create_appointment_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/auth_text_field.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreatePatientDetailScreen extends GetView<CreateAppointmentController> {
  const CreatePatientDetailScreen({super.key});

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
            "Patient Detail",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackBGColor,
              fontSize: 2 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 2 * SizeConfig.heightMultiplier,
                horizontal: 6 * SizeConfig.widthMultiplier),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Booking For",
                    style: AppTextStyles.medium.copyWith(fontSize: 16),
                  ),
                  13.verticalSpace,
                  DropdownButtonFormField2<String>(
                    value: controller.bookFor.value,
                    isExpanded: true,
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: AppColors.blackBGColor,
                    ),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xffF7F7F8),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    hint: Text(
                      'Booking For',
                      style: AppTextStyles.medium.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: const Color(0xffA0A1AB),
                      ),
                    ),
                    items: controller.bookForList
                        .map<DropdownMenuItem<String>>((booked) {
                      return DropdownMenuItem<String>(
                        value: booked,
                        child: Text(booked),
                      );
                    }).toList(),
                    validator: (value) {
                      if (value == null) {
                        return '   Please Choose level';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.bookFor.value = value!;
                    },
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.only(
                          right: 4 * SizeConfig.widthMultiplier),
                    ),
                    iconStyleData: IconStyleData(
                      icon: SvgPicture.asset("assets/icons/downIcon.svg"),
                      iconSize: 24,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      elevation: 0,
                      decoration: BoxDecoration(
                        color: const Color(0xffF7F7F8),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                  24.verticalSpace,
                  Obx(
                    () => controller.bookFor.value == "Your Self"
                        ? const SizedBox()
                        : Text(
                            "Name",
                            style: AppTextStyles.medium.copyWith(fontSize: 16),
                          ),
                  ),
                  Obx(
                    () => controller.bookFor.value == "Your Self"
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: CommonTextfeild(
                              obscuretext: false,
                              hinttext: "Full Name",
                              validations: (val) {},
                              controller: controller.name,
                              keyboardType: TextInputType.name,
                              showicon: false,
                              scanIcons: false,
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.bookFor.value == "Your Self"
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              "Age",
                              style:
                                  AppTextStyles.medium.copyWith(fontSize: 16),
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.bookFor.value == "Your Self"
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 13),
                            child: CommonTextfeild(
                              obscuretext: false,
                              hinttext: "e.g 24 Years",
                              validations: (val) {},
                              controller: controller.age,
                              keyboardType: TextInputType.number,
                              showicon: false,
                              scanIcons: false,
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.bookFor.value == "Your Self"
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Text(
                              "Gender",
                              style:
                                  AppTextStyles.medium.copyWith(fontSize: 16),
                            ),
                          ),
                  ),
                  Obx(
                    () => controller.bookFor.value == "Your Self"
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 24),
                            child: Row(
                              children: [
                                ...List.generate(2, (index) {
                                  return CustomCupertinoButton(
                                    onTap: () {
                                      controller.selectedGender.value = index;
                                    },
                                    child: _buildGenderContainer(
                                      index: index,
                                      title: index == 0 ? "Male" : "Female",
                                    ),
                                  );
                                })
                              ],
                            ),
                          ),
                  ),
                  24.verticalSpace,
                  Text(
                    "Extra Information",
                    style: AppTextStyles.medium.copyWith(fontSize: 16),
                  ),
                  13.verticalSpace,
                  CommonTextfeild(
                    obscuretext: false,
                    maxLine: 4,
                    hinttext: "Type here..",
                    validations: (val) {},
                    controller: controller.extraInfo,
                    keyboardType: TextInputType.name,
                    showicon: false,
                    scanIcons: false,
                  ),
                  24.verticalSpace,
                  Obx(
                    () => CommonButton(
                        isLoading: controller.loading.value,
                        ontap: () {
                          controller.checkPaitentValidation(context);
                        },
                        name: "Done"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Obx _buildGenderContainer({required String title, required int index}) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(right: 4 * SizeConfig.widthMultiplier),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
            color: controller.selectedGender.value == index
                ? const Color(0xff59A4FC).withOpacity(0.07)
                : const Color(0xffE8E8E8).withOpacity(.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: controller.selectedGender.value == index
                    ? AppColors.primaryColor.withOpacity(0.5)
                    : const Color(0xffE8E8E8).withOpacity(.5),
                width: 0.5)),
        child: Row(
          children: [
            Container(
              height: 4 * SizeConfig.heightMultiplier,
              width: 4 * SizeConfig.heightMultiplier,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: controller.selectedGender.value == index
                    ? AppColors.primaryColor
                    : Colors.white,
              ),
              child: const Center(
                  child: Icon(
                Icons.check,
                color: Colors.white,
              )),
            ),
            14.horizontalSpace,
            Text(
              title,
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.blackBGColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
