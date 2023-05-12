import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/widgets/indicator.dart';
import 'package:yebhofon/widgets/pharmacieItemCard.dart';
import 'package:yebhofon/widgets/selectCirconscriptionBloc.dart';
import '../screens/medicamentScreen.dart';

class SearchPageExpanded extends StatefulWidget {
  static const routeName = "/searchPageExpanded";
  final List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines;
  final Map<OfficineModel, int> ratioTableaux;
  final List<ProduitModel> initialProduits;
  const SearchPageExpanded(
      {Key? key,
      required this.tableauxOfficines,
      required this.ratioTableaux,
      required this.initialProduits})
      : super(key: key);

  @override
  State<SearchPageExpanded> createState() => _SearchPageExpandedState();
}

class _SearchPageExpandedState extends State<SearchPageExpanded> {
  late UtilisateurModel? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    setState(() {
      user = users[0];
    });
  }

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
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Circonscription"),
              SelectCirconscriptionBloc(),
            ],
          ),
          const SizedBox(height: 15),
          Container(
            height: 5,
            color: Colors.grey.shade300,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 7),
          ),
          const SizedBox(height: 16),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: widget.tableauxOfficines.map((element) {
                OfficineModel officine = element.keys.first;
                List<ProduitModel> produits = element[element.keys.first]!;
                return Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MedicamentScreen.routeName);
                        },
                        child: PharmacieItemCard(
                          officine: officine,
                          produits: produits,
                          initialProduits: widget.initialProduits,
                          distance: "900 m",
                          ratio: widget.ratioTableaux[officine].toString(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 3),
                        child: Divider(
                          color: AppColor.placeholder,
                          thickness: 1.5,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          )),
          Container(
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: Text(
              "${widget.tableauxOfficines.length} pharmacies de garde trouvées",
              style:
                  TextStyle(color: AppColor.green, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
