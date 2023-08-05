import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/components/myLogo.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/introScreen.dart';

import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final box = GetStorage();
  UtilisateurController _controller = Get.find();

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      if (_controller.currentUser.value != null) {
        Get.to(HomeScreen());
      } else {
        box.erase();
        UtilisateurProvider.getUniqID()
            .then((value) => box.write("imei", value));
        Get.to(IntroScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
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
        Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          color: Colors.white.withOpacity(0.8),
        ),
        MyLogo(),
        Positioned(
          bottom: 50,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 15,
                ),
                Text("Veuillez patienter...")
              ],
            ),
          ),
        )
      ]),
    );
  }
}
