import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/models/GardeModel.dart';
import 'package:ipi/provider/GardeProvider.dart';

class GardeController extends GetxController {
  final box = GetStorage();
  Rx<GardeModel?> currentGarde = Rx<GardeModel?>(null);

  void onInit() {
    GardeProvider.all({}).then((datas) {
      if (datas.length > 0) {
        currentGarde.value = datas[0];
      }
    });
    super.onInit();
  }
}
