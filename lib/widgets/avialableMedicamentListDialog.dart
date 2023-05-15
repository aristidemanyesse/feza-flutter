import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/widgets/ligneProduitAvialable.dart';
import '../utils/helper.dart';

class AvialableMedicamentListDialog extends StatelessWidget {
  final OfficineModel officine;
  final List<ProduitModel> initialProduits;
  final List<ProduitModel> produits;
  final String ratio;

  AvialableMedicamentListDialog(
      {required this.initialProduits,
      required this.produits,
      required this.officine,
      required this.ratio});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Helper.getScreenHeight(context) * 0.5,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
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
                        officine.name!.toUpperCase(),
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
                                officine.localisation!,
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
                                "${officine.circonscription!.name}, à 900 m",
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
                                      ratio,
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
                      children: initialProduits.map((item) {
                        bool test = false;
                        for (var i in produits) {
                          if (i.id == item.id) {
                            test = true;
                            break;
                          }
                        }
                        return Ligne(title: item.name, active: test);
                      }).toList(),
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
