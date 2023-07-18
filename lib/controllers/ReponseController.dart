import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/models/GardeModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/provider/GardeProvider.dart';
import 'package:ipi/provider/ReponseProvider.dart';

class ReponseController extends GetxController {
  DemandeController demandeController = Get.find();

  void updateReponse(ReponseModel reponse) async {
    ResponseModel response = await ReponseProvider.update({
      "id": reponse.id,
      "demande": reponse.demande?.id,
      "read": true,
    });
    if (response.ok) {
      demandeController.checkReponse();
    }
  }
}
