import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/myLogo.dart';
import 'package:ipi/screens/CGU.dart';
import 'package:ipi/screens/loginScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingScreen> createState() => LandingScreenState();
}

class LandingScreenState extends State<LandingScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
          backgroundColor: Color.fromARGB(255, 244, 242, 240),
          body: Stack(
            children: [
              Opacity(
                opacity: 0.1,
                child: Container(
                  width: Helper.getScreenWidth(context),
                  height: Helper.getScreenHeight(context),
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.asset(
                          Helper.getAssetName("landing.jpg", "bg"),
                          fit: BoxFit.scaleDown,
                          repeat: ImageRepeat.repeatY,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: Helper.getScreenWidth(context),
                height: Helper.getScreenHeight(context),
                child: Column(
                  children: [
                    Container(
                      height: Helper.getScreenHeight(context) * 0.15,
                    ),
                    Text(
                      "iPi",
                      textAlign: TextAlign.center,
                      style: Helper.getTheme(context)
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 27),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "ici Pharmacies ivoiriennes",
                      textAlign: TextAlign.center,
                      style: Helper.getTheme(context)
                          .headlineLarge
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    MyLogo(
                      height: 150,
                      width: 150,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(
                                "Recherchez parmi plus de 1000 médicaments, produits et services sur toute l'étendue du territoire ivoirien",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    height: 1.5, color: AppColor.primary),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _isChecked
                                    ? () {
                                        Get.to(LoginScreen());
                                      }
                                    : null,
                                child: Text("Commençons !"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Row(
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
                          GestureDetector(
                            onTap: () {
                              Get.dialog(CGU());
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Je confirme avoir lu et approuvé  ',
                                    style: TextStyle(color: AppColor.primary)),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'la politique de confidentialité de iPi',
                                  style: TextStyle(color: AppColor.blue),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 20,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("iPi @ Copyright 2023"),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
