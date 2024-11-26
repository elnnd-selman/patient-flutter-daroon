import 'package:daroon_user/app/modules/user/user_podcast/controller/user_presenter_profile_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/photo_tab.dart';
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

class TextTab extends GetView<UserPresenterProfileController> {
  const TextTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        7.verticalSpace,
        Obx(
          () => Text(
            "${controller.textList.length} Text",
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
              : controller.textList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15 * SizeConfig.heightMultiplier),
                      child: const Center(
                          child: NoDataWidget(text: "No Text Found")),
                    )
                  : ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.textList.length,
                      itemBuilder: (context, index) {
                        return CustomCupertinoButton(
                          onTap: () {
                            Get.toNamed(Routes.presenterPodCastDetail,
                                arguments: [controller.textList[index]]);
                          },
                          child: UserPhotoContainer(
                            podCastModel: controller.textList[index],
                          ),
                        );
                      },
                    ),
        ),
      ],
    );
  }
}
