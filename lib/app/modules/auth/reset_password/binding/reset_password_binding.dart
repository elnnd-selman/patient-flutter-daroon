import 'package:get/get.dart';
import 'package:daroon_user/app/modules/auth/reset_password/controller/reset_password_controller.dart';

class ResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResetPasswordController());
  }
}
