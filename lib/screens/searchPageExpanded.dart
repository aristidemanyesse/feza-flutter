import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/OfficineModel.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/searchPageBackground.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/pharmacieItemCard.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';

class SearchPageExpanded extends StatefulWidget {
  static const routeName = "/searchPageExpanded";
  final GlobalKey backgroundKey;
  final List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines;
  final Map<OfficineModel, int> ratioTableaux;
  final Map<OfficineModel, String> distanceTableaux;
  final List<ProduitModel> initialProduits;
  const SearchPageExpanded(
      {Key? key,
      required this.backgroundKey,
      required this.tableauxOfficines,
      required this.ratioTableaux,
      required this.initialProduits,
      required this.distanceTableaux})
      : super(key: key);

  @override
  State<SearchPageExpanded> createState() => _SearchPageExpandedState();
}

class _SearchPageExpandedState extends State<SearchPageExpanded> {
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
  void didUpdateWidget(covariant SearchPageExpanded oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tableauxOfficines.isNotEmpty) {
      for (var item in widget.tableauxOfficines) {
        containerKeys[item.keys.first.id!] = GlobalKey();
        setState(() {});
      }
    }
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
              child: widget.tableauxOfficines.length > 0
                  ? SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        children: widget.tableauxOfficines.map((element) {
                          if (element.isEmpty) {
                            return Container();
                          }
                          OfficineModel officine = element.keys.first;
                          List<ProduitModel> produits =
                              element[element.keys.first] ?? [];
                          return GestureDetector(
                            onTap: () {
                              SearchPageBackgroundState
                                  searchPageBackgroundState =
                                  widget.backgroundKey.currentState
                                      as SearchPageBackgroundState;
                              searchPageBackgroundState
                                  .targetMarker(officine.id);
                            },
                            child: Container(
                              key: containerKeys[officine.id],
                              color: Colors.transparent,
                              child: Column(
                                children: [
                                  PharmacieItemCard(
                                    officine: officine,
                                    produits: produits,
                                    initialProduits: widget.initialProduits,
                                    distance:
                                        widget.distanceTableaux[officine] ?? "",
                                    ratio: widget.ratioTableaux[officine]
                                        .toString(),
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
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : Container()),
          widget.tableauxOfficines.length > 0
              ? Container(
                  margin: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.tableauxOfficines.length} pharmacies de garde trouvées",
                    style: TextStyle(
                        color: AppColor.green, fontWeight: FontWeight.bold),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
