import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
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
import 'package:ipi/widgets/takeImage.dart';

class DemandeController extends GetxController {
  final box = GetStorage();
  RxList<DemandeModel> demandes = RxList<DemandeModel>([]);
  RxMap<String, int> repondesDemandes = RxMap<String, int>({});
  RxBool wait = false.obs;

  UtilisateurController controller = Get.find();
  AppController appController = Get.find();
  MapWidgetController mapController = Get.find();
  ProduitController produitController = Get.find();
  OfficineController officineController = Get.find();
  TakeImageController imageCcontroller = Get.find();

  void onInit() async {
    getData();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      checkReponse();
    });
    super.onInit();
  }

  void getData() async {
    demandes.value =
        await DemandeProvider.all({"user": controller.currentUser.value?.id});
    checkReponse();
  }

  void checkReponse() async {
    Map<String, int> tab = {};
    for (var dem in demandes) {
      tab[dem.id!] = await newReponseForDemande(dem);
    }
    if (repondesDemandes.length > 0) {
      if (!mapEquals(tab, repondesDemandes) &&
          tab.length == repondesDemandes.length) {
        NotificationService().showNotification(
            title: 'Nouvelle réponse',
            body: 'Une pharmacie a répondu à votre demande');
      }
    }
    repondesDemandes.value = tab;
  }

  void makeDemande() async {
    Get.dialog(PleaseWait());
    List<OfficineModel> officines = officineController.officines;
    List<ProduitModel> produits = produitController.produitsSelected;
    UtilisateurModel? user = controller.currentUser.value;

    if (officines.length > 0 || officineController.wait.value) {
      if (produits.length > 0 || imageCcontroller.isOrdonnance.value) {
        ResponseModel response = await DemandeProvider.createDemande({
          "utilisateur": user?.id,
          "commentaire": "",
          "lon": mapController.currentPosition.value.longitude,
          "lat": mapController.currentPosition.value.latitude,
          "base64": imageCcontroller.base64.value,
        });
        if (response.ok) {
          DemandeModel demande = response.data;

          for (ProduitModel produit in produits) {
            ResponseModel response = await DemandeProvider.createLigneDemande({
              "produit": produit.id,
              "quantite": produitController.quantiteProduitsSelected[produit],
              "demande": demande.id
            });
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
          produitController.produitsSelected.value = [];
          produitController.quantiteProduitsSelected.value = {};
          officineController.officines.value = [];
          appController.searchByAround.value = false;

          onInit();
          Get.back();
          Get.dialog(FelicitationScreen(
              text:
                  "Nous avons envoyé vos demandes aux pharmacies concernées, elles vous repondront sous peu ..."));
        } else {
          Get.back();
          Fluttertoast.showToast(
            backgroundColor: Colors.red.withOpacity(0.85),
            msg: response.message ?? "Ouups, Veuillez recommencer !",
            gravity: ToastGravity.BOTTOM,
          );
        }
      } else {
        Get.back();
        Fluttertoast.showToast(
          backgroundColor: Colors.red.withOpacity(0.85),
          msg:
              "Veuillez selectionner les médicaments ou scanner votre ordonnance !",
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      Get.back();
      Fluttertoast.showToast(
        backgroundColor: Colors.red.withOpacity(0.85),
        msg: "Aucune pharmacie n'a été trouvé dans ce périmètre de recherche !",
        gravity: ToastGravity.BOTTOM,
      );
    }
  }

  Future<int> newReponseForDemande(DemandeModel demande) async {
    int news = 0;
    var reponses = await ReponseProvider.all({"demande": demande.id});
    for (ReponseModel rep in reponses) {
      if (!rep.read!) {
        news++;
      }
    }
    return news;
  }

  void deleteDemande(DemandeModel demande) async {
    Get.dialog(PleaseWait());
    ResponseModel response = await DemandeProvider.update({
      "id": demande.id,
      "utilisateur": demande.utilisateur?.id,
      "status": demande.is_finished,
      "deleted": true,
    });
    if (response.ok) {
      getData();
      Get.back();
    }
  }
}
