import 'package:flutter/material.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:latlong2/latlong.dart';
import 'package:ipi/utils/helper.dart';

class CustomMyMarker {
  final LatLng point;
  final Officine officine;

  CustomMyMarker(this.point, this.officine);
}

class PharmacieMapPin extends StatelessWidget {
  PharmacieMapPin();
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Helper.getAssetName("pharmacy.png", "icons"),
    );
  }
}

class MyPinInMap extends StatelessWidget {
  MyPinInMap();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Helper.getAssetName("icon_me.png", "icons"),
    );
  }
}
