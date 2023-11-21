import 'package:get/get.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/officineApp/Circonscription.dart';

class CirconscriptionController extends GetxController {
  Rx<List<Circonscription>> circonscriptions = Rx<List<Circonscription>>([]);
  Rx<Circonscription?> currentCirconscription = Rx<Circonscription?>(null);

  UtilisateurController controller = Get.find();

  void onInit() {
    Circonscription.all({}).then((datas) {
      circonscriptions.value = datas;
    });
    currentCirconscription.value =
        controller.currentUser.value?.circonscription;
    super.onInit();
  }
}
