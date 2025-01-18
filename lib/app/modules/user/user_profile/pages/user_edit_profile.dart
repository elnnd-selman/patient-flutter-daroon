import 'dart:io';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_edit_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/widget/gender_dialog_box.dart';
import 'package:daroon_user/app/modules/user/user_profile/widget/uplaod_profile_pic_dialog.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class UserEditProfile extends GetView<UserEditProfileController> {
  const UserEditProfile({super.key});

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
        leading: IconButton(
            onPressed: () {
              Get.find<UserProfileController>().getUserProfileData();
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_rounded,
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            "Edit Profile",
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.blackBGColor,
              fontSize: 2 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 24),
        //     child: Text(
        //       "Save",
        //       style: AppTextStyles.medium.copyWith(
        //         fontWeight: FontWeight.w600,
        //         color: AppColors.primaryColor,
        //         fontSize: 1.4 * SizeConfig.heightMultiplier,
        //       ),
        //     ),
        //   )
        // ],
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const LoadingWidget()
            : Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 6 * SizeConfig.widthMultiplier),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4 * SizeConfig.heightMultiplier),
                      Center(
                        child: Stack(
                          children: [
                            controller.imageUrl.value != ""
                                ? Container(
                                    alignment: Alignment.center,
                                    height: 10 * SizeConfig.heightMultiplier,
                                    width: 10 * SizeConfig.heightMultiplier,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black.withOpacity(0.7),
                                      image: controller.imageUrl.value == ''
                                          ? null
                                          : DecorationImage(
                                              fit: BoxFit.cover,
                                              image: FileImage(
                                                File(controller.imageUrl.value),
                                              )),
                                      border: Border.all(
                                        color: const Color(0xffE7E8EA),
                                      ),
                                    ),
                                  )
                                : controller.userProfileModel.value!
                                            .profilePicture ==
                                        null
                                    ? Container(
                                        alignment: Alignment.center,
                                        height:
                                            10 * SizeConfig.heightMultiplier,
                                        width: 10 * SizeConfig.heightMultiplier,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        child: Center(
                                          child: FittedBox(
                                            child: Text(
                                              '${controller.userProfileModel.value!.username![0].toUpperCase()}${controller.userProfileModel.value!.firstName![0].toUpperCase()}',
                                              style:
                                                  AppTextStyles.bold.copyWith(
                                                color: Colors.white,
                                                fontSize: Spaces.fontSize(
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ))
                                    : ClipOval(
                                        child: NetWorkImageLoader(
                                          imageURL: controller.userProfileModel
                                              .value!.profilePicture!.bg!,
                                          height:
                                              10 * SizeConfig.heightMultiplier,
                                          width:
                                              10 * SizeConfig.heightMultiplier,
                                          shape: BoxShape.circle,
                                          boxFit: BoxFit.cover,
                                          containerColor:
                                              Colors.black.withOpacity(0.7),
                                        ),
                                      ),
                            Positioned(
                              bottom: 3,
                              right: 8,
                              child: CupertinoButton(
                                pressedOpacity: 0,
                                padding: EdgeInsets.zero,
                                minSize: 0,
                                onPressed: () => updateProfilePhoto(context),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 3 * SizeConfig.heightMultiplier,
                                  width: 3 * SizeConfig.heightMultiplier,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.primaryColor,
                                      border: Border.all(
                                          color: AppColors.whiteBGColor,
                                          width: 2.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColors.whiteBGColor,
                                      size: 1.5 * SizeConfig.heightMultiplier,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4 * SizeConfig.heightMultiplier),
                      _profileTextField(
                        context: context,
                        title: "Name",
                        subtitle:
                            "${controller.userProfileModel.value!.firstNameEn} ${controller.userProfileModel.value!.lastNameEn}",
                        showIcon: true,
                        hintText: "UserName",
                        onTap: () => Get.toNamed(Routes.userChangeName),
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      // _profileTextField(
                      //   context: context,
                      //   title: "Specialist",
                      //   subtitle: controller.userProfileModel.value!
                      //               !.speciality ==
                      //           null
                      //       ? '--'
                      //       : controller.userProfileModel.value!.userProfile!
                      //           .speciality!.specialityEn!,
                      //   showIcon: true,
                      //   hintText: "Specialist Name",
                      //   onTap: () => Get.toNamed(Routes.doctorEditSpeciality),
                      // ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),

                      // SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      // _profileTextField(
                      //   context: context,
                      //   title: "Language",
                      //   subtitle: controller.userProfileModel.value!
                      //           .userProfile!.languages.isEmpty
                      //       ? '--'
                      //       : controller.splitAppLanguage(controller
                      //           .userProfileModel
                      //           .value!
                      //           .userProfile!
                      //           .languages),
                      //   showIcon: true,
                      //   hintText: "Language",
                      //   onTap: () => Get.toNamed(Routes.doctorchangeLanguage),
                      // ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),

                      SizedBox(height: 6 * SizeConfig.heightMultiplier),
                      Text(
                        "Private Information",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff11142D),
                          fontSize: 2 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      _profileTextField(
                        context: context,
                        title: "Email",
                        subtitle: controller.userProfileModel.value!.email!,
                        showIcon: true,
                        hintText: "Email",
                        onTap: () => Get.toNamed(Routes.userChangeEmail),
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      _profileTextField(
                        context: context,
                        title: "Phone",
                        subtitle:
                            controller.userProfileModel.value!.phone!.number!,
                        showIcon: false,
                        hintText: "Phone",
                        onTap: () {},
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      _profileTextField(
                        context: context,
                        title: "Username",
                        subtitle: controller.userProfileModel.value!.username!,
                        showIcon: true,
                        hintText: "Username",
                        onTap: () => Get.toNamed(Routes.userChangeUserName),
                      ),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),

                      GetBuilder<UserEditProfileController>(
                          initState: (ctrl) {},
                          builder: (ctrl) {
                            return _profileTextField(
                              context: context,
                              title: "Gender",
                              subtitle: ctrl.userProfileModel.value!.gender!
                                  .toUpperCase(),
                              showIcon: true,
                              hintText: "Gender",
                              onTap: () {
                                if (ctrl.userProfileModel.value!.gender ==
                                    "male") {
                                  ctrl.selectedGender.value = 0;
                                } else {
                                  ctrl.selectedGender.value = 1;
                                }

                                Get.dialog(
                                  barrierDismissible: false,
                                  const GenderDialogBox(),
                                  barrierColor:
                                      AppColors.blackBGColor.withOpacity(0.5),
                                );
                              },
                            );
                          }),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      _profileTextField(
                          context: context,
                          title: "Birth-Day",
                          subtitle: formatDate(
                              controller.userProfileModel.value!.dateOfBirth!),
                          showIcon: true,
                          hintText: "Birth-Day",
                          onTap: () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Get.bottomSheet(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                decoration: const BoxDecoration(
                                    color: AppColors.whiteBGColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(24),
                                        topRight: Radius.circular(24))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                        controller.updateDoctorBirthDay(
                                            context: context);
                                      },
                                      child: Text(
                                        "Done",
                                        style: AppTextStyles.bold.copyWith(
                                            color: AppColors.primaryColor,
                                            fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Expanded(
                                      child: CupertinoDatePicker(
                                        itemExtent: 100,
                                        initialDateTime:
                                            controller.birthDate.value ??
                                                DateTime.now(),
                                        backgroundColor: AppColors.whiteBGColor,
                                        mode: CupertinoDatePickerMode.date,
                                        onDateTimeChanged: (date) {
                                          controller.birthDate.value = date;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  String formatDate(DateTime inputDate) {
    String formattedDate = DateFormat("MMM d, yyyy").format(inputDate);
    return formattedDate;
  }

  Row _profileTextField({
    required BuildContext context,
    required String title,
    required String subtitle,
    required String hintText,
    required Function()? onTap,
    required bool showIcon,
  }) {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            title,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              color: const Color(0xff707281),
              fontSize: 1.8 * SizeConfig.heightMultiplier,
            ),
          ),
        ),
        Expanded(
          child: CustomCupertinoButton(
            onTap: onTap,
            child: TextFormField(
              style: AppTextStyles.medium.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: const Color(0xff11142D),
              ),
              initialValue: subtitle,
              cursorColor: AppColors.blackBGColor,
              // cursorHeight: 10,
              decoration: InputDecoration(
                enabled: false,
                contentPadding: const EdgeInsets.only(top: 10, bottom: 20),
                fillColor: Colors.white,
                filled: true,
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedErrorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                suffixIcon: showIcon
                    ? CustomCupertinoButton(
                        onTap: onTap,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 6),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: AppColors.primaryColor,
                            size: 18,
                          ),
                        ),
                      )
                    : const SizedBox(),
                isDense: true,
                hintText: hintText,
                hintStyle: AppTextStyles.medium.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  color: const Color(0xffA0A1AB),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
