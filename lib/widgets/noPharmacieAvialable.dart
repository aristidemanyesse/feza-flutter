import 'dart:io';

import 'package:flutter/material.dart';
import '../utils/helper.dart';

class NoPharmacieAvialable extends StatelessWidget {
  NoPharmacieAvialable();

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 180,
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
                      height: 12,
                    ),
                    Container(
                      child: Text(
                        "Nous n'avons pas trouvé de pharmacie à proximité",
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
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Ok, revenir !",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   height: 35,
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(30),
                    //     color: Colors.transparent,
                    //   ),
                    //   child: TextButton(
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: Text(
                    //         "Non, Annuler",
                    //         style: TextStyle(fontSize: 17),
                    //       )),
                    // )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
