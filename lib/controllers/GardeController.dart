import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/models/officineApp/Garde.dart';

class GardeController extends GetxController {
  final box = GetStorage();
  Rx<Garde?> currentGarde = Rx<Garde?>(null);

  void onInit() {
    Garde.all({}).then((datas) {
      if (datas.length > 0) {
        currentGarde.value = datas[0];
      }
    });
    super.onInit();
  }
}
