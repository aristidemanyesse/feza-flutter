import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ipi/screens/introScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmExitDialog extends StatelessWidget {
  ConfirmExitDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 185,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.9)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "😩😟 Hhmmm !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            height: 1.3,
                            color: Colors.green.shade900),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Text(
                        "Voulez-vous vraiment quitter cettte application ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, height: 1.5, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {
                            exit(0);
                          },
                          child: Text(
                            "Oui",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Non, je reste",
                            style: TextStyle(fontSize: 15),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class DeconnexionDialog extends StatelessWidget {
  DeconnexionDialog();

  void deconnexion(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context).pushNamedAndRemoveUntil(
        IntroScreen.routeName, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.9)),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "Déconnexion !",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            height: 1.3,
                            color: Colors.green.shade900),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      child: Text(
                        "Vous êtes sur le point de vous deconnecter, voulez-vous continuer ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 15, height: 1.5, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {
                            deconnexion(context);
                          },
                          child: Text(
                            "Oui !",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Non, Annuler",
                            style: TextStyle(fontSize: 14),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
