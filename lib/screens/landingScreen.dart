import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:yebhofon/screens/loginScreen.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class LandingScreen extends StatelessWidget {
  static const routeName = "/landingScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: CsShadow(
              clipper: CustomClipperAppBar(),
              shadow: BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(0, 15),
                  blurRadius: 5.0,
                  spreadRadius: 4),
              child: Container(
                  width: double.infinity,
                  height: Helper.getScreenHeight(context) * 0.45,
                  decoration: ShapeDecoration(
                    color: AppColor.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    Helper.getAssetName("login_bg.png", "virtual"),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              Helper.getAssetName("MealMonkeyLogo.png", "virtual"),
              height: 200,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: Helper.getScreenHeight(context) * 0.35,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Flexible(
                    child: Text(
                      "Recherchez parmi plus de 1000 médicaments, produits et services sur toute l'étendue du territoire ivoirien",
                      textAlign: TextAlign.center,
                      style: TextStyle(height: 1.5, color: AppColor.primary),
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
                      },
                      child: Text("Commençons !"),
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Yebhofon @ Copyright 2023"),
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
    ));
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
