import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:ipi/screens/loginScreen.dart';
import 'package:ipi/widgets/myLogo.dart';
import 'package:lottie/lottie.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class Intro1 extends StatelessWidget {
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                "Où trouver le médicament que je cherche ...",
                style: Helper.getTheme(context)
                    .headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 27),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Avec IPI, trouves en un clic les pharmacies à proximité qui ont le médicament que tu recherches !",
                textAlign: TextAlign.left,
                style: TextStyle(height: 1.5, color: AppColor.primary),
              ),
            ]),
          ),
          Expanded(
              child: Center(
            child: Lottie.asset("assets/lotties/search.json",
                height: Helper.getScreenHeight(context) * 0.7,
                width: Helper.getScreenWidth(context) * 0.9),
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
