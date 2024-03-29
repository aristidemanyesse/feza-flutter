import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/components/loader.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/coreApp/ResponseModel.dart';
import 'package:ipi/models/demandeApp/Demande.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:ipi/models/demandeApp/Reponse.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';
import 'package:ipi/utils/local_notifications.dart';
import 'package:ipi/widgets/felicitation.dart';
import 'package:ipi/widgets/takeImage.dart';
import 'package:intl/intl.dart';

class DemandeController extends GetxController {
  final box = GetStorage();
  RxList<Demande> demandes = RxList<Demande>([]);
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
    Timer.periodic(Duration(seconds: 7), (Timer timer) {
      getData();
    });
    ever(demandes, (callback) {
      checkNewReponse();
    });
    super.onInit();
  }

  void getData() async {
    demandes.value =
        await Demande.all({"utilisateur_Id": controller.currentUser.value?.id});
    checkNewReponse();
  }

  void checkNewReponse() async {
    DateTime now = DateTime.now();
    String created = box.read('reponseDateSearched') ??
        DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);
    int total = 0;
    for (var demande in demandes) {
      int news = 0;
      for (OfficineDemande officineDemande in demande.demandeOfficine) {
        for (Reponse reponse in officineDemande.demandeReponse) {
          if (DateTime.parse(reponse.createdAt)
              .isAfter(DateTime.parse(created))) {
            news += 1;
            total += 1;
          }
        }
      }
      demande = demande.copyWith(news: news);
    }
    if (total > 0) {
      NotificationService().showNotification(
          title: 'Nouvelle réponse',
          body: 'Une pharmacie a répondu à votre demande');
      Get.snackbar(
          'Nouvelle réponse', 'Une pharmacie a répondu à votre demande');
    }
  }

  void makeDemande() async {
    Get.dialog(LoaderScreen(
      title: "iPi envoie votre demande aux pharmacies sélectionnées...",
    ));
    List<Officine> officines = officineController.officines;
    List<Produit> produits = produitController.produitsSelected;
    Utilisateur? user = controller.currentUser.value;

    if (officines.length > 0 || officineController.wait.value) {
      if (produits.length > 0 || imageCcontroller.isOrdonnance.value) {
        ResponseModel response = await Demande.createDemande({
          "utilisateur": user?.id,
          "commentaire": "",
          "lon": mapController.currentPosition.value.longitude,
          "lat": mapController.currentPosition.value.latitude,
          "base64": imageCcontroller.base64.value,
        });
        if (response.ok) {
          Demande demande = response.data;

          for (Produit produit in produits) {
            ResponseModel response = await Demande.createLigneDemande({
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
            ResponseModel response = await Demande.createOfficineDemande(
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

  Future<int> newReponseForDemande(Demande demande) async {
    DateTime now = DateTime.now();

    String created = box.read('reponseDateSearched') ??
        DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);
    int news = 0;
    var reponses =
        await Reponse.all({"demande": demande.id, "created": created});
    for (Reponse rep in reponses) {
      if (!rep.read) {
        news++;
      }
    }
    box.write(
        'reponseDateSearched', DateFormat("yyyy-MM-ddTHH:mm:ss").format(now));
    return news;
  }

  Future<int> notReadReponseDemande(Demande demande) async {
    int news = 0;
    var reponses = await Reponse.all({"demande": demande.id});
    for (Reponse rep in reponses) {
      if (!rep.read) {
        news++;
      }
    }
    return news;
  }
}
