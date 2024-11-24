import 'package:daroon_user/app/modules/user/user_podcast/controller/presenter_podcast_detail_ctrl.dart';
import 'package:get/get.dart';

class PresenterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PresenterPodcastDetailCtrl());
  }
}
