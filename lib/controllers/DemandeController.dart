import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/DemandeProvider.dart';
import 'package:ipi/widgets/felicitation.dart';

class DemandeController extends GetxController {
  final box = GetStorage();
  Rx<List<DemandeModel>> demandes = Rx<List<DemandeModel>>([]);

  UtilisateurController controller = Get.find();
  ProduitController produitController = Get.find();
  OfficineController officineController = Get.find();

  void onInit() {
    DemandeProvider.all({"user": controller.currentUser.value?.id})
        .then((datas) => demandes.value = datas);
    super.onInit();
  }

  void makeDemande(bool isOrdonnance, String base64) async {
    List<OfficineModel> officines = officineController.officines.value;
    List<ProduitModel> produits = produitController.produitsSelected;
    UtilisateurModel? user = controller.currentUser.value;

    if (officines.length > 0) {
      if (produits.length > 0 || isOrdonnance) {
        ResponseModel response = await DemandeProvider.createDemande({
          "utilisateur": user?.id,
          "commentaire": "",
          "base64": base64,
        });
        if (response.ok) {
          DemandeModel demande = response.data;

          for (ProduitModel produit in produits) {
            ResponseModel response = await DemandeProvider.createLigneDemande(
                {"produit": produit.id, "demande": demande.id});
            if (!response.ok) {
              Fluttertoast.showToast(
                msg:
                    response.message ?? "Ouups, Produit Veuillez recommencer !",
                gravity: ToastGravity.BOTTOM,
              );
            }
          }

          for (var officine in officines) {
            ResponseModel response =
                await DemandeProvider.createOfficineDemande(
                    {"officine": officine.id, "demande": demande.id});
            if (!response.ok) {
              Fluttertoast.showToast(
                msg: response.message ??
                    "Ouups, officine Veuillez recommencer !",
                gravity: ToastGravity.BOTTOM,
              );
            }
          }

          Get.dialog(FelicitationScreen());
          onInit();
          produitController.produitsSelected.value = [];
          officineController.officines.value = [];
        } else {
          Fluttertoast.showToast(
            backgroundColor: Colors.red.withOpacity(0.85),
            msg: response.message ?? "Ouups, Veuillez recommencer !",
            gravity: ToastGravity.BOTTOM,
          );
        }
      } else {
        Fluttertoast.showToast(
          backgroundColor: Colors.red.withOpacity(0.85),
          msg:
              "Veuillez selectionner les médicaments ou scanner votre ordonnance !",
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      Fluttertoast.showToast(
        backgroundColor: Colors.red.withOpacity(0.85),
        msg: "Aucune pharmacie n'a été trouvé dans ce périmètre de recherche !",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
