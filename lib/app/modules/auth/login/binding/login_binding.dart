import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/login/controller/login_controller.dart';
import 'package:daroon_user/app/modules/auth/signup/controller/profile_pic_controller.dart';
import 'package:daroon_user/app/modules/auth/signup/controller/signup_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginCtrl());
    Get.lazyPut(() => SignUpCtrl());
    Get.lazyPut(() => ProfilePicController());
  }
}
