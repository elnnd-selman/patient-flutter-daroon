import 'package:carousel_slider/carousel_slider.dart';
import 'package:daroon_user/app/modules/user/user_podcast/controller/user_podcast_controller.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/user_most_active_container.dart';
import 'package:daroon_user/app/modules/user/user_podcast/widget/user_podcast_container.dart';
import 'package:daroon_user/app/routes/app_routes.dart';
import 'package:daroon_user/generated/assets.dart';
import 'package:daroon_user/global/constants/app_colors.dart';
import 'package:daroon_user/global/constants/size_config.dart';
import 'package:daroon_user/global/utils/app_text_style.dart';
import 'package:daroon_user/global/utils/widget_spacing.dart';
import 'package:daroon_user/global/widgets/custom_cupertino_button.dart';
import 'package:daroon_user/global/widgets/no_data_widget.dart';
import 'package:daroon_user/global/widgets/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPodcastScreen extends GetView<UserPodcastController> {
  const UserPodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 4 * SizeConfig.widthMultiplier,
          vertical: 3 * SizeConfig.heightMultiplier),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 2 * SizeConfig.heightMultiplier),
            SearchTextField(
              hintText: "Search...",
              textEditingController: controller.searchPodTextField,
              showSuffix: false,
              showPrefix: true,
              prefixIcon: Assets.serachIcon,
              suffixIcon: "",
              onChange: (val) {
                if (val.isEmpty) {
                  controller.isSearch.value = false;
                } else {
                  controller.isSearch.value = true;
                  controller.searchPodCast(val);
                }
              },
            ),
            30.verticalSpace,
            Text(
              "Popular Podcasts",
              style: AppTextStyles.semiBold
                  .copyWith(color: AppColors.lighttextColor, fontSize: 20),
            ),
            10.verticalSpace,

            Obx(
              () => controller.processing.value
                  ? CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 31 * SizeConfig.heightMultiplier,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        // aspectRatio: 2.0,
                        // initialPage: 2,
                      ),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return const UserPodCastContainer(
                          isLoading: true,
                        );
                      })
                  : controller.popularVideoPodcastList.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15 * SizeConfig.heightMultiplier),
                          child: const Center(
                              child: NoDataWidget(text: "No Podcast Found")),
                        )
                      : controller.isSearch.value
                          ? controller.searchPodCastModelList.isEmpty
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          15 * SizeConfig.heightMultiplier),
                                  child: const Center(
                                      child: NoDataWidget(
                                          text: "No Podcast Found")),
                                )
                              : CarouselSlider.builder(
                                  options: CarouselOptions(
                                    height: 31 * SizeConfig.heightMultiplier,
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 1,
                                    // aspectRatio: 2.0,
                                    // initialPage: 2,
                                  ),
                                  itemCount:
                                      controller.searchPodCastModelList.length,
                                  itemBuilder: (BuildContext context,
                                      int itemIndex, int pageViewIndex) {
                                    return CustomCupertinoButton(
                                      onTap: () {
                                        Get.toNamed(Routes.userPodCastDetail,
                                            arguments: [
                                              controller.searchPodCastModelList[
                                                  itemIndex]
                                            ]);
                                      },
                                      child: UserPodCastContainer(
                                        isLoading: false,
                                        podCastModel: controller
                                            .searchPodCastModelList[itemIndex],
                                      ),
                                    );
                                  })
                          : CarouselSlider.builder(
                              options: CarouselOptions(
                                height: 31 * SizeConfig.heightMultiplier,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enableInfiniteScroll: false,
                                viewportFraction: 1,
                                // aspectRatio: 2.0,
                                // initialPage: 2,
                              ),
                              itemCount:
                                  controller.popularVideoPodcastList.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) {
                                return CustomCupertinoButton(
                                  onTap: () {
                                    Get.toNamed(Routes.userPodCastDetail,
                                        arguments: [
                                          controller.popularVideoPodcastList[
                                              itemIndex]
                                        ]);
                                  },
                                  child: UserPodCastContainer(
                                    isLoading: false,
                                    podCastModel: controller
                                        .popularVideoPodcastList[itemIndex],
                                  ),
                                );
                              }),
            ),

            30.verticalSpace,

            Container(
              // margin: EdgeInsets.symmetric(horizontal: 4),
              height: 0.5,
              color: const Color(0xffE8E8E8),
            ),
            30.verticalSpace,
            Row(
              children: [
                Text(
                  "Most ",
                  style: AppTextStyles.semiBold
                      .copyWith(color: AppColors.blackBGColor, fontSize: 16),
                ),
                Text(
                  "Active 🔥",
                  style: AppTextStyles.semiBold
                      .copyWith(color: AppColors.primaryColor, fontSize: 20),
                ),
              ],
            ),
            10.verticalSpace,

            Obx(() => controller.loading.value
                ? CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 18 * SizeConfig.heightMultiplier,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 1,
                    ),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int itemIndex,
                        int pageViewIndex) {
                      return const UserMostActiveContainer(
                        isLoading: true,
                      );
                    })
                : controller.presenterList.isEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 7 * SizeConfig.heightMultiplier),
                        child: const Center(
                            child: NoDataWidget(text: "No Presenter Found")),
                      )
                    : CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 18 * SizeConfig.heightMultiplier,
                          autoPlay: false,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: false,
                          viewportFraction: 1,
                        ),
                        itemCount: controller.presenterList.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                          return UserMostActiveContainer(
                            isLoading: false,
                            userPresenterModel:
                                controller.presenterList[itemIndex],
                          );
                        })),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 4),
              height: 0.5,
              color: const Color(0xffE8E8E8),
            ),
            30.verticalSpace,
            Text(
              "Recent Podcasts",
              style: AppTextStyles.semiBold
                  .copyWith(color: AppColors.lighttextColor, fontSize: 20),
            ),
            10.verticalSpace,
            Obx(
              () => controller.processing.value
                  ? CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 31 * SizeConfig.heightMultiplier,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 1,
                        // aspectRatio: 2.0,
                        // initialPage: 2,
                      ),
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return const UserPodCastContainer(
                          isLoading: true,
                        );
                      })
                  : controller.recentPodcastList.isEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15 * SizeConfig.heightMultiplier),
                          child: const Center(
                              child: NoDataWidget(text: "No Podcast Found")),
                        )
                      : CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 31 * SizeConfig.heightMultiplier,
                            autoPlay: false,
                            enlargeCenterPage: true,
                            enableInfiniteScroll: false,
                            viewportFraction: 1,
                          ),
                          itemCount: controller.recentPodcastList.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) {
                            return CustomCupertinoButton(
                              onTap: () {
                                Get.toNamed(Routes.userPodCastDetail,
                                    arguments: [
                                      controller.recentPodcastList[itemIndex]
                                    ]);
                              },
                              child: UserPodCastContainer(
                                isLoading: false,
                                podCastModel:
                                    controller.recentPodcastList[itemIndex],
                              ),
                            );
                          }),
            ),
            100.verticalSpace,
          ],
        ),
      ),
    );
  }
}
