import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/LigneReponseModel.dart';
import 'package:ipi/models/SubsLigneReponseModel.dart';
import 'package:marquee_widget/marquee_widget.dart';

class Ligne extends StatelessWidget {
  final LigneReponseModel ligneReponse;
  Ligne({required this.ligneReponse});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ligneReponse.status ?? false
              ? Icon(Icons.check_circle_outline,
                  size: 20, color: AppColor.green)
              : Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 15,
                  ),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Marquee(
                  direction: Axis.horizontal,
                  textDirection: TextDirection.ltr,
                  animationDuration: Duration(seconds: 3),
                  backDuration: Duration(milliseconds: 5000),
                  pauseDuration: Duration(milliseconds: 1000),
                  directionMarguee: DirectionMarguee.oneDirection,
                  child: Text(
                    ligneReponse.produit!.name,
                    style: TextStyle(
                      fontWeight: ligneReponse.status ?? false
                          ? FontWeight.w600
                          : FontWeight.normal,
                      fontSize: 12,
                      color: ligneReponse.status ?? false
                          ? Colors.black
                          : Colors.grey,
                      decoration: ligneReponse.status ?? false
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  ligneReponse.produit!.forme ?? "",
                  style: TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: ligneReponse.status ?? false
                        ? Colors.black
                        : Colors.grey,
                    decoration: ligneReponse.status ?? false
                        ? TextDecoration.none
                        : TextDecoration.lineThrough,
                    decorationThickness: 2.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5,
                ),
                ligneReponse.status ?? false
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
                              "${ligneReponse.price} Fcfa",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "x${ligneReponse.quantite}",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "${ligneReponse.price! * ligneReponse.quantite!.toInt()} Fcfa",
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
      margin: EdgeInsets.only(bottom: 7, top: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Substitut:",
            style: TextStyle(
                fontSize: 12,
                decoration: TextDecoration.underline,
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
                  textDirection: TextDirection.ltr,
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
                  height: 3,
                ),
                Text(
                  sub.produit!.forme ?? "",
                  style: TextStyle(
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 3,
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
