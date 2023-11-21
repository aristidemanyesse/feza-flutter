import 'dart:convert';
import 'dart:ui';

import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/components/MapWidget.dart';
import 'package:flutter/material.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/const/colors.dart';
import 'package:latlong2/latlong.dart';

class MeToOfficine extends StatefulWidget {
  final Officine officine;

  MeToOfficine({
    Key? key,
    required this.officine,
  }) : super(key: key);

  @override
  State<MeToOfficine> createState() => MeToOfficineState();
}

class MeToOfficineState extends State<MeToOfficine> {
  MapWidgetController mapController = Get.find();
  OfficineController controller = Get.find();
  String distance = "";

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var datas = await Officine.officineDistance({
      "id": widget.officine.id,
      "longitude": mapController.currentPosition.value.longitude,
      "latitude": mapController.currentPosition.value.latitude
    });
    print(datas);

    var dist = datas["distance"];

    var geojson = jsonDecode(datas["route"]);
    List<LatLng> points = [];
    for (var element in jsonDecode(geojson)["geometry"]["coordinates"]) {
      points.add(LatLng(element[1], element[0]));
    }

    setState(() {
      distance =
          dist < 1000 ? "$dist m" : "${(dist / 1000).toStringAsFixed(2)} km";
      controller.routeCoordinates.value = Polyline(
        points: points,
        isDotted: true,
        color: Colors.white,
        borderColor: Colors.black,
        borderStrokeWidth: 3,
        strokeWidth: 3,
        useStrokeWidthInMeter: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(height: Get.size.height, child: MapWidget()),
            Positioned(
              bottom: 20,
              right: 20,
              left: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Column(
                            children: [
                              Image.asset(
                                Helper.getAssetName("pharma.png", "icons"),
                                width: 60,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text("$distance")
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "${widget.officine.name}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color.fromARGB(255, 21, 67, 111),
                                ),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${widget.officine.circonscription?.name}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "${widget.officine.localisation}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${widget.officine.contact} / ${widget.officine.contact2}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.orange,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 35,
              right: 5,
              child: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(right: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    border: Border.all(color: AppColor.secondary, width: 2)),
                child: GestureDetector(
                  child: Icon(
                    Icons.location_searching,
                    size: 22,
                  ),
                  onTap: () {
                    mapController.changeCenter();
                  },
                ),
              ),
            ),
            Positioned(
              top: 10,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColor.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Icon(
                        Icons.arrow_downward_rounded,
                        size: 20,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
