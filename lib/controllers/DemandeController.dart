import 'dart:async';

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
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/DemandeProvider.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/utils/local_notifications.dart';
import 'package:ipi/widgets/felicitation.dart';
import 'package:ipi/widgets/pleaseWait.dart';

class DemandeController extends GetxController {
  final box = GetStorage();
  RxList<DemandeModel> demandes = RxList<DemandeModel>([]);
  RxMap<String, bool> repondesDemandes = RxMap<String, bool>({});

  UtilisateurController controller = Get.find();
  ProduitController produitController = Get.find();
  OfficineController officineController = Get.find();

  void onInit() async {
    getData();
    Timer.periodic(Duration(seconds: 20), (Timer timer) {
      print("check");
      checkReponse();
    });
    super.onInit();

    // ever(
    //   repondesDemandes,
    //   (callback) => NotificationService().showNotification(
    //       title: 'Nouvelle réponse',
    //       body: 'Une pharmacie a répondu à votre demande'),
    // );
  }

  void getData() async {
    demandes.value =
        await DemandeProvider.all({"user": controller.currentUser.value?.id});
    checkReponse();
  }

  void checkReponse() async {
    for (var dem in demandes) {
      repondesDemandes[dem.id!] = await newReponseForDemande(dem);
    }
  }

  void makeDemande(bool isOrdonnance, String base64) async {
    List<OfficineModel> officines = officineController.officines;
    List<ProduitModel> produits = produitController.produitsSelected;
    UtilisateurModel? user = controller.currentUser.value;

    if (officines.length > 0 || officineController.wait.value) {
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
          Get.back();
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

  Future<bool> newReponseForDemande(DemandeModel demande) async {
    bool news = false;
    var reponses = await ReponseProvider.all({"demande": demande.id});
    for (ReponseModel rep in reponses) {
      if (!rep.read!) {
        news = true;
        break;
      }
    }
    return news;
  }

  void deleteDemande(DemandeModel demande) async {
    Get.dialog(PleaseWait());
    ResponseModel response = await DemandeProvider.update({
      "id": demande.id,
      "utilisateur": demande.utilisateur?.id,
      "status": demande.status,
      "deleted": true,
    });
    if (response.ok) {
      getData();
      Get.back();
    }
  }
}
