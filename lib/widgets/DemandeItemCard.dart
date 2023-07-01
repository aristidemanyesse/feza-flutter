import 'package:flutter/material.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/LigneDemandeModel.dart';
import 'package:ipi/models/OfficineDemandeModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/provider/DemandeProvider.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/screens/detailDemande.dart';
import "package:intl/intl.dart";

import '../const/colors.dart';
import '../utils/helper.dart';

class DemandeItemCard extends StatefulWidget {
  static const routeName = "/DemandeItemCard";
  final DemandeModel demande;
  DemandeItemCard(this.demande);

  @override
  State<DemandeItemCard> createState() => DemandeItemCardState();
}

class DemandeItemCardState extends State<DemandeItemCard> {
  final f = DateFormat("dd/MM/yyyy à HH:mm");

  late List<LigneDemandeModel> produits = [];
  late List<OfficineDemandeModel> officines = [];
  late List<ReponseModel> reponses = [];
  late bool news = false;

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
    produits =
        await DemandeProvider.allLignesDemande({"demande": widget.demande.id});
    officines = await DemandeProvider.allOfficinesDemande(
        {"demande": widget.demande.id});
    reponses = await ReponseProvider.all({"demande": widget.demande.id});
    for (ReponseModel rep in reponses) {
      if (!rep.read!) {
        news = true;
        break;
      }
    }
    setState(() {});
  }

  void showDetail(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return DetailDemande(
            demande: widget.demande, officines: officines, produits: produits);
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
        elevation: 5.0,
        color: Colors.white.withOpacity(0.9),
        margin: EdgeInsets.only(bottom: 15),
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
                            f.format(
                                DateTime.parse(widget.demande.createdAt ?? "")),
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
                                Text(
                                  "${produits.length} médicaments",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  " - ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  widget.demande.base64 != ""
                                      ? "1 ordonnance"
                                      : "",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
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
              Center(
                  child: Container(
                margin: EdgeInsets.only(right: 10),
                child: news
                    ? Icon(
                        Icons.chat_rounded,
                        color: Colors.green,
                      )
                    : Text(
                        "${reponses.length}/${officines.length}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
