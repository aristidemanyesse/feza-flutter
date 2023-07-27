import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/components/pharmacieItemCard2.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:latlong2/latlong.dart';

class ListePharmaciesSection extends StatelessWidget {
  ListePharmaciesSection({
    super.key,
  });

  OfficineController officineController = Get.find();
  UtilisateurController utilisateurController = Get.find();
  AppController appController = Get.find();
  MapWidgetController mpController = Get.find();
  SearchBottomSheetController controller = Get.find();

  void targetMarker(String? id) {
    var officine =
        officineController.officines.firstWhere((element) => element.id == id);
    mpController.bounds.value =
        LatLngBounds.fromPoints([LatLng(officine.lon!, officine.lat!)]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Indicator(),
                // Text("Les pharmacies de garde dans",
                //     style: Helper.getTheme(context).headlineLarge?.copyWith(
                //         fontSize: 16, color: Color.fromARGB(255, 21, 67, 111))),
                // Text(
                //   appController.searchByAround.value
                //       ? "un rayon de ${appController.radius.value} Km"
                //       : "${utilisateurController.currentUser.value?.circonscription?.name}",
                //   style: Helper.getTheme(context).headlineLarge?.copyWith(
                //       fontWeight: FontWeight.bold,
                //       fontSize: 16,
                //       color: Color.fromARGB(255, 21, 67, 111)),
                // ),
                // const SizedBox(height: 15),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      child: Obx(() {
                        var officines = officineController.officines;
                        var distanceTableaux =
                            officineController.distanceTableaux;
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
                                          distanceTableaux[officine] ?? "",
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 3),
                                      child: Divider(
                                        color: AppColor.placeholder,
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
                    SizedBox(
                      height: 10,
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
