import 'package:get/get.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/widgets/MapWidget.dart';
import 'package:flutter/material.dart';
import 'package:ipi/widgets/loader.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/utils/helper.dart';
import 'dart:io';

class SearchPage extends StatefulWidget {
  static const routeName = "/SearchPage";

  SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> with WidgetsBindingObserver {
  MapWidgetController mapController = Get.find();
  OfficineController officineController = Get.find();

  bool ready = true;
  bool wait = false;

  bool isOrdonnance = false;
  late File file;
  late String base64 = "";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    officineController.officinesInZone(mapController.currentPosition.value);
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
            Container(
              height: Helper.getScreenHeight(context) * 0.8,
              child: Stack(
                children: [
                  MapWidget(),
                  Visibility(
                      child: LoaderScreen(
                        title:
                            "IPI envoie votre demande aux pharmacies sélectionnées...",
                      ),
                      visible: !ready),
                ],
              ),
            ),
            SearchBottomSheet(),
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
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: AppColor.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
                top: Helper.getScreenHeight(context) * 0.45,
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
                      size: 26,
                    ),
                    onTap: () {
                      mapController.changeCenter();
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
