import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppController extends GetxController {
  final box = GetStorage();

  RxInt radius = 1.obs;
  RxBool searchByAround = false.obs;

  void onInit() {
    super.onInit();
  }
}
