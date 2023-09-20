import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ipi/components/ligneProduitAvialable.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ReponseModel.dart';
import 'package:ipi/models/SubsLigneReponseModel.dart';
import 'package:ipi/provider/ReponseProvider.dart';
import 'package:ipi/widgets/felicitation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

class ReponseCard extends StatefulWidget {
  final ReponseModel reponse;
  late bool news = false;

  ReponseCard({Key? key, required this.reponse}) : super(key: key);
  @override
  State<ReponseCard> createState() => ReponseCardState();
}

class ReponseCardState extends State<ReponseCard> {
  MapWidgetController mpController = Get.find();
  ReponseController reponseController = Get.find();
  DemandeController demandeController = Get.find();

  late List<LigneReponseModel> lignes = [];
  late Map<LigneReponseModel, List<SubsLigneReponseModel>> subsLignes = {};

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    lignes =
        await ReponseProvider.allLignesReponse({"reponse": widget.reponse.id});
    for (var ligne in lignes) {
      subsLignes[ligne] =
          await ReponseProvider.subsLigneReponse({"ligne_id": ligne.id});
    }
    setState(() {});
  }

  void sharePosition(OfficineModel officine) {
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
    ReponseModel reponse = widget.reponse;
    OfficineModel officine = reponse.demande!.officine!;

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
              children: lignes.map((ligne) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Ligne(ligneReponse: ligne),
                    Column(
                      children: subsLignes[ligne]!.map((sub) {
                        return LigneSub(sub: sub);
                      }).toList(),
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey[300],
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20, top: 5, bottom: 10),
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
                      color: AppColor.blue,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            height: 2,
            color: Colors.grey,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
          ),
          reponse.commentaire != ""
              ? Container(
                  margin: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          reponse.commentaire ?? "",
                          style: TextStyle(
                              height: 1.2, fontStyle: FontStyle.italic),
                        ),
                      )
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "~ Prompt rétablissement à vous ! ~",
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: AppColor.green,
                    fontSize: 12),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: InkWell(
                  onTap: () {
                    UrlLauncher.launchUrl("tel://${officine.contact}" as Uri);
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColor.blue, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
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
                        border: Border.all(color: AppColor.blue, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
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
                        border: Border.all(color: AppColor.blue, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
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
                        border: Border.all(color: AppColor.blue, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(
                      Icons.route_outlined,
                      size: 24,
                      color: AppColor.blue,
                    ),
                  ),
                ),
              ),
              (reponse.demande!.demande!.isSatisfied ?? false)
                  ? Container(
                      child: InkWell(
                        onTap: () {
                          demandeController
                              .satisfiedDemande(reponse.demande!.demande!);
                          Get.dialog(FelicitationScreen(
                            text:
                                "Merci d'avoir utiliser iPi pour votre recherche. \n Nous vous souhaitons prompt rétablissement et à très bientôt !!!",
                          ));
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                              color: AppColor.blue,
                              border:
                                  Border.all(color: AppColor.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          child: Text(
                            "Je suis satisfait !",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Container(),
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
