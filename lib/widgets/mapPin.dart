import 'package:flutter/material.dart';
import 'package:yebhofon/utils/helper.dart';

class PharmacieMapPin extends StatelessWidget {
  PharmacieMapPin();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Helper.getAssetName("pharmacie.png", "icons"),
    );
  }
}
