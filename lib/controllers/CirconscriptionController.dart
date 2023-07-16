import 'package:get/get.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/CirconscriptionModel.dart';
import 'package:ipi/provider/CirconscriptionProvider.dart';

class CirconscriptionController extends GetxController {
  Rx<List<CirconscriptionModel>> circonscriptions =
      Rx<List<CirconscriptionModel>>([]);
  Rx<CirconscriptionModel?> currentCirconscription =
      Rx<CirconscriptionModel?>(null);

  UtilisateurController controller = Get.find();

  void onInit() {
    CirconscriptionProvider.all({}).then((datas) {
      circonscriptions.value = datas;
    });
    currentCirconscription.value =
        controller.currentUser.value?.circonscription;
    super.onInit();
  }
}
