import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocalStorageController extends GetxController {
  Box<dynamic>? daroonBox;
  @override
  Future<void> onInit() async {
    super.onInit();
    daroonBox = await Hive.openBox('DaroonBox');
  }
}
