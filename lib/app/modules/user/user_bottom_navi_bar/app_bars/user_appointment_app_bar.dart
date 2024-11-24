import 'package:daroon_user/app/modules/user/user_appointment/controller/user_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:searchbar_animation/searchbar_animation.dart';

class UserAppointmentAppBar extends GetView<UserAppointmentController> {
  const UserAppointmentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 0,
      // leading: const SizedBox(),
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(
          "Appointments",
          style: AppTextStyles.medium.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.blackBGColor,
            fontSize: 2 * SizeConfig.heightMultiplier,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () => SearchBarAnimation(
              isOriginalAnimation: false,
              buttonColour: controller.isAppBarOpen.value
                  ? const Color(0xffF7F7F8)
                  : AppColors.whiteBGColor,
              searchBoxColour: const Color(0xffF7F7F8).withOpacity(1),
              isSearchBoxOnRightSide: true,
              enableBoxShadow: false,
              enableButtonShadow: false,
              hintText: "Search Patient",
              buttonBorderColour: Colors.black45,
              searchBoxWidth: MediaQuery.of(context).size.width * 0.94,
              onFieldSubmitted: (String value) {
                debugPrint('onFieldSubmitted value $value');
              },
              onPressButton: (open) {
                controller.isAppBarOpen.value = open;
              },
              textEditingController: TextEditingController(),
              trailingWidget: SvgPicture.asset(
                Assets.serachIcon,
                colorFilter:
                    const ColorFilter.mode(Color(0xff979797), BlendMode.srcIn),
              ),
              secondaryButtonWidget: const Icon(Icons.close),
              buttonWidget: SvgPicture.asset(Assets.serachIcon),
            ),
          ),
        ),
      ],
    );
  }
}
