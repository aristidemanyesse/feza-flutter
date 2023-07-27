import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/webservice/apiservice.dart';
import 'package:marquee_widget/marquee_widget.dart';

class Ligne extends StatelessWidget {
  final ProduitModel produit;
  final bool active;
  final int price;

  Ligne({required this.produit, required this.active, required this.price});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(active ? Icons.check_circle_outline : Icons.close,
              size: 20, color: active ? AppColor.green : Colors.red),
          SizedBox(
            width: 5,
          ),
          Image.network(
            ApiService.BASE_URL + produit.image!,
            width: 50,
            height: 30,
          ),
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
                    produit.name,
                    style: TextStyle(
                      fontWeight: active ? FontWeight.w500 : FontWeight.normal,
                      fontSize: 12,
                      color: active ? Colors.black : Colors.grey,
                      decoration: active
                          ? TextDecoration.none
                          : TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  produit.forme ?? "",
                  style: TextStyle(
                      fontSize: 11,
                      color: Colors.black,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Prix moy: ",
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        "${price} Fcfa",
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
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
