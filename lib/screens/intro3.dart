import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/screens/CGU.dart';
import 'package:ipi/screens/loginScreen.dart';
import 'package:lottie/lottie.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class Intro3 extends StatefulWidget {
  Intro3({
    Key? key,
  }) : super(key: key);

  @override
  State<Intro3> createState() => Intro3State();
}

class Intro3State extends State<Intro3> {
  bool _isChecked = false;

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
                  style: Helper.getTheme(context).headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Color.fromARGB(255, 21, 67, 111)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Toi-même tu sais !!!",
                  textAlign: TextAlign.left,
                  style: TextStyle(height: 1.5, color: AppColor.primary),
                ),
              ],
            ),
          ),
          Expanded(
              child: Center(
            child: Lottie.asset("assets/lotties/economie.json",
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
                          Get.off(LoginScreen());
                        },
                        child: Text(
                          "Je suis prêt !",
                          style: TextStyle(fontSize: 15),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            _isChecked = newValue ?? false;
                          });
                        },
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Je confirme avoir lu et approuvé  ',
                              style: TextStyle(color: AppColor.primary)),
                          SizedBox(
                            height: 3,
                          ),
                          GestureDetector(
                            onTap: _isChecked
                                ? () {
                                    Get.dialog(CGU());
                                  }
                                : null,
                            child: Text(
                              'la politique de confidentialité de IPI',
                              style: TextStyle(color: AppColor.blue),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
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
