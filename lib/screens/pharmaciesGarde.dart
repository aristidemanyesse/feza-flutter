import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/widgets/MapWidget.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/loader.dart';
import 'package:ipi/widgets/pharmacieItemCard2.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import 'package:ipi/widgets/selectDistanceBloc.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/utils/helper.dart';
import 'package:latlong2/latlong.dart';

class PharmaciesGarde extends StatefulWidget {
  static const routeName = "/PharmaciesGarde";

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

  int distance = 1;
  double taille = 0.8;
  bool ready = true;

  @override
  void initState() {
    officineController.garde.value = true;
    officineController.officinesInZone(mpController.currentPosition.value);
    super.initState();
  }

  void targetMarker(String? id) {
    var officine =
        officineController.officines.firstWhere((element) => element.id == id);
    mpController.bounds.value =
        LatLngBounds.fromPoints([LatLng(officine.lon!, officine.lat!)]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Stack(
              children: [
                Container(height: Get.size.height * taille, child: MapWidget()),
                DraggableScrollableSheet(
                  initialChildSize: 0.25,
                  minChildSize: 0.25,
                  maxChildSize: 0.6,
                  builder: (context, scrollController) {
                    return NotificationListener(
                        onNotification: (scrollController) {
                          if (scrollController is ScrollEndNotification) {
                            setState(() {
                              taille = (Get.size.height -
                                          scrollController
                                              .context!.size!.height) /
                                      Get.size.height +
                                  0.1;
                            });
                          }
                          return true;
                        },
                        child: ListView(
                          controller: scrollController,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                              height: Get.size.height * 0.58,
                              decoration: ShapeDecoration(
                                color: Color.fromARGB(255, 245, 239, 235),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Indicator(),
                                  const SizedBox(height: 15),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            appController.searchByAround.value =
                                                false;
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xffe4f3e4),
                                                        Color(0xff92cf94)
                                                      ],
                                                      stops: [0.25, 1],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Recherche zone",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[700],
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Obx(() {
                                                      return Opacity(
                                                        child:
                                                            SelectCirconscriptionBloc(),
                                                        opacity: appController
                                                                .searchByAround
                                                                .value
                                                            ? 0
                                                            : 1,
                                                      );
                                                    }),
                                                  ],
                                                ),
                                              ),
                                              Obx(() {
                                                return Visibility(
                                                  child: Calque(),
                                                  visible: appController
                                                      .searchByAround.value,
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            appController.searchByAround.value =
                                                true;
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xffe4f3e4),
                                                        Color(0xff92cf94)
                                                      ],
                                                      stops: [0.25, 1],
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                    ),
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Text(
                                                      "Périmètre de  ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[700],
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Obx(() {
                                                      return Opacity(
                                                        child:
                                                            SelectDistanceBloc(),
                                                        opacity: !appController
                                                                .searchByAround
                                                                .value
                                                            ? 0
                                                            : 1,
                                                      );
                                                    }),
                                                  ],
                                                ),
                                              ),
                                              Obx(() {
                                                return Visibility(
                                                  child: Calque(),
                                                  visible: !appController
                                                      .searchByAround.value,
                                                );
                                              })
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Obx(() {
                                    return officineController.wait.value
                                        ? LinearProgressIndicator(
                                            backgroundColor: AppColor.blue,
                                            color: AppColor.green,
                                          )
                                        : Text(
                                            "${officineController.officines.length} pharmacies trouvées",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          );
                                  }),
                                  const SizedBox(height: 10),
                                  Divider(
                                    height: 3,
                                    thickness: 3,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(height: 15),
                                  Container(
                                    child: Expanded(
                                      child: SingleChildScrollView(
                                        child: Obx(() {
                                          var officines =
                                              officineController.officines;
                                          var distanceTableaux =
                                              officineController
                                                  .distanceTableaux;
                                          return Column(
                                            children: officines.map((officine) {
                                              return GestureDetector(
                                                onTap: () {
                                                  targetMarker(officine.id);
                                                },
                                                child: Container(
                                                  color: Colors.transparent,
                                                  child: Column(
                                                    children: [
                                                      PharmacieItemCard2(
                                                        officine: officine,
                                                        distance:
                                                            distanceTableaux[
                                                                    officine] ??
                                                                "",
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets
                                                            .symmetric(
                                                                vertical: 3),
                                                        child: Divider(
                                                          color: AppColor
                                                              .placeholder,
                                                          thickness: 1.5,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        }),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ));
                  },
                ),
                Positioned(
                  bottom: Helper.getScreenHeight(context) * (1 - taille + 0.07),
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.only(right: 5, bottom: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        border:
                            Border.all(color: AppColor.secondary, width: 2)),
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
                    child: LoaderScreen(
                        title: "IPI recherche les pharmacies de garde ..."),
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
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border:
                                  Border.all(color: AppColor.blue, width: 1),
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
      ),
    );
  }
}
