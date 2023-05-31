import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/pharmacieItemCard2.dart';
import '../screens/medicamentScreen.dart';

class PharmaciesGardeExpanded extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Column(
        children: [
          Indicator(),
          const SizedBox(height: 8),
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
                        Helper.getAssetName("dropdown_filled.png", "bg"),
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
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(MedicamentScreen.routeName);
                  },
                  child: PharmacieItemCard2(
                    name: "Pharmacie Eloma",
                    lieu: "Vridi canal, carrefour canal",
                    circonscription: "Port-Bouet",
                    distance: "900 m",
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie Sainte Barita",
                  lieu: "Derrière wharf, casier",
                  circonscription: "Port-Bouet",
                  distance: "9 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie du soleil",
                  lieu: "en face de la cité verte",
                  circonscription: "Marcory",
                  distance: "1.2 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie BBLeau",
                  lieu: "New belle, carrefour chien",
                  circonscription: "Treichville",
                  distance: "25 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie Deloacder",
                  lieu: "marché centre, face à mairie",
                  circonscription: "Treichville",
                  distance: "25 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie BBLeau",
                  lieu: "New belle, carrefour chien",
                  circonscription: "Treichville",
                  distance: "25 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie Deloacder",
                  lieu: "marché centre, face à mairie",
                  circonscription: "Treichville",
                  distance: "25 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie BBLeau",
                  lieu: "New belle, carrefour chien",
                  circonscription: "Treichville",
                  distance: "25 km",
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 3),
                  child: Divider(
                    color: AppColor.placeholder,
                    thickness: 1.5,
                  ),
                ),
                PharmacieItemCard2(
                  name: "Pharmacie Deloacder",
                  lieu: "marché centre, face à mairie",
                  circonscription: "Treichville",
                  distance: "25 km",
                ),
              ],
            ),
          )),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              "5 pharmacies de garde trouvées",
              style:
                  TextStyle(color: AppColor.green, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
