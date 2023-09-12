import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/models/ProduitModel.dart';

class ConfirmQuantite extends StatelessWidget {
  final ProduitModel produit;

  ConfirmQuantite(this.produit);

  ProduitController controller = Get.put(ProduitController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.85)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Quantité pour la demande".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13, height: 1.3, color: Colors.green.shade900),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      produit.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      produit.forme ?? "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.quantiteProduitsSelected[produit]! > 1) {
                          controller.quantiteProduitsSelected[produit] =
                              controller.quantiteProduitsSelected[produit]! - 1;
                        }
                      },
                      child: Icon(
                        Icons.remove,
                        size: 35,
                        color: AppColor.blue,
                      ),
                    ),
                    Obx(() {
                      return Text(
                          "x ${controller.quantiteProduitsSelected[produit]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black));
                    }),
                    GestureDetector(
                      onTap: () {
                        controller.quantiteProduitsSelected[produit] =
                            controller.quantiteProduitsSelected[produit]! + 1;
                      },
                      child: Icon(
                        Icons.add,
                        color: AppColor.blue,
                        size: 35,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "(Prix approximatif NPSP)",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${produit.price} Fcfa",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black45)),
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}
