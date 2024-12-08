import 'package:daroon_user/app/modules/user/user_invoice/controller/user_invoice_controller.dart';
import 'package:get/get.dart';

class UserInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInvoiceController());
  }
}
