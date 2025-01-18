import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/spaces.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:daroon_user/global/widgets/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewAppointmentBottomSheet extends GetView<UserAppointmentController> {
  final AppointmentModel appointmentModel;
  const ReviewAppointmentBottomSheet({
    super.key,
    required this.appointmentModel,
  });

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Obx(
          () => controller.processing.value
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20 * SizeConfig.heightMultiplier),
                      child: const Center(child: LoadingWidget()),
                    ),
                  ],
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            controller.rating.value = -1;
                            controller.review.clear();
                            Get.back();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                      const SizedBox(height: 20),
                      appointmentModel.bookedBy!.profilePicture == null
                          ? Container(
                              height: 7 * SizeConfig.heightMultiplier,
                              width: 15 * SizeConfig.widthMultiplier,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: AppColors.blackBGColor,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: FittedBox(
                                  child: Text(
                                    '${appointmentModel.bookedBy!.firstName![0].toUpperCase()}${appointmentModel.bookedBy!.firstNameEn![1].toUpperCase()}',
                                    style: AppTextStyles.bold.copyWith(
                                      color: Colors.white,
                                      fontSize: Spaces.fontSize(fontSize: 18),
                                    ),
                                  ),
                                ),
                              ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: NetWorkImageLoader(
                                containerColor: Colors.black54,
                                imageURL: appointmentModel
                                    .bookedBy!.profilePicture!.bg!,
                                height: 7 * SizeConfig.heightMultiplier,
                                width: 15 * SizeConfig.widthMultiplier,
                              ),
                            ),
                      const SizedBox(height: 10),
                      Text(
                        appointmentModel.fullName!,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                          fontSize: SizeConfig.heightMultiplier * 2.2,
                        ),
                      ),
                      Text(
                        appointmentModel.doctor!.speciality == null
                            ? "--"
                            : appointmentModel
                                .doctor!.speciality!.specialityEn!,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff737373),
                          fontSize: SizeConfig.heightMultiplier * 1.8,
                        ),
                      ),
                      24.verticalSpace,
                      Text(
                        'Rate (out of 5)',
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff898A8D),
                          fontSize: SizeConfig.heightMultiplier * 1.6,
                        ),
                      ),
                      8.verticalSpace,
                      RatingBar(
                        halfFilledColor: AppColors.primaryColor,
                        filledColor: AppColors.primaryColor,
                        emptyColor: AppColors.borderColor,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star_border,
                        alignment: Alignment.center,
                        onRatingChanged: (value) {
                          final temVal = value.toInt();
                          controller.rating.value =
                              int.parse(temVal.toString());
                        },
                        initialRating: 0,
                        maxRating: 5,
                      ),
                      15.verticalSpace,
                      TextFormField(
                        controller: controller.review,
                        style: AppTextStyles.medium.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: AppColors.blackBGColor,
                        ),
                        maxLines: 6,
                        cursorColor: Colors.black12,
                        cursorWidth: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 20),
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
                          hintText: "Write your review here..",
                          hintStyle: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: const Color(0xffA0A1AB),
                          ),
                        ),
                      ),
                      30.verticalSpace,
                      CommonButton(
                          ontap: () {
                            if (controller.review.text.isEmpty ||
                                controller.rating.value == -1) {
                              if (controller.review.text.isEmpty) {
                                showToastMessage(
                                    message: "Please enter review",
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    color: const Color(0xffEC1C24),
                                    icon: Icons.close);
                                return;
                              } else {
                                showToastMessage(
                                    message: "Please select rating",
                                    // ignore: use_build_context_synchronously
                                    context: context,
                                    color: const Color(0xffEC1C24),
                                    icon: Icons.close);
                                return;
                              }
                            } else {
                              controller.reviewAppointment(
                                  appointmentModel, context);
                            }
                          },
                          name: "Submit"),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
