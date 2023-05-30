import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/utils/helper.dart';

class MapMinPharmaciePopup extends StatelessWidget {
  final Marker marker;
  final OfficineModel officine;
  final String ratio;
  final String distance;
  final Function ittineraireFunction;

  MapMinPharmaciePopup(
      {required this.marker,
      required this.officine,
      required this.ratio,
      required this.distance,
      required this.ittineraireFunction,
      Key? key})
      : super(key: key);

  final List<IconData> _icons = [
    Icons.star_border,
    Icons.star_half,
    Icons.star
  ];
  int _currentIcon = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minWidth: 100,
        maxWidth: 300,
      ),
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.85),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.only(right: 7, left: 7, top: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Image.asset(
                  Helper.getAssetName("pharma.png", "icons"),
                  width: 35,
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      officine.name!,
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
                    Text(
                      officine.localisation ?? "...",
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  distance,
                  style: const TextStyle(fontSize: 14.0),
                ),
                Text(
                  ratio,
                  style: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blue),
                ),
                TextButton(
                    onPressed: () {
                      ittineraireFunction();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.route_outlined),
                        Text(
                          "Ittinéraire",
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
