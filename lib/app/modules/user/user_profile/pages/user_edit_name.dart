import 'package:daroon_user/app/modules/user/user_profile/controller/user_change_name_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_edit_profile_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserEditName extends GetView<UserChangeNameController> {
  const UserEditName({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserChangeNameController>(initState: (_) {
      controller.setUserEmail(
          Get.find<UserEditProfileController>()
              .userProfileModel
              .value!
              .firstName,
          Get.find<UserEditProfileController>()
              .userProfileModel
              .value!
              .lastNameEn);
    }, builder: (_) {
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
              "Edit Name",
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.blackBGColor,
                fontSize: 2 * SizeConfig.heightMultiplier,
              ),
            ),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value
              ? const LoadingWidget()
              : Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 6 * SizeConfig.widthMultiplier),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3 * SizeConfig.heightMultiplier),
                      Text(
                        "Provide your available name, for better service.",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707281),
                          fontSize: 1.6 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      TextFormField(
                        // autovalidateMode:,
                        controller: controller.name,
                        maxLines: 1,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.primaryColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 14),
                          fillColor: const Color(0xffF7F7F8),
                          filled: true,
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          isDense: true,
                          hintText: "Enter First Name",
                          hintStyle: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xff535353),
                          ),
                        ),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      TextFormField(
                        // autovalidateMode:,
                        controller: controller.lastName,
                        maxLines: 1,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.primaryColor,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.black12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 14),
                          fillColor: const Color(0xffF7F7F8),
                          filled: true,
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.borderColor),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          isDense: true,
                          hintText: "Enter Last Name",
                          hintStyle: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xff535353),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Obx(
                        () => CommonButton(
                            isLoading: controller.processing.value,
                            ontap: () {
                              if (controller.name.text.isEmpty &&
                                  controller.lastName.text.isEmpty) {
                                showToastMessage(
                                    message: 'Enter First Name',
                                    context: context,
                                    color: const Color(0xffEC1C24),
                                    icon: Icons.close);
                              } else if (controller.lastName.text.isEmpty) {
                                showToastMessage(
                                    message: 'Enter Last Name',
                                    context: context,
                                    color: const Color(0xffEC1C24),
                                    icon: Icons.close);
                              } else {
                                FocusManager.instance.primaryFocus?.unfocus();
                                controller.updateDoctorEmail(context: context);
                              }
                            },
                            name: "Save"),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier)
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
