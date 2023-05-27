import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/introScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 3000), () {
      checkUser();
    });
    super.initState();
  }

  Future<void> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    if (userId != null) {
      List<UtilisateurModel> users =
          await UtilisateurProvider.all({"id": userId, "imei": uniq});
      if (users.isEmpty) {
        Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
      } else {
        UtilisateurModel user = users[0];
        Navigator.of(context)
            .pushNamed(HomeScreen.routeName, arguments: {"user": user});
      }
    } else {
      Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                Helper.getAssetName("splashIcon.png", "virtual"),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                Helper.getAssetName("MealMonkeyLogo.png", "virtual"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
