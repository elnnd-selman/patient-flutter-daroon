import 'package:daroon_user/app/modules/user/user_appointment/controller/cancel_appointment_controller.dart';
import 'package:get/get.dart';

class UserAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CancelAppointmentController());
  }
}
