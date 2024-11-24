import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:daroon_user/app/modules/user/user_appointment/model/doctor_appointmet_model.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/change_appointment_time.dart';
import 'package:daroon_user/app/modules/user/user_appointment/widgets/review_appointment_bottom_sheet.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/border_common_button.dart';
import 'package:daroon_user/global/widgets/common_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class AppointmentDetailScreen extends StatelessWidget {
  AppointmentDetailScreen({super.key});

  final appointmentModel = Get.arguments[7] as AppointmentModel;
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
        title: Text(
          "Details",
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackBGColor,
            fontSize: 2 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 6 * SizeConfig.widthMultiplier),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  Text(
                    Get.arguments[4],
                    style: AppTextStyles.medium.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.lighttextColor,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   height: 9 * SizeConfig.heightMultiplier,
                      //   width: 18 * SizeConfig.widthMultiplier,
                      //   decoration: BoxDecoration(
                      //     image: const DecorationImage(
                      //         image: AssetImage("assets/images/Rectangle 25.png")),
                      //     borderRadius: BorderRadius.circular(10),
                      //   ),
                      // ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: NetWorkImageLoader(
                          containerColor: Colors.black54,
                          imageURL:
                              appointmentModel.bookedBy!.profilePicture!.bg!,
                          height: 9 * SizeConfig.heightMultiplier,
                          width: 18 * SizeConfig.widthMultiplier,
                        ),
                      ),
                      16.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            appointmentModel.fullName!.capitalizeFirst!,
                            style: AppTextStyles.medium.copyWith(
                              fontWeight: FontWeight.w600,
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),
                          ),
                          // SizedBox(height: . * SizeConfig.heightMultiplier),
                          Text(
                            appointmentModel.bookedFor!,
                            style: AppTextStyles.medium.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff737373),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 4),
                            height: 7 * SizeConfig.heightMultiplier,
                            width: 7 * SizeConfig.widthMultiplier,
                            decoration: const BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Get.arguments[1] == "confirmed" ||
                                      Get.arguments[1] == "completed"
                                  ? Image.asset(
                                      Assets.phone,
                                      color: AppColors.whiteBGColor,
                                    )
                                  : SvgPicture.asset(
                                      Get.arguments[1] == "requesting" ||
                                              Get.arguments[1] == "upcoming"
                                          ? "assets/icons/messageIcons.svg"
                                          : Assets.locationIcon,
                                      colorFilter: const ColorFilter.mode(
                                          AppColors.whiteBGColor,
                                          BlendMode.srcIn),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  Get.arguments[1] == "cancelled"
                      ? Padding(
                          padding: EdgeInsets.only(
                              bottom: 3 * SizeConfig.heightMultiplier),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            padding: EdgeInsets.zero,
                            color: Get.arguments[2],
                            radius: const Radius.circular(20),
                            dashPattern: const [7, 4],
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  6.verticalSpace,
                                  Text(
                                    "Schedule Information",
                                    style: AppTextStyles.medium.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.lighttextColor,
                                      fontSize: 15,
                                    ),
                                  ),
                                  20.verticalSpace,
                                  Container(
                                    height: 0.4,
                                    color: const Color(0xffC4C4C4),
                                  ),
                                  20.verticalSpace,
                                  ReadMoreText(
                                    appointmentModel.cancelledReason == null
                                        ? "----"
                                        : appointmentModel.cancelledReason!,
                                    trimMode: TrimMode.Line,
                                    trimLines: 2,
                                    colorClickableText: Colors.pink,
                                    trimCollapsedText: '...More',
                                    trimExpandedText: '...Less',
                                    style: AppTextStyles.normal.copyWith(
                                      fontSize: 16,
                                      color: const Color(0xff404D61),
                                    ),
                                    moreStyle: AppTextStyles.normal.copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  8.verticalSpace,
                                ],
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffC4C4C4).withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.verticalSpace,
                        Text(
                          "Schedule Information",
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lighttextColor,
                            fontSize: 15,
                          ),
                        ),
                        20.verticalSpace,
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 0.4,
                          color: const Color(0xffC4C4C4),
                        ),
                        20.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            SvgPicture.asset(
                              "assets/icons/clock.svg",
                              height: 20,
                            ),
                            14.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date & Time",
                                  style: AppTextStyles.medium.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lighttextColor,
                                    fontSize: 14,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  formatDate(appointmentModel.appointmentDate
                                      .toString()),
                                  style: AppTextStyles.medium.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Get.arguments[2],
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            20.horizontalSpace,
                          ],
                        ),
                        20.verticalSpace,
                        Row(
                          children: [
                            20.horizontalSpace,
                            SvgPicture.asset(
                              Assets.locationIcon,
                              colorFilter: const ColorFilter.mode(
                                  Color(0xff979797), BlendMode.srcIn),
                              height: 20,
                            ),
                            14.horizontalSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: AppTextStyles.medium.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.lighttextColor,
                                    fontSize: 14,
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  appointmentModel.office!.description!,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.medium.copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            20.horizontalSpace,
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 3 * SizeConfig.heightMultiplier),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xffC4C4C4).withOpacity(0.5),
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        6.verticalSpace,
                        Text(
                          "Patient Information",
                          style: AppTextStyles.medium.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppColors.lighttextColor,
                            fontSize: 15,
                          ),
                        ),
                        20.verticalSpace,
                        Container(
                          // margin: EdgeInsets.symmetric(horizontal: 4),
                          height: 0.4,
                          color: const Color(0xffC4C4C4),
                        ),
                        20.verticalSpace,
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Patient name",
                                style: AppTextStyles.medium.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.blackBGColor,
                                  fontSize: 16,
                                ),
                              ),
                              Wrap(
                                children: [
                                  _patientDetailContainer(
                                    "assets/icons/offerBookIcon.svg",
                                    fatherName(appointmentModel
                                        .fullName!.capitalizeFirst!),
                                  ),
                                  _patientDetailContainer(
                                    "assets/icons/genderIcon.svg",
                                    appointmentModel.gender!.capitalizeFirst!,
                                  ),
                                  _patientDetailContainer(
                                    Assets.calendarIcon,
                                    foramtBirthDate(appointmentModel.dateOfBirth
                                        .toString()),
                                  ),
                                ],
                              ),
                              10.verticalSpace,
                              Text(
                                "Extra Information",
                                style: AppTextStyles.medium.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff898A8D),
                                  fontSize: 15,
                                ),
                              ),
                              10.verticalSpace,
                              Text(
                                appointmentModel.extraInformation!,
                                style: AppTextStyles.medium.copyWith(
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.lighttextColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  20.verticalSpace,
                  Get.arguments[5]
                      ? CommonButton(
                          ontap: () {
                            // if (Get.arguments[0] == "Completed") {
                            //   Get.find<UserAppointmentController>()
                            //       .confirmAppointment(
                            //           appointmentModel, context, "completed");
                            // } else
                            if (Get.arguments[0] == "cancelled") {
                              Get.bottomSheet(
                                ChangeAppointmentTimeBottomSheet(
                                  appointmentModel: appointmentModel,
                                ),
                                barrierColor: Colors.black45,
                                isScrollControlled: true,
                                isDismissible: true,
                              );
                            }
                            if (Get.arguments[1] == "completed") {
                              Get.bottomSheet(
                                ReviewAppointmentBottomSheet(
                                  appointmentModel: appointmentModel,
                                ),
                                barrierColor: Colors.black45,
                                isScrollControlled: true,
                                isDismissible: false,
                              );
                            } else {
                              Get.find<UserAppointmentController>()
                                  .confirmAppointment(
                                      appointmentModel, context, "confirmed");
                            }
                          },
                          name: Get.arguments[0] == "cancelled"
                              ? "Reschedule"
                              : Get.arguments[1] == "completed"
                                  ? "Leave Review"
                                  : Get.arguments[0],
                        )
                      : const SizedBox(),
                  0.verticalSpace,
                  Get.arguments[6]
                      ? BorderCommonButton(
                          ontap: () {
                            if (Get.arguments[0] == "cancelled") {
                            } else {
                              Get.toNamed(
                                Routes.cancelAppointment,
                                arguments: [
                                  appointmentModel,
                                  Get.arguments[1],
                                  false
                                ],
                              );
                            }
                          },
                          name: Get.arguments[0] == "cancelled"
                              ? "Remove"
                              : "Cancel",
                        )
                      : const SizedBox(),
                  24.verticalSpace,
                  Get.arguments[3]
                      ? CupertinoButton(
                          padding: EdgeInsets.zero,
                          borderRadius: BorderRadius.circular(0),
                          minSize: 0,
                          onPressed: () {
                            Get.bottomSheet(
                              ChangeAppointmentTimeBottomSheet(
                                  appointmentModel: appointmentModel),
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              isDismissible: false,
                              enableDrag: false,
                            );
                          },
                          child: Center(
                            child: Text(
                              "Change Schedule?",
                              style: AppTextStyles.medium.copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                  26.verticalSpace,
                ],
              ),
            ),
          ),
          Obx(() {
            if (Get.find<UserAppointmentController>().confirmProcessing) {
              return const LoadingOverlay();
            }
            return const SizedBox();
          }),
        ],
      ),
    );
  }

  String foramtBirthDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);

    String formattedDate = DateFormat("d MMM, yyyy").format(dateTime);
    return formattedDate;
  }

  String fatherName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    if (nameParts.length >= 2) {
      String lastName = nameParts[1];
      return lastName;
    } else {
      return fullName;
    }
  }

  String formatDate(String inputDate) {
    DateTime dateTime = DateTime.parse(inputDate);
    String formattedDate = DateFormat("EEE, MMM d, h:mma").format(dateTime);

    return formattedDate;
  }

  Container _patientDetailContainer(String icon, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      // width: width,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xffC4C4C4).withOpacity(0.15),
          border: Border.all(
              color: const Color(0xffC4C4C4).withOpacity(0.5), width: 0.5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            height: 18,
            colorFilter:
                const ColorFilter.mode(Color(0xff979797), BlendMode.srcIn),
          ),
          6.horizontalSpace,
          Text(
            text,
            maxLines: 1,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColors.primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
