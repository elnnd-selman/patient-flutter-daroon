import 'package:daroon_user/app/modules/user/user_profile/controller/user_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/widget/user_detail_container.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends GetView<UserProfileController> {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 6 * SizeConfig.widthMultiplier,
          vertical: 3 * SizeConfig.heightMultiplier),
      child: Column(
        children: [
          Obx(
            () => controller.isLoading.value
                ? const Expanded(child: Center(child: LoadingWidget()))
                : UserDetailContainer(
                    userProfileModel: controller.userProfileModel.value!,
                  ),
          )
        ],
      ),
    );
  }
}
