import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/RdvItemCard.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/utils/helper.dart';

class ListeRdv extends StatefulWidget {
  ListeRdv({
    Key? key,
  }) : super(key: key);

  @override
  State<ListeRdv> createState() => ListeRdvState();
}

class ListeRdvState extends State<ListeRdv> {
  ListeRdvState();
  int counter = 1;
  ReponseController reponseController = Get.find();

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
            height: 10,
          ),
          Text(
            "Relance par disponibilité ",
            textAlign: TextAlign.center,
            style: Helper.getTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Color.fromARGB(255, 21, 67, 111)),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              "Ces pharmacies vous contacterons lorque ces médicaments seront de nouveaux disponible chez elles.",
              textAlign: TextAlign.center,
              style: Helper.getTheme(context).headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  )),
          const SizedBox(height: 5),
          Container(
            height: 3,
            color: Colors.grey.shade300,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Obx(() {
              return SingleChildScrollView(
                child: Column(
                  children: reponseController.rdvs.map((rdv) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: RdvItemCard(rdv: rdv)),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
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
