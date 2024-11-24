import 'package:daroon_user/app/modules/user/user_podcast/controller/user_podcast_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_profile_controller.dart';
import 'package:get/get.dart';
import 'package:daroon_user/app/modules/user/user_home/controller/user_home_controller.dart';
import 'package:daroon_user/app/modules/user/user_top_doctors/controller/user_top_doctor_controller.dart';

class UserHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserHomeController());
    Get.lazyPut(() => UserTopDoctorController());
    Get.lazyPut(() => UserPodcastController());
    Get.lazyPut(() => UserProfileController());
  }
}
