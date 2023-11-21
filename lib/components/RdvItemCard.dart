import 'package:flutter/material.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:marquee_widget/marquee_widget.dart';
import "package:intl/intl.dart";
import '../const/colors.dart';
import '../utils/helper.dart';
import 'package:intl/date_symbol_data_local.dart';

class RdvItemCard extends StatefulWidget {
  final RdvLigneReponse rdv;
  final Officine officine;
  RdvItemCard({required this.rdv, required this.officine});

  @override
  _RdvItemCardState createState() => new _RdvItemCardState();
}

class _RdvItemCardState extends State<RdvItemCard> {
  DateFormat? dateFormat;
  DateFormat? timeFormat;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    dateFormat = new DateFormat.yMMMMd('fr');
  }

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
              "${widget.officine.name}",
              style: TextStyle(
                fontSize: 13,
                color: AppColor.green,
              ),
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 7),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/icons/med.jpg",
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Marquee(
                        child: Text(
                          widget.rdv.ligne!.produit!.name,
                          style: Helper.getTheme(context)
                              .headlineMedium
                              ?.copyWith(color: AppColor.primary, fontSize: 14),
                        ),
                        direction: Axis.horizontal,
                        animationDuration: Duration(seconds: 4),
                        backDuration: Duration(milliseconds: 5000),
                        pauseDuration: Duration(milliseconds: 1000),
                        directionMarguee: DirectionMarguee.oneDirection,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.rdv.ligne!.produit!.forme,
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "sera disponible à partir du ${dateFormat!.format(DateTime.parse(widget.rdv.createdAt).add(Duration(days: widget.rdv.days)))} ",
                            style: TextStyle(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          height: 2,
          thickness: 3,
        )
      ],
    );
  }
}

// ${f.format(DateTime.parse(rdv.createdAt ?? ""))} 