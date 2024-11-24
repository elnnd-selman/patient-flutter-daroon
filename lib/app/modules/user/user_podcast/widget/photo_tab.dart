import 'package:daroon_user/app/modules/user/user_podcast/controller/user_presenter_profile_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PhotoTab extends GetView<UserPresenterProfileController> {
  const PhotoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        7.verticalSpace,
        Obx(
          () => Text(
            "${controller.popularPodcastList.length} Podcasts",
            style: AppTextStyles.medium
                .copyWith(color: AppColors.lightgreyColor, fontSize: 16),
          ),
        ),
        10.verticalSpace,
      ],
    );
  }
}
