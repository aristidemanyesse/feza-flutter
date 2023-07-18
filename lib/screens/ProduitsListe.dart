import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/widgets/SuggestionItemCard.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/searchBarGroup.dart';

class ProduitsListe extends StatefulWidget {
  static const routeName = "/ProduitsListe";

  ProduitsListe({
    Key? key,
  }) : super(key: key);

  @override
  State<ProduitsListe> createState() => ProduitsListeState();
}

class ProduitsListeState extends State<ProduitsListe> {
  ProduitsListeState();

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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(child: SuggestionItemCard(produit: produit)),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          onPressed: () {
                            controller.removeProduitSelected(produit);
                          },
                          icon: Icon(
                            Icons.delete_forever_outlined,
                            color: Colors.red,
                            size: 27,
                          ),
                        )
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
