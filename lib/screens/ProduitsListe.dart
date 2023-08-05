import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/SuggestionItemCard.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/components/searchBarGroup.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/ProduitController.dart';

class ProduitsListe extends StatefulWidget {
  ProduitsListe({
    Key? key,
  }) : super(key: key);

  @override
  State<ProduitsListe> createState() => ProduitsListeState();
}

class ProduitsListeState extends State<ProduitsListe> {
  ProduitsListeState();
  int counter = 1;
  ProduitController controller = Get.put(ProduitController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      margin: EdgeInsets.fromLTRB(3, 50, 3, 0),
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 245, 239, 235),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Indicator(),
          SizedBox(
            height: 20,
          ),
          SearchBarGroup(),
          const SizedBox(height: 10),
          Container(
            height: 3,
            color: Colors.grey.shade300,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              return Column(
                children: controller.produitsSelected.map((produit) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.removeProduitSelected(produit);
                          },
                          child: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 25,
                          ),
                        ),
                        Expanded(child: SuggestionItemCard(produit: produit)),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(40)),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  controller.quantiteProduitsSelected[produit] =
                                      controller.quantiteProduitsSelected[
                                              produit]! +
                                          1;
                                },
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  color: AppColor.blue,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 0),
                                child: Text(
                                  "${controller.quantiteProduitsSelected[produit]}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (controller
                                          .quantiteProduitsSelected[produit]! >
                                      1) {
                                    controller
                                            .quantiteProduitsSelected[produit] =
                                        controller.quantiteProduitsSelected[
                                                produit]! -
                                            1;
                                  }
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: AppColor.blue,
                                  size: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent,
                ),
                child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Terminer",
                      style: TextStyle(fontSize: 15, color: Colors.red),
                    )),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
