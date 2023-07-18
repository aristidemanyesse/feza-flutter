import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/introScreen.dart';
import 'package:ipi/widgets/pleaseWait.dart';

class ConfirmExitDialog extends StatelessWidget {
  ConfirmExitDialog();

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

  UtilisateurController controller = Get.find();
  final box = GetStorage();

  void deconnexion() async {
    Get.dialog(PleaseWait());
    controller.currentUser.value = null;
    box.erase();
    Get.reset();
    UtilisateurProvider.getUniqID().then((value) => box.write("imei", value));
    await Future.delayed(Duration(milliseconds: 3000));
    Get.back();
    Get.off(IntroScreen());
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
                        "Vous êtes sur le point de vous déconnecter, voulez-vous continuer ?",
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
                            deconnexion();
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
                            Get.back();
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
