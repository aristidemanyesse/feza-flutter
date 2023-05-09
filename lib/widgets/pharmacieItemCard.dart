import 'package:flutter/material.dart';
import 'package:yebhofon/widgets/avialableMedicamentListDialog.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class PharmacieItemCard extends StatelessWidget {
  final String name;
  final String lieu;
  final String distance;
  final String ratio;
  final String circonscription;

  PharmacieItemCard(
      {required this.name,
      required this.lieu,
      required this.distance,
      required this.ratio,
      required this.circonscription});

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
                      name,
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
                            "$lieu",
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
                            "( $distance)",
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
                                  "$ratio ",
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
                return AvialableMedicamentListDialog();
              },
            );
          },
        )
      ],
    );
  }
}
