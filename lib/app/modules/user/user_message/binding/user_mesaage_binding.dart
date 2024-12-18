import 'package:daroon_user/app/modules/user/user_message/controller/chat_room_controller.dart';
import 'package:daroon_user/app/modules/user/user_message/controller/doctor_meeting_controller.dart';
import 'package:daroon_user/app/modules/user/user_message/controller/user_message_controller.dart';
import 'package:get/get.dart';

class UserMesaageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserMessageController());
    Get.lazyPut(() => ChatRoomController());
    Get.lazyPut(() => DoctorMeetingController());
  }
}
