import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/ReponseCard.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/LigneDemandeModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/utils/helper.dart';
import "package:intl/intl.dart";
import 'package:lottie/lottie.dart';

class DetailDemande extends StatefulWidget {
  late List<LigneDemandeModel> produits = [];
  late DemandeModel demande;
  late bool news = false;

  DetailDemande({Key? key, required this.demande, required this.produits})
      : super(key: key);
  @override
  State<DetailDemande> createState() => DetailDemandeState();
}

class DetailDemandeState extends State<DetailDemande> {
  ReponseController reponseController = Get.find();
  late List<ReponseModel> reponses = [];

  final f = DateFormat("dd/MM/yyyy à HH:mm");

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getData() async {
    reponses = await ReponseProvider.all({"demande": widget.demande.id});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
      margin:
          EdgeInsets.fromLTRB(3, Helper.getScreenHeight(context) * 0.1, 3, 0),
      decoration: ShapeDecoration(
        color: Color.fromARGB(255, 245, 239, 235).withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
      ),
      child: Column(
        children: [
          Indicator(),
          SizedBox(
            height: 5,
          ),
          Text(
            "Réponse des pharmacies ",
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
              "demande effectuée le ${f.format(DateTime.parse(widget.demande.createdAt ?? ""))}",
              textAlign: TextAlign.center,
              style: Helper.getTheme(context).headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  )),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${widget.produits.length} médicament${widget.produits.length > 1 ? 's' : ''}",
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                (widget.demande.base64 != "" && widget.demande.base64 != null)
                    ? "1 ordonnance"
                    : "",
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: 3,
            color: Colors.grey,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: reponses.length == 0
                ? Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Lottie.asset(
                          "assets/lotties/empty.json",
                        ),
                      ),
                      Text(
                        "Aucune pharmacie n'a encore \n repondu pour le moment ...",
                        textAlign: TextAlign.center,
                        style: TextStyle(height: 1.5),
                      ),
                    ],
                  ))
                : SingleChildScrollView(
                    child: Column(
                      children: reponses.map((reponse) {
                        return ReponseCard(reponse: reponse);
                      }).toList(),
                    ),
                  ),
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
