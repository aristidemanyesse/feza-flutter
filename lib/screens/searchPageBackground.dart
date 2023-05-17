import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/utils/sharedpre.dart';
import 'package:yebhofon/widgets/mapPin.dart';
import 'package:yebhofon/widgets/mapPopupPin.dart';
import 'package:yebhofon/widgets/searchedMedicamentListDialog.dart';
import 'package:flutter_map/plugin_api.dart';

class SearchPageBackground extends StatefulWidget {
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

class SearchPageBackgroundState extends State<SearchPageBackground>
    with TickerProviderStateMixin {
  MapController mapController = MapController();
  final PopupController _popupLayerController = PopupController();
  LatLng center = LatLng(5.260298, -3.9522842);
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  List<CustomMyMarker> allMarkers = [];
  List<LatLng> allMarkersLatLng = [];

  static const _startedId = 'AnimatedMapController#MoveStarted';
  static const _inProgressId = 'AnimatedMapController#MoveInProgress';
  static const _finishedId = 'AnimatedMapController#MoveFinished';

  void _animatedMapMove(LatLng destLocation, double destZoom) {
    // Create some tweens. These serve to split up the transition from one location to another.
    // In our case, we want to split the transition be<tween> our current map center and the destination.
    final latTween = Tween<double>(
        begin: mapController.center.latitude, end: destLocation.latitude);
    final lngTween = Tween<double>(
        begin: mapController.center.longitude, end: destLocation.longitude);
    final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

    // Create a animation controller that has a duration and a TickerProvider.
    final controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    // The animation determines what path the animation will take. You can try different Curves values, although I found
    // fastOutSlowIn to be my favorite.
    final Animation<double> animation =
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

    // Note this method of encoding the target destination is a workaround.
    // When proper animated movement is supported (see #1263) we should be able
    // to detect an appropriate animated movement event which contains the
    // target zoom/center.
    final startIdWithTarget =
        '$_startedId#${destLocation.latitude},${destLocation.longitude},$destZoom';
    bool hasTriggeredMove = false;

    controller.addListener(() {
      final String id;
      if (animation.value == 1.0) {
        id = _finishedId;
      } else if (!hasTriggeredMove) {
        id = startIdWithTarget;
      } else {
        id = _inProgressId;
      }

      hasTriggeredMove |= mapController.move(
        LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)),
        zoomTween.evaluate(animation),
        id: id,
      );
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.dispose();
      } else if (status == AnimationStatus.dismissed) {
        controller.dispose();
      }
    });
    controller.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchPageBackground oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Vérifiez si widget.tableauxOfficines est disponible
    if (widget.tableauxOfficines.isNotEmpty) {
      // Les données sont disponibles, vous pouvez exécuter votre code ici
      center = LatLng(widget.position[0], widget.position[1]);
      for (var item in widget.tableauxOfficines) {
        OfficineModel officine = item.keys.first;
        allMarkers.add(
            CustomMyMarker(LatLng(officine.lon!, officine.lat!), officine));
        allMarkersLatLng.add(LatLng(officine.lon!, officine.lat!));
      }
      // Calculer les limites des marqueurs
      LatLngBounds bounds = LatLngBounds.fromPoints(allMarkersLatLng);
      final centerZoom = mapController.centerZoomFitBounds(bounds);
      _animatedMapMove(centerZoom.center, centerZoom.zoom);
    }
  }

  void targetMarker(String? id) {
    for (var marker in allMarkers) {
      if (marker.officine.id == id) {
        _animatedMapMove(marker.point, 13);
      }
    }
  }

  void _scrollToContainer(String index) async {
    await sharedPreferencesService.init();
    await sharedPreferencesService.setString('scrollToContainerIndex', index);
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
                                  .map((element) => Marker(
                                        point: element.point,
                                        width: 30,
                                        height: 30,
                                        builder: (context) => GestureDetector(
                                          onTap: () {
                                            _scrollToContainer(
                                                element.officine.id ?? "");
                                          },
                                          child: PharmacieMapPin(),
                                        ),
                                        anchorPos:
                                            AnchorPos.align(AnchorAlign.top),
                                      ))
                                  .toList(),
                              markerRotateAlignment:
                                  PopupMarkerLayerOptions.rotationAlignmentFor(
                                      AnchorAlign.top),
                              popupBuilder:
                                  (BuildContext context, Marker marker) =>
                                      MapMinPharmaciePopup(
                                          marker: marker,
                                          officine: allMarkers
                                              .firstWhere((element) =>
                                                  element.point == marker.point)
                                              .officine,
                                          ratio: "23",
                                          distance: "23"),
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
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                                child: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 20,
                                  color: AppColor.blue,
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SearchedMedicamentListDialog(
                                        initialProduits:
                                            widget.initialProduits);
                                  },
                                );
                              },
                              child: widget.initialProduits.length > 0
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Text(
                                        "Liste des médicaments (${widget.initialProduits.length})",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Container())
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
