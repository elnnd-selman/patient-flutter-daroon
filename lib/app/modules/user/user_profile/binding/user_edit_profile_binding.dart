import 'package:daroon_user/app/modules/user/user_profile/controller/user_change_email_controller.dart';
import 'package:daroon_user/app/modules/user/user_profile/controller/user_change_username_controller.dart';
import 'package:get/get.dart';

class UserEditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserChangeEmailController());
    Get.lazyPut(() => UserChangeUserNameController());
  }
}
