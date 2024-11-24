import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:daroon_user/app/modules/user/user_bottom_navi_bar/widget/user_drawer_widget.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:get/get.dart';

class UserHomeAppBar extends StatelessWidget {
  const UserHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      surfaceTintColor: Colors.white,
      actions: [
        CustomCupertinoButton(
          onTap: () {
            // Get.toNamed(Routes.doctorNotification),
          },
          child:
              SvgPicture.asset(Assets.notificationIcon, height: 23, width: 23),
        ),
        14.horizontalSpace,
        CustomCupertinoButton(
            onTap: () {
              Get.toNamed(Routes.userMessage);
            },
            child: SvgPicture.asset(Assets.messageIcon, height: 23, width: 23)),
        SizedBox(width: 2.5 * SizeConfig.widthMultiplier)
      ],
      elevation: 0,
      leading: const UserDrawerWidget(),
    );
  }
}
