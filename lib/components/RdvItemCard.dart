import 'package:flutter/material.dart';
import 'package:ipi/models/RdvLigneReponseModel.dart';
import 'package:marquee_widget/marquee_widget.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class RdvItemCard extends StatelessWidget {
  final RdvLigneReponseModel rdv;

  RdvItemCard({required this.rdv});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              Helper.getAssetName("pharma.png", "icons"),
              width: 15,
              height: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "${rdv.ligne!.reponse!.demande!.officine!.name}",
              style: TextStyle(
                fontSize: 13,
                color: AppColor.green,
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network(
              //   this.image,
              //   width: 60,
              //   height: 35,
              // ),
              // SizedBox(
              //   width: 5,
              // ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(
                        child: Text(
                          rdv.ligne!.produit!.name,
                          style: Helper.getTheme(context)
                              .headlineMedium
                              ?.copyWith(color: AppColor.primary, fontSize: 14),
                        ),
                        direction: Axis.horizontal,
                        textDirection: TextDirection.ltr,
                        animationDuration: Duration(seconds: 4),
                        backDuration: Duration(milliseconds: 5000),
                        pauseDuration: Duration(milliseconds: 1000),
                        directionMarguee: DirectionMarguee.oneDirection,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        rdv.ligne!.produit!.forme ?? "",
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: AppColor.blue.withOpacity(0.6), width: 2)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.3,
                      child: Icon(
                        Icons.calendar_month,
                        size: 27,
                        color: AppColor.blue,
                      ),
                    ),
                    Center(
                        child: Text(
                      "${rdv.days}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 2,
        )
      ],
    );
  }
}
