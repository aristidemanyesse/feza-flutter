import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import '../utils/helper.dart';

class AvialableMedicamentListDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Helper.getScreenHeight(context) * 0.6,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Colors.white.withOpacity(0.85)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Image.asset(
                      Helper.getAssetName("pharma.png", "icons"),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "Pharmacie Santé pour tous".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            height: 1.3,
                            color: Colors.green.shade900),
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Vridic cité, derriere le marché",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Port-bouet, à 900 m",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                " Ouvert",
                                style: TextStyle(
                                  color: AppColor.blue,
                                  fontSize: 12,
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "4/5",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.blue,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Ligne(title: "Paracetamol 500mg", active: true),
                        Ligne(title: "Panadol Advence 500mg", active: true),
                        Ligne(title: "Toussifan Verfec", active: true),
                        Ligne(title: "Novalgin 3000", active: false),
                        Ligne(title: "Artefan 40/480", active: true),
                        Ligne(title: "Test de grossesse", active: false),
                        Ligne(title: "Aspegic 1000mg", active: true),
                        Ligne(title: "Amoxiline 1000mg", active: false),
                        Ligne(
                            title: "Clamoxyl Enfant/Nourrisson", active: false),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: Helper.getScreenWidth(context) * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white54,
                      ),
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "OK, j'ai compris !",
                            style: TextStyle(fontSize: 13),
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

class Ligne extends StatelessWidget {
  final String title;
  final bool active;

  Ligne({required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(active ? Icons.check_circle_outline : Icons.close,
              size: 15, color: active ? AppColor.green : Colors.red),
          SizedBox(
            width: 20,
          ),
          Text(
            this.title,
            style: TextStyle(
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              fontSize: 12.5,
              color: active ? Colors.black : Colors.grey,
              decoration:
                  active ? TextDecoration.none : TextDecoration.lineThrough,
              decorationThickness: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
