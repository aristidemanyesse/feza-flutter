import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/models/demandeApp/Demande.dart';
import 'package:ipi/models/demandeApp/LigneDemande.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:ipi/models/demandeApp/Reponse.dart';
import 'package:ipi/screens/detailDemande.dart';
import "package:intl/intl.dart";
import 'package:ipi/widgets/confirmDialog.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class DemandeItemCard extends StatefulWidget {
  final Demande demande;
  final int news;
  DemandeItemCard(this.demande, this.news);

  @override
  State<DemandeItemCard> createState() => DemandeItemCardState();
}

class DemandeItemCardState extends State<DemandeItemCard> {
  DemandeController demandeController = Get.find();

  DateFormat? dateFormat;
  DateFormat? timeFormat;

  late List<LigneDemande> lignes = [];
  late List<OfficineDemande> officines = [];
  late List<Reponse> reponses = [];
  late bool news = false;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('fr');
    timeFormat = new DateFormat.Hm('fr');

    lignes = widget.demande.demandeLignes;
    officines = widget.demande.demandeOfficine;
    reponses = widget.demande.reponsesOfficines();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DetailDemande(demande: widget.demande);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDetail(context);
      },
      child: Card(
        elevation: 1.0,
        color: Colors.white.withOpacity(0.9),
        margin: EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.receipt_long_sharp,
                            size: 20,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "${dateFormat!.format(DateTime.parse(widget.demande.createdAt))} ${timeFormat!.format(DateTime.parse(widget.demande.createdAt))}",
                            style: Helper.getTheme(context)
                                .headlineMedium
                                ?.copyWith(
                                    color: AppColor.primary, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                lignes.length > 0
                                    ? Text(
                                        "${lignes.length} médicament${lignes.length > 1 ? 's' : ''}     ",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : Container(),
                                widget.demande.ordonnance != ""
                                    ? Text(
                                        "1 image",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    : Container()
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Dans ${officines.length} pharmacies",
                                  style: TextStyle(fontSize: 12),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.dialog(
                        ConfirmDialog(
                          title: "Suppression",
                          message:
                              "Voulez-vous vraiment annuler cette demande auprès des pharmacies !",
                          testOk: "Oui",
                          testCancel: "Non",
                          functionOk: () {
                            widget.demande.deleteDemande();
                            Get.back();
                          },
                          functionCancel: () {
                            Get.back();
                          },
                        ),
                      );
                    },
                    child: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: widget.demande.news > 0
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              color: Color.fromARGB(255, 69, 180, 110),
                              height: 20,
                              width: 20,
                              child: Center(
                                child: Text(
                                  widget.demande.news.toString(),
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        : Text(
                            "${reponses.length}/${officines.length}",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
