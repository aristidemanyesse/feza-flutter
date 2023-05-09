import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/widgets/bounceAnimation.dart';
import 'package:yebhofon/widgets/indicator.dart';

class PharmaciesGardePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Circonscription"),
                    DropdownButtonHideUnderline(
                      child: SizedBox(
                        child: DropdownButton(
                          value: "Port-Bouet",
                          items: [
                            DropdownMenuItem(
                              child: Text("Port-Bouet"),
                              value: "Port-Bouet",
                            ),
                            DropdownMenuItem(
                              child: Text("Marcory"),
                              value: "Marcory",
                            ),
                            DropdownMenuItem(
                              child: Text("Koumassi"),
                              value: "Koumassi",
                            ),
                          ],
                          icon: Padding(
                            padding: EdgeInsets.only(left: 7),
                            child: Image.asset(
                              Helper.getAssetName(
                                  "dropdown_filled.png", "virtual"),
                            ),
                          ),
                          style: Helper.getTheme(context)
                              .headlineMedium
                              ?.copyWith(fontSize: 16),
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 5,
                  color: Colors.grey.shade300,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "5 pharmacies de garde trouvées",
                    style: TextStyle(
                        color: AppColor.green, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BounceAnimation(
                  duration: Duration(milliseconds: 500),
                  maxHeight: 25.0,
                  child: Indicator(),
                )
              ],
            ),
          ],
        ));
  }
}
