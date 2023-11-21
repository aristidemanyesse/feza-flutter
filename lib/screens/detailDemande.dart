import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/ReponseCard.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/models/demandeApp/Demande.dart';
import 'package:ipi/utils/helper.dart';
import "package:intl/intl.dart";
import 'package:lottie/lottie.dart';

class DetailDemande extends StatefulWidget {
  late Demande demande;
  late bool news = false;

  DetailDemande({Key? key, required this.demande}) : super(key: key);
  @override
  State<DetailDemande> createState() => DetailDemandeState();
}

class DetailDemandeState extends State<DetailDemande> {
  ReponseController reponseController = Get.find();

  final f = DateFormat("dd/MM/yyyy à HH:mm");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
              "demande effectuée le ${f.format(DateTime.parse(widget.demande.createdAt))}",
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
                "${widget.demande.demandeLignes.length} médicament${widget.demande.demandeLignes.length > 1 ? 's' : ''} /",
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                widget.demande.ordonnance != "" ? "1 image" : "",
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "    dans ${widget.demande.demandeOfficine.length} pharmacies",
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
            child: widget.demande.demandesOfficinesAnswered().length == 0
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
                      children: widget.demande
                          .demandesOfficinesAnswered()
                          .map((reponse) {
                        return ReponseCard(
                            demande: widget.demande, officineDemande: reponse);
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
