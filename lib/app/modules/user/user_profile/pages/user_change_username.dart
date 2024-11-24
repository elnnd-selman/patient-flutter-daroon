import 'package:daroon_user/app/modules/user/user_profile/controller/user_change_username_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_edit_profile_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserChangeUsername extends GetView<UserChangeUserNameController> {
  const UserChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserChangeUserNameController>(initState: (_) {
      controller.setUserName(Get.find<UserEditProfileController>()
          .userProfileModel
          .value!
          .username);
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
              "Edit Username",
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
                        "Please prove a unique username for better reach and security.",
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff707281),
                          fontSize: 1.6 * SizeConfig.heightMultiplier,
                        ),
                      ),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier),
                      GetBuilder<UserChangeUserNameController>(
                          init: UserChangeUserNameController(),
                          builder: (ctrl) {
                            return TextFormField(
                              // autovalidateMode:,
                              controller: ctrl.userName.value,
                              maxLines: 1,
                              style: AppTextStyles.medium.copyWith(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: AppColors.primaryColor,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black12,
                              onChanged: (val) {
                                ctrl.updateUi(val);
                              },
                              cursorWidth: 1,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 14),
                                fillColor: const Color(0xffF7F7F8),
                                filled: true,
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ctrl.userName.value.text.isEmpty
                                          ? AppColors.borderColor
                                          : ctrl.isError.value
                                              ? const Color(0xffFF0000)
                                              : AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ctrl.userName.value.text.isEmpty
                                          ? AppColors.borderColor
                                          : ctrl.isError.value
                                              ? const Color(0xffFF0000)
                                              : AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ctrl.userName.value.text.isEmpty
                                          ? AppColors.borderColor
                                          : ctrl.isError.value
                                              ? const Color(0xffFF0000)
                                              : AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ctrl.userName.value.text.isEmpty
                                          ? AppColors.borderColor
                                          : ctrl.isError.value
                                              ? const Color(0xffFF0000)
                                              : AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ctrl.userName.value.text.isEmpty
                                          ? AppColors.borderColor
                                          : ctrl.isError.value
                                              ? const Color(0xffFF0000)
                                              : AppColors.primaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                isDense: true,
                                hintText: "Enter User Name",
                                hintStyle: AppTextStyles.medium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: const Color(0xff535353),
                                ),
                                suffixIcon: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(
                                      () => ctrl.userName.value.text.isEmpty
                                          ? const SizedBox()
                                          : Container(
                                              margin: const EdgeInsets.only(
                                                  top: 12, right: 10),
                                              height: 27,
                                              width: 27,
                                              decoration: BoxDecoration(
                                                color: ctrl.isError.value
                                                    ? const Color(0xffFF0000)
                                                        .withOpacity(.25)
                                                    : const Color(0xff427347)
                                                        .withOpacity(.25),
                                                border: Border.all(
                                                    color: ctrl.isError.value
                                                        ? const Color(
                                                            0xffFF0000)
                                                        : const Color(
                                                            0xff427347)),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Icon(
                                                ctrl.isError.value
                                                    ? Icons.close
                                                    : Icons.check,
                                                color: ctrl.isError.value
                                                    ? const Color(0xffFF0000)
                                                    : const Color(0xff427347),
                                              ),
                                            ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      SizedBox(height: 1 * SizeConfig.heightMultiplier),
                      Obx(
                        () => controller.isError.value
                            ? Text(
                                "  Username already taken.",
                                style: AppTextStyles.medium.copyWith(
                                    color: const Color(0xffFF0000),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            : const SizedBox(),
                      ),
                      const Spacer(),
                      CommonButton(
                          ontap: () {
                            if (controller.userName.value.text.isEmpty) {
                              showToastMessage(
                                  message: 'Enter User Name',
                                  context: context,
                                  color: const Color(0xffEC1C24),
                                  icon: Icons.close);
                            } else {
                              controller.isError.value = false;
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.updateDoctorUserName(context: context);
                            }
                          },
                          name: "Save"),
                      SizedBox(height: 2 * SizeConfig.heightMultiplier)
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
