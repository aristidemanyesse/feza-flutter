import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/widgets/mapPin.dart';
import 'package:yebhofon/widgets/mapPopupPin.dart';
import 'package:yebhofon/widgets/searchedMedicamentListDialog.dart';
import 'package:flutter_map/plugin_api.dart';

class SearchPageBackground extends StatefulWidget {
  final _pageBackgroundKey = GlobalKey<SearchPageBackgroundState>();

  static const routeName = "/SearchPageBackground";
  final List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines;
  final List<ProduitModel> initialProduits;
  late List<double> position = [0, 0];

  SearchPageBackground(
      {Key? key,
      required this.tableauxOfficines,
      required this.initialProduits,
      required this.position})
      : super(key: key);

  @override
  State<SearchPageBackground> createState() => SearchPageBackgroundState();
}

class SearchPageBackgroundState extends State<SearchPageBackground> {
  MapController mapController = MapController();
  final PopupController _popupLayerController = PopupController();
  LatLng center = LatLng(5.260298, -3.9522842);

  List<CustomMyMarker> allMarkers = [];
  List<LatLng> allMarkersLatLng = [];

  Future<void> getPosition() async {
    await Future.delayed(Duration(seconds: 10));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      center = LatLng(widget.position[0], widget.position[1]);
      for (var item in widget.tableauxOfficines) {
        OfficineModel officine = item.keys.first;
        allMarkers.add(
          CustomMyMarker(
            LatLng(officine.lon!, officine.lat!),
            officine.id!,
          ),
        );
        allMarkersLatLng.add(LatLng(officine.lon!, officine.lat!));
      }
      // Calculer les limites des marqueurs
      LatLngBounds bounds = LatLngBounds.fromPoints(allMarkersLatLng);
      // Ajuster la vue de la carte pour afficher tous les marqueurs
      mapController.fitBounds(
        bounds,
        options: FitBoundsOptions(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
        ),
      );
      setState(() {});
    });
  }

  void targetMarker(String? id) {
    for (var marker in allMarkers) {
      if (marker.id == id) {
        mapController.move(marker.point, 13);
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: FlutterMap(
                        mapController: mapController,
                        options: MapOptions(
                          center: LatLng(5.307600, -3.972112),
                          zoom: 13,
                        ),
                        children: [
                          TileLayer(
                            urlTemplate:
                                'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                            userAgentPackageName:
                                'dev.fleaflet.flutter_map.example',
                          ),

                          // MarkerLayer(markers: allMarkers),
                          PopupMarkerLayerWidget(
                            options: PopupMarkerLayerOptions(
                              popupController: _popupLayerController,
                              markers: allMarkers
                                  .map((marker) => Marker(
                                        point: marker.point,
                                        width: 45,
                                        height: 45,
                                        builder: (context) => PharmacieMapPin(),
                                        anchorPos:
                                            AnchorPos.align(AnchorAlign.top),
                                      ))
                                  .toList(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SearchedMedicamentListDialog(
                                        initialProduits:
                                            widget.initialProduits);
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
                                  "Liste des médicaments (${widget.initialProduits.length})",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                    ),
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
