import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class Intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Container(
            margin: EdgeInsets.only(right: Helper.getScreenWidth(context) / 6),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Recherche simple et troooop facile !",
                  style: Helper.getTheme(context).headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Color.fromARGB(255, 21, 67, 111)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Scanne le codebarre du médicament pour le rechercher instantanement...",
                  textAlign: TextAlign.left,
                  style: TextStyle(height: 1.5, color: AppColor.primary),
                ),
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Lottie.asset("assets/lotties/barcode.json",
                height: Helper.getScreenHeight(context) * 0.6,
                width: Helper.getScreenWidth(context) * 0.8),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("IPI @ Copyright 2023"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
