import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/widgets/mapPin.dart';
import 'package:yebhofon/widgets/mapPopupPin.dart';
import 'package:yebhofon/widgets/searchedMedicamentListDialog.dart';

class SearchPageBackground extends StatefulWidget {
  static const routeName = "/SearchPageBackground";
  final List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines;
  final List<ProduitModel> initialProduits;
  const SearchPageBackground(
      {Key? key,
      required this.tableauxOfficines,
      required this.initialProduits})
      : super(key: key);

  @override
  State<SearchPageBackground> createState() => _SearchPageBackgroundState();
}

class _SearchPageBackgroundState extends State<SearchPageBackground> {
  final PopupController _popupLayerController = PopupController();
  Position? position;
  LatLng center = LatLng(0, 0);

  List<Marker> allMarkers = [
    // Marker(
    //   width: 45,
    //   height: 45,
    //   point: LatLng(5.260298, -3.9522842),
    //   builder: (context) => PharmacieMapPin(),
    // ),
  ];

// ignore: missing_return
  // Future<String?> hello() async {
  //   Location location = new Location();

  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _locationData;

  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return "";
  //     }
  //   }

  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return "";
  //     }
  //   }

  //   _locationData = await location.getLocation();

  //   location.enableBackgroundMode(enable: true);

  //   location.onLocationChanged.listen((LocationData currentLocation) {
  //     // Use current location
  //   });
  // }

  Future<void> getPosition() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      position = await Geolocator.getLastKnownPosition();
      print("L'utilisateur a refusé l'accès à la localisation");
    } else {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
    }
    setState(() {
      center = LatLng(position!.latitude, position!.longitude);
      allMarkers.add(
        Marker(
          width: 45,
          height: 45,
          point: center,
          builder: (context) => PharmacieMapPin(),
        ),
      );
    });
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
                        options: MapOptions(
                          center: center,
                          zoom: 14,
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
