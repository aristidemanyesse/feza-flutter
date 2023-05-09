import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class PharmacieItemCard2 extends StatelessWidget {
  final String name;
  final String lieu;
  final String distance;
  final String circonscription;

  PharmacieItemCard2(
      {required this.name,
      required this.lieu,
      required this.distance,
      required this.circonscription});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
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
                    height: 3.5,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "$lieu",
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3.5,
                        ),
                        Text(
                          "+225 01 02 030 405  / +225 01 02 030 405",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 11),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "($distance)",
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Ouvert",
              style: TextStyle(
                  color: AppColor.blue,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        )
      ],
    );
  }
}
