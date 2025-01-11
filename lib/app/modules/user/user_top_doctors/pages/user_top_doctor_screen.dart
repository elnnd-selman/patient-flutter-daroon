import 'package:daroon_user/app/modules/user/user_home/pages/user_home_screen.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/user_top_doctor_controller.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/widget/top_doctor_conatiner.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';

class UserTopDoctorScreen extends GetView<UserTopDoctorController> {
  const UserTopDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
          vertical: 3 * SizeConfig.heightMultiplier),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPatientTextField(),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
          // const TopDoctorContainer(),;
          Obx(
            () => controller.isLoading.value
                ? Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 5,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ShimmerLoader(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 1 * SizeConfig.widthMultiplier,
                                vertical: 1 * SizeConfig.heightMultiplier),
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width * 1,
                            height: (MediaQuery.of(context).size.height * 0.15)
                                .toDouble(),
                          ),
                        );
                      },
                    ),
                  )
                : controller.topDoctorModelList.isEmpty
                    ? Expanded(
                        child: RefreshIndicator(
                            backgroundColor: AppColors.primaryColor,
                            edgeOffset: 0,
                            displacement: 0,
                            strokeWidth: 0,
                            onRefresh: controller.refreshTopDoctor,
                            child: const NoDataWidget(text: "No Doctor Found")),
                      )
                    : Expanded(
                        child: RefreshIndicator(
                          backgroundColor: AppColors.primaryColor,
                          edgeOffset: 0,
                          displacement: 0,
                          strokeWidth: 0,
                          onRefresh: controller.refreshTopDoctor,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: controller.topDoctorModelList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return TopDoctorContainer(
                                topDoctorModel:
                                    controller.topDoctorModelList[index],
                              );
                            },
                          ),
                        ),
                      ),
          ),
          SizedBox(height: 2 * SizeConfig.heightMultiplier),
        ],
      ),
    );
  }

  TextFormField _buildPatientTextField() {
    return TextFormField(
      style: AppTextStyles.medium.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 15,
        color: AppColors.blackBGColor,
      ),
      cursorColor: Colors.black12,
      cursorWidth: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 0),
        fillColor: const Color(0xffF7F7F8),
        filled: true,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              color: AppColors.secondaryborderColor, width: 0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            Assets.serachIcon,
            colorFilter: const ColorFilter.mode(
                AppColors.lighttextColor, BlendMode.srcIn),
          ),
        ),
        suffixIcon: CustomCupertinoButton(
          onTap: () => Get.toNamed(Routes.filterScreen),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              Assets.filterIcon,
              colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor, BlendMode.srcIn),
            ),
          ),
        ),
        isDense: true,
        hintText: "Search Doctor",
        hintStyle: AppTextStyles.medium.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: const Color(0xff787B80),
        ),
      ),
      onSaved: (val) {
        if (val!.isNotEmpty) {
          controller.searchDoctor(val);
        } else {
          controller.getTopDoctorData();
        }
      },
      onFieldSubmitted: (val) {
        if (val.isNotEmpty) {
          controller.searchDoctor(val);
        } else {
          controller.getTopDoctorData();
        }
      },
      // onChanged: (val) {
      //   if (val.isEmpty) {
      //     controller.isSearch.value = false;
      //   } else {
      //     controller.isSearch.value = true;
      //     controller.searchDoctor(val);
      //   }
      // },
    );
  }
}
