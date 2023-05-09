import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/widgets/mapPopupPin.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/widgets/mapPin.dart';
import 'package:yebhofon/widgets/pharmacieItemCard.dart';
import 'package:yebhofon/widgets/searchedMedicamentListDialog.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import '../screens/medicamentScreen.dart';

class SearchPage extends StatelessWidget {
  static const routeName = "/searchPage";
  final PopupController _popupLayerController = PopupController();

  List<Marker> allMarkers = [
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.260298, -3.9522842),
      builder: (context) => PharmacieMapPin(),
    ),
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.254743, -3.943766),
      builder: (context) => PharmacieMapPin(),
    ),
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.271238, -3.923166),
      builder: (context) => PharmacieMapPin(),
    ),
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.266580, -3.953679),
      builder: (context) => PharmacieMapPin(),
    ),
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.255661, -3.955900),
      builder: (context) => PharmacieMapPin(),
    ),
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.276238, -3.977974),
      builder: (context) => PharmacieMapPin(),
    ),
    Marker(
      width: 45,
      height: 45,
      point: LatLng(5.301877, -3.960122),
      builder: (context) => PharmacieMapPin(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Helper.getScreenHeight(context) * 0.7,
                      child: FlutterMap(
                        options: MapOptions(
                          center: LatLng(5.25, -3.95),
                          zoom: 14,
                          onTap: (_, __) =>
                              _popupLayerController.hideAllPopups(),
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName:
                                'dev.fleaflet.flutter_map.example',
                          ),
                          MarkerLayer(markers: allMarkers),
                          PopupMarkerLayerWidget(
                            options: PopupMarkerLayerOptions(
                              popupController: _popupLayerController,
                              markers: allMarkers,
                              markerRotateAlignment:
                                  PopupMarkerLayerOptions.rotationAlignmentFor(
                                      AnchorAlign.top),
                              popupBuilder:
                                  (BuildContext context, Marker marker) =>
                                      ExamplePopup(marker),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: Helper.getScreenHeight(context) * 0.2,
                      width: Helper.getScreenWidth(context),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.4],
                          colors: [
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.0),
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                        child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return SearchedMedicamentListDialog();
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 10),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(
                                    "Liste des médicaments (5)",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        height: Helper.getScreenHeight(context) * 0.45,
                      ),
                      Container(
                        height: Helper.getScreenHeight(context) * 0.4,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 5),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Text("Circonscription"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: DropdownButtonHideUnderline(
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
                                          padding: EdgeInsets.only(left: 10),
                                          child: Image.asset(
                                            Helper.getAssetName(
                                                "dropdown_filled.png",
                                                "virtual"),
                                          ),
                                        ),
                                        style: Helper.getTheme(context)
                                            .headlineMedium
                                            ?.copyWith(fontSize: 16),
                                        onChanged: (_) {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 10,
                              color: Colors.grey.shade300,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 2),
                            ),
                            Expanded(
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                MedicamentScreen.routeName);
                                          },
                                          child: PharmacieItemCard(
                                              name: "Pharmacie Eloma",
                                              lieu:
                                                  "Vridi canal, carrefour canal",
                                              circonscription: "Port-Bouet",
                                              distance: "900 m",
                                              ratio: "5/5"),
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 3),
                                          child: Divider(
                                            color: AppColor.placeholder,
                                            thickness: 1.5,
                                          ),
                                        ),
                                        PharmacieItemCard(
                                            name: "Pharmacie Sainte Barita",
                                            lieu: "Derrière wharf, casier",
                                            circonscription: "Port-Bouet",
                                            distance: "9 km",
                                            ratio: "4/5"),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 3),
                                          child: Divider(
                                            color: AppColor.placeholder,
                                            thickness: 1.5,
                                          ),
                                        ),
                                        PharmacieItemCard(
                                            name: "Pharmacie du soleil",
                                            lieu:
                                                "marché centre, face à mairie",
                                            circonscription: "Marcory",
                                            distance: "1.2 km",
                                            ratio: "2/5"),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 3),
                                          child: Divider(
                                            color: AppColor.placeholder,
                                            thickness: 1.5,
                                          ),
                                        ),
                                        PharmacieItemCard(
                                            name: "Pharmacie BBLeau",
                                            lieu:
                                                "marché centre, face à mairie",
                                            circonscription: "Treichville",
                                            distance: "25 km",
                                            ratio: "2/5"),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        child: Text(
                          "5 pharmacies trouvées",
                          style: TextStyle(
                              color: AppColor.green,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
