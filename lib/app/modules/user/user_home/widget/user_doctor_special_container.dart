import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_home/pages/user_home_screen.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/network_image_loader.dart';
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
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 6 * SizeConfig.heightMultiplier),
                  child: const Center(child: LoadingWidget()),
                )
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 3,
                    crossAxisCount: 4,
                  ),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: controller.specialityList.length,
                  itemBuilder: (context, index) {
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
                              padding: const EdgeInsets.all(18),
                              child: NetWorkImageLoader(
                                shape: BoxShape.circle,
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
