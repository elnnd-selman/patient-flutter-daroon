import 'package:daroon_user/app/modules/user/user_profile/controller/user_edit_profile_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenderDialogBox extends GetView<UserEditProfileController> {
  const GenderDialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(Get.context!).size.width;
    final scaleTween = Tween<double>(begin: 0, end: 1);
    return TweenAnimationBuilder(
      tween: scaleTween,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 250),
      builder: (context, scale, child) {
        return Transform.scale(scale: scale, child: child);
      },
      child: MediaQuery(
        data: MediaQuery.of(Get.context!)
            .copyWith(textScaler: const TextScaler.linear(1)),
        child: AlertDialog(
          backgroundColor: AppColors.whiteBGColor,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          content: Builder(
            builder: (context) {
              return Container(
                width: width * 0.7,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.whiteBGColor,
                ),
                child: Obx(
                  () => controller.processing.value
                      ? const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 45),
                              child: LoadingWidget(),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: CupertinoButton(
                                  pressedOpacity: 0,
                                  padding: EdgeInsets.zero,
                                  minSize: 0,
                                  onPressed: () => Get.back(),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              // const SizedBox(height: 20),
                              Text(
                                "Select Gender",
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bold.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.blackBGColor,
                                    fontSize: 18),
                              ),
                              const SizedBox(height: 20),
                              ...List.generate(controller.genderList.length,
                                  (index) {
                                return CupertinoButton(
                                  pressedOpacity: 0,
                                  padding: EdgeInsets.zero,
                                  minSize: 0,
                                  onPressed: () {
                                    controller.selectedGender.value = index;
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Row(
                                      children: [
                                        Obx(
                                          () => Container(
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: AppColors
                                                        .primaryColor)),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                    decoration: BoxDecoration(
                                                      color: controller
                                                                  .selectedGender
                                                                  .value ==
                                                              index
                                                          ? AppColors
                                                              .primaryColor
                                                          : Colors.transparent,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    height: 17,
                                                    width: 17),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Text(
                                          controller.genderList[index],
                                          textAlign: TextAlign.center,
                                          style: AppTextStyles.bold.copyWith(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.blackBGColor,
                                              fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }),

                              CommonButton(
                                ontap: () {
                                  controller.updateDoctorGender(
                                      context: context);
                                },
                                name: "Save",
                              ),
                            ],
                          ),
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
