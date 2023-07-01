import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/LigneDemandeModel.dart';
import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/OfficineDemandeModel.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/ligneProduitAvialable.dart';
import "package:intl/intl.dart";

class DetailDemande extends StatefulWidget {
  static const routeName = "/DetailDemande";

  late List<LigneDemandeModel> produits = [];
  late List<OfficineDemandeModel> officines = [];
  late DemandeModel demande;
  late bool news = false;

  DetailDemande(
      {Key? key,
      required this.demande,
      required this.officines,
      required this.produits})
      : super(key: key);
  @override
  State<DetailDemande> createState() => DetailDemandeState();
}

class DetailDemandeState extends State<DetailDemande> {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  UtilisateurModel? user;
  late Map<OfficineModel, List<LigneReponseModel>> datas = {};
  late Map<OfficineModel, ReponseModel> reponses = {};

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
    for (OfficineDemandeModel offdem in widget.officines) {
      List<LigneReponseModel> lignes = [];
      List<ReponseModel> data = await ReponseProvider.all(
          {"officine": offdem.officine!.id, "demande": widget.demande.id});
      if (data.length > 0) {
        ReponseModel reponse = data[0];
        lignes =
            await ReponseProvider.allLignesReponse({"reponse": reponse.id});
        datas[reponse.demande!.officine!] = lignes;
        reponses[reponse.demande!.officine!] = reponse;
      } else {
        datas[offdem.officine!] = lignes;
      }
    }
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
            "Reponse des pharmacies",
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
                "${widget.produits.length} médicaments",
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                " - ",
                style: TextStyle(fontSize: 12, color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                widget.demande.base64 != "" ? "1 ordonnance" : "",
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
            child: SingleChildScrollView(
              child: Column(
                children: reponses.keys.map((officine) {
                  ReponseModel reponse = reponses[officine]!;
                  return Container(
                    margin: EdgeInsets.only(bottom: 15),
                    child: ExpansionTile(
                      leading: Image.asset(
                        "assets/images/icons/pharma.png",
                        height: 30,
                      ),
                      trailing: reponse.read!
                          ? GestureDetector(
                              child: Icon(
                                Icons.place,
                                color: Color.fromARGB(255, 84, 75, 75),
                              ),
                            )
                          : Icon(
                              Icons.chat_rounded,
                              color: Colors.green,
                            ),
                      onExpansionChanged: (value) {
                        if (value && !reponse.read!) {
                          print(reponse.demande!.id);
                          ReponseProvider.update({
                            "id": reponse.id,
                            "demande": reponse.demande!.id,
                            "read": true
                          });
                          setState(() {});
                        }
                      },
                      collapsedBackgroundColor: Colors.white.withOpacity(0.8),
                      backgroundColor: Colors.white.withOpacity(0.5),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            officine.name ?? "",
                            style: TextStyle(
                                fontSize: 15,
                                color: reponse.read!
                                    ? Colors.grey
                                    : Color.fromARGB(255, 6, 114, 49),
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            "${officine.circonscription!.name} ${officine.localisation ?? ''}",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      children: [
                        Container(
                          height: 2,
                          color: Colors.grey.shade300,
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: datas[officine]!.map((prod) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Ligne(
                                    produit: prod.produit!,
                                    active: prod.status!,
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.grey.shade300,
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                        reponses[officine]!.commentaire != ""
                            ? Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Le traitant: ",
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Expanded(
                                      child: Text(
                                        reponses[officine]!.commentaire ?? "",
                                        style: TextStyle(
                                            height: 1.2,
                                            fontStyle: FontStyle.italic),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Container()
                      ],
                    ),
                  );
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
                      Navigator.pop(context);
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
