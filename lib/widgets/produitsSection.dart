import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/screens/ProduitsListe.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/recapDemandeDialog.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:ipi/widgets/showImage.dart';
import 'package:ipi/widgets/takeImage.dart';

class ProduitsSection extends StatelessWidget {
  ProduitsSection({
    super.key,
  });

  SearchBottomSheetController controller = Get.find();
  ProduitController produitController = Get.find();
  DemandeController demandeController = Get.find();
  TakeImageController takeImageController = Get.find();

  void showProduitsListe(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ProduitsListe();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Indicator(),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Text("2 - Que recherchez-vous ?",
                  textAlign: TextAlign.center,
                  style: Helper.getTheme(context).headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 21, 67, 111))),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      showProduitsListe(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Couleur de la bordure
                            width: 2.0, // Épaisseur de la bordure
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: AppColor.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Rechercher ...",
                            style: TextStyle(
                              color: AppColor.placeholder,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border:
                              Border.all(color: AppColor.secondary, width: 2)),
                      child: Icon(
                        Icons.camera_alt,
                        size: 26,
                      ),
                    ),
                    onTap: () {
                      Get.dialog(TakeImage());
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    produitController.produitsSelected.length > 0
                        ? GestureDetector(
                            onTap: () {
                              showProduitsListe(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColor.blue),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "${produitController.produitsSelected.length} médicaments",
                                    style: TextStyle(
                                      color: AppColor.blue,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    takeImageController.ok.value
                        ? GestureDetector(
                            onTap: takeImageController.ok.value
                                ? () {
                                    Get.to(ShowImage(File(
                                        takeImageController.file.value.path)));
                                  }
                                : null,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColor.blue),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    takeImageController.ok.value ? "1" : "0",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: AppColor.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(width: 7),
                                  Text(
                                    "ordonnance",
                                    style: TextStyle(
                                        fontSize: 15, color: AppColor.blue),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                );
              })
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.page.value = 0;
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColor.blue),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: AppColor.blue,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.dialog(RecapDemandeDialog());
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: AppColor.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Valider la recherche",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
