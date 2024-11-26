import 'package:daroon_user/app/modules/user/user_podcast/controller/user_presenter_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/user_podcast_container.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/loading_overlay.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PodcastTab extends GetView<UserPresenterProfileController> {
  const PodcastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        7.verticalSpace,
        Obx(
          () => Text(
            "${controller.podcastList.length} Podcasts",
            style: AppTextStyles.medium
                .copyWith(color: AppColors.lightgreyColor, fontSize: 16),
          ),
        ),
        10.verticalSpace,
        Obx(
          () => controller.processing.value
              ? Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 15 * SizeConfig.heightMultiplier),
                  child: const Center(child: LoadingWidget()),
                )
              : controller.podcastList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15 * SizeConfig.heightMultiplier),
                      child: const Center(
                          child: NoDataWidget(text: "No Podcast Found")),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.podcastList.length,
                      itemBuilder: (context, index) {
                        return CustomCupertinoButton(
                          onTap: () {
                            Get.toNamed(Routes.presenterPodCastDetail,
                                arguments: [controller.podcastList[index]]);
                          },
                          child: UserPodCastContainer(
                            podCastModel: controller.podcastList[index],
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
