import 'package:daroon_user/app/modules/user/user_podcast/controller/presenter_podcast_detail_ctrl.dart';
import 'package:daroon_user/app/modules/user/user_podcast/controller/user_podcast_detail_ctrl.dart';
import 'package:daroon_user/app/modules/user/user_podcast/controller/user_presenter_profile_controller.dart';
import 'package:get/get.dart';

class UserPodcastBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserPresenterProfileController());
    Get.lazyPut(() => UserPodcastDetailCtrl());
    Get.lazyPut(() => PresenterPodcastDetailCtrl());
  }
}
