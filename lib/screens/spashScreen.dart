import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/introScreen.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/myLogo.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  late Timer timer;

  @override
  void initState() {
    timer = Timer(Duration(milliseconds: 3000), () {
      getPosition();
      checkUser();
      getDatas();
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  Future<void> checkUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("produitsSelected");
    await prefs.remove("produitsIDSelected");

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

  Future<void> getPosition() async {
    Position? position;
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      position = await Geolocator.getLastKnownPosition();
      print("L'utilisateur a refusé l'accès à la localisation");
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    await sharedPreferencesService.init();
    await sharedPreferencesService.setString(
        'lat', position!.latitude.toString());
    await sharedPreferencesService.setString(
        'lon', position!.longitude.toString());
  }

  Future<void> getDatas() {}

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
            ))
      ]),
    );
  }
}
