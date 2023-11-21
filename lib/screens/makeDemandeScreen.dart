import 'dart:ui';

import 'package:get/get.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/components/MapWidget.dart';
import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/widgets/pleaseWait.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'dart:io';

import 'package:ipi/widgets/takeImage.dart';

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
  ProduitController produitController = Get.find();
  TakeImageController imageCcontroller = Get.find();

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
    controller.onInit();
    appController.onInit();
    mapController.onInit();
    produitController.onInit();
    officineController.onInit();
    imageCcontroller.onInit();

    officineController.garde.value = false;
    super.initState();
  }

  SearchBottomSheetController controller = Get.find();
  AppController appController = Get.find();

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
                    child: PleaseWait(
                      title: "Recherche des pharmacies en cours",
                      message: "Commencez à renseigner vos besoins ...",
                    )),
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
