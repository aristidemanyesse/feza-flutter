import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/pharmacieItemCard2.dart';
import '../screens/medicamentScreen.dart';

class PharmaciesGardeExpanded extends StatefulWidget {
  static const routeName = "/searchPageExpanded";
  final GlobalKey backgroundKey;
  final Map<OfficineModel, String> distanceTableaux;

  const PharmaciesGardeExpanded(
      {Key? key, required this.backgroundKey, required this.distanceTableaux})
      : super(key: key);

  @override
  State<PharmaciesGardeExpanded> createState() =>
      _PharmaciesGardeExpandedState();
}

class _PharmaciesGardeExpandedState extends State<PharmaciesGardeExpanded> {
  late UtilisateurModel? user;
  late ScrollController _scrollController = ScrollController();
  late Map<String, GlobalKey> containerKeys = {};
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant PharmaciesGardeExpanded oldWidget) {
    super.didUpdateWidget(oldWidget);
    // if (widget.tableauxOfficines.isNotEmpty) {
    //   for (var item in widget.tableauxOfficines) {
    //     containerKeys[item.keys.first.id!] = GlobalKey();
    //     setState(() {});
    //   }
    // }
    sharedPreferencesService
        .watchString('scrollToContainerIndex')
        .listen((value) async {
      String text =
          await sharedPreferencesService.getString('scrollToContainerIndex');
      _scrollToContainer(text);
      setState(() {});
    });
  }

  Future<void> getData() async {
    await sharedPreferencesService.init();
    String? userId = await sharedPreferencesService.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    setState(() {
      user = users[0];
    });
  }

  void _scrollToContainer(String containerKey) {
    GlobalKey? key = containerKeys[containerKey];
    final RenderBox containerRenderBox =
        key?.currentContext!.findRenderObject() as RenderBox;
    final containerOffset = containerRenderBox.localToGlobal(Offset.zero);

    _scrollController.animateTo(
      containerOffset.dy -
          (MediaQuery.of(context).size.height /
              2), // Décaler vers le milieu de la zone
      duration: const Duration(
          milliseconds: 500), // Durée de l'animation de défilement
      curve: Curves.easeInOut, // Courbe d'animation
    );
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
