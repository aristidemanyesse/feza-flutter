import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/widgets/showImage.dart';
import 'package:ipi/widgets/takeImage.dart';
import 'package:marquee_widget/marquee_widget.dart';
import '../utils/helper.dart';

class RecapDemandeDialog extends StatefulWidget {
  const RecapDemandeDialog();

  @override
  State<RecapDemandeDialog> createState() => _RecapDemandeDialogState();
}

class _RecapDemandeDialogState extends State<RecapDemandeDialog> {
  _RecapDemandeDialogState();

  ProduitController produitController = Get.find();
  DemandeController demandeController = Get.find();
  AppController appController = Get.find();
  UtilisateurController utilisateurController = Get.find();
  OfficineController officineController = Get.find();
  TakeImageController takeImageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.85)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          Helper.getAssetName("pharma.png", "icons"),
                          width: 30,
                          height: 30,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          child: Text(
                            "Recap de votre demande".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: Helper.getTheme(context)
                                .headlineLarge
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color.fromARGB(255, 21, 67, 111)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        height: 3,
                        thickness: 3,
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                "Recherche dans ",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blue),
                              ),
                              Text(
                                appController.searchByAround.value
                                    ? "un rayon de ${appController.radius.value} Km"
                                    : "${utilisateurController.currentUser.value?.circonscription?.name}",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.blue),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "- ${officineController.officines.length} pharmacies dans cette zone",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    produitController.produitsSelected.length > 0
                        ? Column(
                            children: [
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Médicaments (${produitController.produitsSelected.length})",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.blue),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: produitController
                                            .produitsSelected
                                            .map((produit) {
                                          return Container(
                                            margin: EdgeInsets.only(bottom: 7),
                                            child: Marquee(
                                              child: Text(
                                                "- ${produit.name}",
                                                style: TextStyle(fontSize: 13),
                                              ),
                                              direction: Axis.horizontal,
                                              textDirection: TextDirection.ltr,
                                              animationDuration:
                                                  Duration(seconds: 4),
                                              backDuration:
                                                  Duration(milliseconds: 5000),
                                              pauseDuration:
                                                  Duration(milliseconds: 1000),
                                              directionMarguee:
                                                  DirectionMarguee.oneDirection,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        : Container(),
                    takeImageController.ok.value
                        ? Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Ordonnance",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.blue),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Hero(
                                  tag: "image",
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(ShowImage(File(takeImageController
                                          .file.value.path)));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.file(
                                          File(takeImageController
                                              .file.value.path),
                                          fit: BoxFit.cover,
                                          height: 200.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColor.blue),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Icon(Icons.arrow_back,
                              size: 18, color: AppColor.blue),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColor.blue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.back();
                              demandeController.makeDemande();
                            },
                            child: Row(
                              children: [
                                Icon(Icons.check,
                                    size: 17, color: Colors.white),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "lancer la recherche",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
