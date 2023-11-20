import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:get/get.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/RdvLigneReponseModel.dart';
import 'package:ipi/models/SubsLigneReponseModel.dart';
import 'package:ipi/webservice/apiservice.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:intl/date_symbol_data_local.dart';

class Ligne extends StatefulWidget {
  final LigneReponseModel ligneReponse;
  final RdvLigneReponseModel rdv;
  Ligne({required this.ligneReponse, required this.rdv});

  @override
  _LigneState createState() => new _LigneState();
}

class _LigneState extends State<Ligne> {
  DateFormat? dateFormat;
  DateFormat? timeFormat;

  ReponseController controller = Get.find();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('fr');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset(
              "assets/images/icons/med.jpg",
              width: 30,
              height: 30,
            ),
            // Image.network(
            //   ApiService.BASE_URL + widget.ligneReponse.produit!.image!,
            //   width: 20,
            //   height: 20,
            // ),
          ),
          SizedBox(
            width: 5,
          ),
          // Image.network(
          //   ApiService.BASE_URL + ligneReponse.produit!.image!,
          //   width: 50,
          //   height: 30,
          // ),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Marquee(
                            direction: Axis.horizontal,
                            animationDuration: Duration(seconds: 3),
                            backDuration: Duration(milliseconds: 5000),
                            pauseDuration: Duration(milliseconds: 1000),
                            directionMarguee: DirectionMarguee.oneDirection,
                            child: Text(
                              widget.ligneReponse.produit!.name,
                              style: TextStyle(
                                fontWeight: widget.ligneReponse.status ?? false
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                                fontSize: 12,
                                color: widget.ligneReponse.status ?? false
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.ligneReponse.produit!.forme ?? "",
                            style: TextStyle(
                              fontSize: 11,
                              fontStyle: FontStyle.italic,
                              color: widget.ligneReponse.status ?? false
                                  ? Colors.black
                                  : Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          widget.ligneReponse.status != true &&
                                  !(widget.rdv.id != null &&
                                      widget.rdv.days! > 0)
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "pas disponible",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontStyle: FontStyle.italic,
                                              color: Colors.blueGrey,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                widget.rdv.id != null && widget.rdv.days! > 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "sera disponible le ${dateFormat!.format(DateTime.parse(widget.rdv.createdAt ?? "").add(Duration(days: widget.rdv.days ?? 0)))}",
                            style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    : Container(),
                widget.ligneReponse.status ?? false
                    ? Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Prix: ",
                              style: TextStyle(fontSize: 11),
                            ),
                            Text(
                              "${widget.ligneReponse.price} Fcfa",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "x${widget.ligneReponse.quantite}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${widget.ligneReponse.price! * widget.ligneReponse.quantite!.toInt()} Fcfa",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      )
                    : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LigneSub extends StatelessWidget {
  final SubsLigneReponseModel sub;
  LigneSub({required this.sub});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 25),
      margin: EdgeInsets.only(bottom: 7, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Equivalent:",
            style: TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 5,
          ),
          // Image.network(
          //   ApiService.BASE_URL + sub.produit!.image!,
          //   width: 50,
          //   height: 30,
          // ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Marquee(
                  direction: Axis.horizontal,
                  animationDuration: Duration(seconds: 3),
                  backDuration: Duration(milliseconds: 5000),
                  pauseDuration: Duration(milliseconds: 1000),
                  directionMarguee: DirectionMarguee.oneDirection,
                  child: Text(
                    sub.produit!.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  sub.produit!.forme ?? "",
                  style: TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Prix: ",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "${sub.price} Fcfa",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "x${sub.quantite}",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${sub.price! * sub.quantite!.toInt()} Fcfa",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
