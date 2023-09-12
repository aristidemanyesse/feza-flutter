import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/components/myLogo.dart';
import 'package:ipi/const/colors.dart';
import '../utils/helper.dart';

class CGU extends StatefulWidget {
  CGU({Key? key}) : super(key: key);

  @override
  State<CGU> createState() => CGUState();
}

class CGUState extends State<CGU> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      margin: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 245, 239, 235),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Indicator(),
            onTap: () {
              Get.back();
            },
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.size.width * 0.25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyLogo(
                      height: 40,
                      width: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Politique de confidentialité de iPi")),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Nous nous engageons à protéger votre vie privée. Cette politique de confidentialité explique comment nous collectons, utilisons et partageons vos informations personnelles lorsque vous utilisez l'application iPi.")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Collecte d'informations")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Nous collectons les informations personnelles suivantes lorsque vous utilisez l'application iPi : Votre nom, Votre numéro de téléphone, Votre emplacement, Les informations de votre téléphone, telles que le modèle, l'opérateur et le système d'exploitation")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Utilisation des informations")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Nous utilisons vos informations personnelles pour les finalités suivantes : Pour vous fournir les fonctionnalités de l'application iPi, telles que la possibilité de vous connecter, de consulter la liste des officines et de médicaments, de faire des demandes auprès d'elles et de recevoir des notifications; Pour améliorer l'application iPi en analysant la façon dont vous l'utilisez; Pour vous envoyer des communications marketing, telles que des offres spéciales et des nouvelles produits; Pour vous fournir un service client, tel que la résolution des problèmes techniques et le traitement des demandes de remboursement.")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Partage des informations")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Nous ne partageons pas vos informations personnelles avec des tiers, sauf dans les cas suivants: Avec des fournisseurs de services qui nous aident à fournir les fonctionnalités de l'application iPi, tels que les fournisseurs de services de paiement et les fournisseurs d'hébergement; Avec les autorités compétentes si nous sommes tenus de le faire par la loi.")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Vos droits")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Vous avez le droit d'accéder, de corriger, de supprimer ou de limiter l'utilisation de vos informations personnelles. Vous avez également le droit de vous opposer à l'utilisation de vos informations personnelles et de demander la portabilité de vos données.")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Comment nous contacter")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Si vous avez des questions ou des préoccupations concernant cette politique de confidentialité, veuillez nous contacter à l'adresse suivante : info@ipi-app.com")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      child: Text("Mises à jour")),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextStyle(
                      style: TextStyle(
                          color: Colors.black54, fontSize: 13, height: 1.3),
                      textAlign: TextAlign.justify,
                      child: Text(
                          "Nous pouvons mettre à jour cette politique de confidentialité de temps à autre. Si nous apportons des modifications importantes, nous vous en informerons par e-mail ou sur l'application iPi directement.")),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 13,
                                height: 1.3),
                            textAlign: TextAlign.justify,
                            child: Text("iPi @ Copyright 2023")),
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: SizedBox(
              width: double.infinity,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("Ok, j'accepte tout !".toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
