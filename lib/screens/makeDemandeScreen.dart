import 'dart:ui';

import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/components/MapWidget.dart';
import 'package:flutter/material.dart';
import 'package:ipi/components/loader.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:ipi/const/colors.dart';
import 'dart:io';

class SearchPage extends StatefulWidget {
  SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> with WidgetsBindingObserver {
  MapWidgetController mapController = Get.find();
  OfficineController officineController = Get.find();
  DemandeController demandeController = Get.find();

  double taille = 0.8;

  bool isOrdonnance = false;
  late File file;
  late String base64 = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    officineController.garde.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Container(height: Get.size.height * taille, child: MapWidget()),
            SearchBottomSheet(),
            Obx(() {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Visibility(
                  visible: officineController.wait.value,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10)),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Recherche des pharmacies en cours",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Veuillez patienter ...",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30),
                                child: LinearProgressIndicator(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
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
