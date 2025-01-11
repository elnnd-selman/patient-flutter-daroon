import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_home/pages/user_home_screen.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:daroon_user/global/constants/size_config.dart';

class UserDoctorSpecialtyContainer extends GetView<UserHomeController> {
  const UserDoctorSpecialtyContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isSpecialityLoading.value
          ? ShimmerLoader(
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.of(context).size.width * 1,
                height: (MediaQuery.of(context).size.height * 0.15).toDouble(),
              ),
            )
          : controller.specialityList.isEmpty
              ? SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height:
                      (MediaQuery.of(context).size.height * 0.15).toDouble(),
                  child: const Center(
                      child: NoDataWidget(text: "No Specialty available")),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 3,
                    crossAxisCount: 4,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.specialityList.length >= 8
                      ? 8
                      : controller.specialityList.length,
                  itemBuilder: (context, index) {
                    if (index == 7) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * .07,
                            width: MediaQuery.of(context).size.height * 0.07,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffebf4ff),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child:
                                  Image.asset("assets/icons_png/moreIcon.png"),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.004,
                          ),
                          Flexible(
                            child: Text(
                              "More",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff1C1B1F),
                                fontSize: SizeConfig.heightMultiplier * 1.6,
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                    return Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .07,
                          width: MediaQuery.of(context).size.height * 0.07,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffebf4ff),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(17),
                              child: NetWorkImageLoader(
                                shape: BoxShape.circle,
                                boxFit: BoxFit.contain,
                                imageURL:
                                    controller.specialityList[index].image!.md!,
                                height:
                                    MediaQuery.of(context).size.height * .07,
                                width:
                                    MediaQuery.of(context).size.height * 0.07,
                              )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.004,
                        ),
                        Flexible(
                          child: Text(
                            controller.specialityList[index].specialityEn!
                                .capitalizeFirst!,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              color: const Color(0xff1C1B1F),
                              fontSize: SizeConfig.heightMultiplier * 1.6,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
