import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/screens/loginScreen.dart';
import 'package:ipi/widgets/myLogo.dart';
import 'package:lottie/lottie.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class Intro3 extends StatelessWidget {
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Economise ton temps et ton argent !",
                  style: Helper.getTheme(context)
                      .headlineLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 27),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Toi-même tu sias !!!",
                  textAlign: TextAlign.left,
                  style: TextStyle(height: 1.5, color: AppColor.primary),
                ),
              ],
            ),
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
                  SizedBox(
                    height: 45,
                    width: Helper.getScreenWidth(context) * 0.7,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(LandingScreen.routeName);
                        },
                        child: Text(
                          "Je suis prêt !",
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
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
