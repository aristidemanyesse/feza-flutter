import 'package:flutter/material.dart';
import 'package:yebhofon/utils/helper.dart';

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
      Helper.getAssetName("loc.png", "icons"),
    );
  }
}
