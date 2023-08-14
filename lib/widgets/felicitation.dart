import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:lottie/lottie.dart';

class FelicitationScreen extends StatefulWidget {
  String text = "";

  FelicitationScreen({required this.text});

  @override
  _FelicitationScreenState createState() => _FelicitationScreenState();
}

class _FelicitationScreenState extends State<FelicitationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: Helper.getScreenWidth(context),
            height: Helper.getScreenHeight(context),
            color: Colors.white.withOpacity(0.85),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Lottie.asset("assets/lotties/felicitation.json",
                    width: Helper.getScreenWidth(context) * 0.5),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: DefaultTextStyle(
                    child: Text(
                      widget.text,
                      textAlign: TextAlign.center,
                    ),
                    style: TextStyle(
                        height: 1.7,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: AppColor.blue)),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                          Get.to(HomeScreen());
                        },
                        child: Text(
                          "OK, j'ai compris",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: AppColor.blue),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.07,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
