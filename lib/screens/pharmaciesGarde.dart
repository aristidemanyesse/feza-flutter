import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/components/MapWidget.dart';
import 'package:ipi/components/loader.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/widgets/listePharmaciesSection.dart';
import 'package:ipi/widgets/pleaseWait.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:ipi/widgets/zoneSection.dart';

class PharmaciesGarde extends StatefulWidget {
  PharmaciesGarde({
    Key? key,
  }) : super(key: key);

  @override
  State<PharmaciesGarde> createState() => PharmaciesGardeState();
}

class PharmaciesGardeState extends State<PharmaciesGarde> {
  AppController appController = Get.find();
  OfficineController officineController = Get.find();
  MapWidgetController mpController = Get.find();
  SearchBottomSheetController controller = Get.find();

  var _pages = [ZoneSection(), ListePharmaciesSection()];
  var _controller = new PageController();

  @override
  void initState() {
    officineController.garde.value = true;
    controller.page.value = 0;
    super.initState();

    ever(controller.page, (value) async {
      _controller.animateToPage(
        controller.page.value,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });

    ever(officineController.officines, (value) async {
      if (controller.page.value == 1 && value.length == 0) {
        _controller.animateToPage(
          1,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            children: [
              Container(height: Get.size.height * 0.75, child: MapWidget()),
              DraggableScrollableSheet(
                initialChildSize: (868 * 0.3) / Get.size.height,
                minChildSize: (868 * 0.3) / Get.size.height,
                builder: (context, scrollController) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 10),
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400.withOpacity(0.5),
                            blurRadius: 5.0,
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40)),
                        child: Container(
                          color: Color.fromARGB(255, 245, 239, 235),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: PageView(
                            physics: NeverScrollableScrollPhysics(),
                            controller: _controller,
                            children: _pages,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Positioned(
                bottom: Get.size.height * 0.5,
                right: 5,
                child: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(right: 5, bottom: 10),
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
                      mpController.changeCenter();
                    },
                  ),
                ),
              ),
              Obx(() {
                return Visibility(
                  child: PleaseWait(
                    title: "Recherche des pharmacies de garde",
                    message: "Veuillez patienter ...",
                  ),
                  visible: officineController.wait.value,
                );
              }),
              Positioned(
                top: 7,
                child: SafeArea(
                  child: Container(
                    margin: EdgeInsets.only(left: 12),
                    child: InkWell(
                      onTap: () {
                        if (controller.page.value == 0) {
                          Get.back();
                        } else {
                          controller.page.value = 0;
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: AppColor.blue, width: 1),
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
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
