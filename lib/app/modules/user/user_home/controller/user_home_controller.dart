import 'dart:developer';

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/controllers/local_storage_controller.dart';
import 'package:daroon_user/global/constants/app_colors.dart';

class UserHomeController extends GetxController {
  RxInt isSelected = 0.obs;

  final _selectedTab = 0.obs;
  int get selectedTab => _selectedTab.value;

  void selectTab(int value) async {
    _selectedTab.value = value;
  }

  final AppinioSwiperController appinioSwiperController =
      AppinioSwiperController();

  List<Color> gradientColors = [
    AppColors.primaryColor,
    AppColors.primaryColor,
  ];

  @override
  void onInit() {
    super.onInit();
    Get.find<LocalStorageController>().daroonBox!.delete("isLogin");
  }

  Future<void> shakeCard() async {
    const double distance = 30;
    // We can animate back and forth by chaining different animations.
    await appinioSwiperController.animateTo(
      const Offset(-distance, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    await appinioSwiperController.animateTo(
      const Offset(distance, 0),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
    // We need to animate back to the center because `animateTo` does not center
    // the card for us.
    await appinioSwiperController.animateTo(
      const Offset(0, 0),
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void swipeEnd(int previousIndex, int targetIndex, SwiperActivity activity) {
    switch (activity) {
      case Swipe():
        log('The card was swiped to the : ${activity.direction}');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case Unswipe():
        log('A ${activity.direction.name} swipe was undone.');
        log('previous index: $previousIndex, target index: $targetIndex');
        break;
      case CancelSwipe():
        log('A swipe was cancelled');
        break;
      case DrivenActivity():
        log('Driven Activity');
        break;
    }
  }

  void onEnd() {
    log('end reached!');
  }
}
