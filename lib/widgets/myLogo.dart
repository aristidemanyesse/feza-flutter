import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/utils/helper.dart';

class MyLogo extends StatelessWidget {
  late double width;
  late double height;
  MyLogo({this.width = 150, this.height = 150});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Image.asset(
        Helper.getAssetName("logo.png", "icons"),
        height: this.height,
        width: this.width,
      ),
    );
  }
}
