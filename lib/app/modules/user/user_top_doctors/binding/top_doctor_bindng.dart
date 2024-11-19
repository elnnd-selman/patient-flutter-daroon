import 'package:daroon_user/app/modules/user/user_top_doctors/controller/top_doctor_profile_controller.dart';
import 'package:get/get.dart';

class TopDoctorBindng extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TopDoctorProfileController());
  }
}
