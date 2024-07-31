import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/user/user_home/model/doctor_specialty_model.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/filter_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';

class FilterScreen extends GetView<FilterController> {
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
                  ...List.generate(doctorSpecialtyModel.length, (index) {
                    return _specialtyContainer(doctorSpecialtyModel[index]);
                  }),
                ],
              ),
            )
            // Expanded(
            //   child: ListView.builder(
            //       shrinkWrap: true,
            //       scrollDirection: Axis.horizontal,
            //       itemCount: doctorSpecialtyModel.length,
            //       itemBuilder: (context, index) {
            //         return
            //       }),
            // )
          ],
        ),
      ),
    );
  }

  Container _specialtyContainer(DoctorSpecialtyModel doctorModel) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      // width: MediaQuery.of(Get.context!).size.width * 0.4,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
          color: const Color(0xffE8E8E8).withOpacity(.5),
          border: Border.all(color: const Color(0xffE8E8E8).withOpacity(.5)),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(
            doctorModel.imageUrl,
            height: 20,
          ),
          10.horizontalSpace,
          Text(
            doctorModel.title,
            style: AppTextStyles.medium.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.blackBGColor,
              fontSize: 1.6 * SizeConfig.heightMultiplier,
            ),
          ),
        ],
      ),
    );
  }
}
