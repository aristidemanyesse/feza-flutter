import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/utils/helper.dart';

class MapMinPharmaciePopup extends StatelessWidget {
  final Marker marker;
  final OfficineModel officine;
  final String ratio;
  final String distance;

  MapMinPharmaciePopup(
      {required this.marker,
      required this.officine,
      required this.ratio,
      required this.distance,
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
    return Card(
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Image.asset(
                Helper.getAssetName("pharma.png", "icons"),
                width: 35,
              ),
            ),
            _cardDescription(context),
          ],
        ),
      ),
    );
  }

  Widget _cardDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        constraints: const BoxConstraints(minWidth: 100, maxWidth: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              officine.name!,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Text(
              officine.localisation ?? "",
              style: const TextStyle(fontSize: 12.0),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 2.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  distance,
                  style: const TextStyle(fontSize: 13.0),
                ),
                Text(
                  ratio,
                  style: const TextStyle(fontSize: 13.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
