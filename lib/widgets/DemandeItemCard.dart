import 'package:flutter/material.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/widgets/avialableMedicamentListDialog.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class DemandeItemCard extends StatelessWidget {
  final DemandeModel demande;

  DemandeItemCard(this.demande);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("pharma.png", "icons"),
                      width: 15,
                      height: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      demande.createAt ?? "",
                      style: Helper.getTheme(context)
                          .headlineMedium
                          ?.copyWith(color: AppColor.primary, fontSize: 14),
                    ),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "",
                            style: TextStyle(fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "15 km",
                          ),
                          Text(
                            " Ouvert",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColor.blue,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "0/5",
                                  style: TextStyle(
                                    fontSize: 13,
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
                )
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Container(
              width: 35,
              height: 45,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.secondary, width: 2)),
              child: Icon(
                Icons.format_list_bulleted,
                size: 30,
                color: AppColor.secondary,
              ),
            ),
          ),
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Text("");
                });
          },
        )
      ],
    );
  }
}
