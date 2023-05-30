import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:lottie/lottie.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/introScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/helper.dart';

class LoaderScreen extends StatefulWidget {
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 100),
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      color: Colors.white.withOpacity(0.4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Lottie.asset("assets/lotties/search.json",
                    width: Helper.getScreenWidth(context) * 0.8),
                Lottie.asset("assets/lotties/loading.json",
                    width: Helper.getScreenWidth(context) * 0.6),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "IPI recherche les pharmacies ...",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}
