import 'dart:async';

import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/RdvLigneReponseModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/provider/ReponseProvider.dart';

class ReponseController extends GetxController {
  RxList<RdvLigneReponseModel> rdvs = RxList<RdvLigneReponseModel>([]);
  RxInt news = RxInt(0);
  DemandeController demandeController = Get.find();
  UtilisateurController userController = Get.find();

  void onInit() async {
    getData();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      getData();
    });
    super.onInit();
  }

  void getData() async {
    rdvs.value = await ReponseProvider.rdvLigneReponse(
        {"user_id": userController.currentUser.value?.id});
    for (var item in rdvs) {
      if (item.valide! && item.read!) {
        news.value++;
      }
    }
  }

  void updateReponse(ReponseModel reponse) async {
    ResponseModel response = await ReponseProvider.update({
      "id": reponse.id,
      "demande": reponse.demande?.id,
      "read": true,
    });
    if (response.ok) {
      demandeController.updateListReponse();
      demandeController.checkNewReponse();
    }
  }
}
