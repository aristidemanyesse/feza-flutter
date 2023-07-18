import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/LigneDemandeModel.dart';
import 'package:ipi/models/OfficineDemandeModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/provider/DemandeProvider.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/screens/detailDemande.dart';
import "package:intl/intl.dart";
import 'package:ipi/widgets/animations.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class DemandeItemCard extends StatefulWidget {
  static const routeName = "/DemandeItemCard";
  final DemandeModel demande;
  final bool status;
  DemandeItemCard(this.demande, this.status);

  @override
  State<DemandeItemCard> createState() => DemandeItemCardState();
}

class DemandeItemCardState extends State<DemandeItemCard> {
  DemandeController demandeController = Get.find();

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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      demandeController.deleteDemande(widget.demande);
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
                    child: widget.status
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              color: AppColor.green,
                              height: 25,
                              width: 25,
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 14,
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
