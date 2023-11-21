
import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/demandeApp/Demande.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';

class ReponseController extends GetxController {
  RxList<RdvLigneReponse> rdvs = RxList<RdvLigneReponse>([]);
  RxInt news = RxInt(0);
  DemandeController demandeController = Get.find();
  UtilisateurController userController = Get.find();

  void onInit() async {
    getData();
    ever(demandeController.demandes, (callback) {
      getData();
    });
    super.onInit();
  }

  void getData() async {
    for (Demande demande in demandeController.demandes) {
      rdvs.addAll(demande.ligneReponseWithRdv());
    }

    for (var item in rdvs) {
      if (item.valide && item.read) {
        news.value++;
      }
    }
  }
}
