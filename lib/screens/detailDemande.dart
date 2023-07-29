import 'dart:async';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/LigneDemandeModel.dart';
import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/OfficineDemandeModel.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/SubsLigneReponseModel.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/utils/helper.dart';
import "package:intl/intl.dart";
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:share_plus/share_plus.dart';

import '../components/ligneProduitAvialable.dart';

class DetailDemande extends StatefulWidget {
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
  MapWidgetController mpController = Get.find();
  ReponseController reponseController = Get.find();

  late Map<OfficineModel, List<LigneReponseModel>> datas = {};
  late Map<OfficineModel, ReponseModel> reponses = {};
  late Map<LigneReponseModel, List<SubsLigneReponseModel>> subsLignes = {};

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
      List<ReponseModel> data = await ReponseProvider.all(
          {"officine": offdem.officine!.id, "demande": widget.demande.id});
      List<LigneReponseModel> lignes = [];
      if (data.length > 0) {
        ReponseModel reponse = data[0];
        lignes =
            await ReponseProvider.allLignesReponse({"reponse": reponse.id});
        for (var ligne in lignes) {
          subsLignes[ligne] =
              await ReponseProvider.subsLigneReponse({"ligne_id": ligne.id});
        }
        datas[reponse.demande!.officine!] = lignes;
        reponses[reponse.demande!.officine!] = reponse;
      } else {
        datas[offdem.officine!] = lignes;
      }
    }
    print(subsLignes);
    setState(() {});
  }

  void sharePosition(OfficineModel officine) {
    // await FlutterShare.share(
    //     title: 'Example share',
    //     text: 'Example share text',
    //     linkUrl: 'https://flutter.dev/',
    //     chooserTitle: 'Example Chooser Title');

    Share.share(mpController.currentPosition.value.toString(),
        subject: 'Partage de la position de ${officine.name}');
  }

  void copy(OfficineModel officine) {
    FlutterClipboard.copy(mpController.currentPosition.value.toString())
        .then((value) => Fluttertoast.showToast(
              msg: "Localisation copiéé!",
              gravity: ToastGravity.BOTTOM,
            ));
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
            "Reponse des pharmacies ",
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
            child: reponses.keys.length == 0
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
                                ? null
                                : Icon(
                                    Icons.chat_rounded,
                                    color: Colors.green,
                                  ),
                            onExpansionChanged: (value) {
                              if (value && !reponse.read!) {
                                reponseController.updateReponse(reponse);
                              }
                            },
                            collapsedBackgroundColor:
                                Colors.white.withOpacity(0.8),
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
                                  children: datas[officine]!.map((ligne) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Ligne(ligneReponse: ligne),
                                        Column(
                                          children:
                                              subsLignes[ligne]!.map((sub) {
                                            return LigneSub(sub: sub);
                                          }).toList(),
                                        ),
                                        Container(
                                          height: 2,
                                          color: Colors.grey.shade400,
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 7),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              reponses[officine]!.commentaire != ""
                                  ? Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Le pharmacien: ",
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
                                              reponses[officine]!.commentaire ??
                                                  "",
                                              style: TextStyle(
                                                  height: 1.2,
                                                  fontStyle: FontStyle.italic),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : Container(),
                              Container(
                                margin: EdgeInsets.only(
                                    right: 20, top: 10, bottom: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Total = ",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    Text(
                                      "${reponse.price} Fcfa",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey.shade300,
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        UrlLauncher.launchUrl(
                                            "tel://${officine.contact}" as Uri);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColor.blue, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: Icon(
                                          Icons.call,
                                          size: 24,
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        copy(officine);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColor.blue, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: Icon(
                                          Icons.copy_all_outlined,
                                          size: 24,
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        sharePosition(officine);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColor.blue, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: Icon(
                                          Icons.share,
                                          size: 24,
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: AppColor.blue, width: 1),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100))),
                                        child: Icon(
                                          Icons.route_outlined,
                                          size: 24,
                                          color: AppColor.blue,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              )
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
