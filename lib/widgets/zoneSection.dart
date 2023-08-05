import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/RayonButtom.dart';
import 'package:ipi/components/indicator.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';
import 'package:ipi/widgets/zoneChoicesDialog.dart';

class ZoneSection extends StatelessWidget {
  ZoneSection({
    super.key,
  });

  UtilisateurController utilisateurController = Get.find();
  AppController appController = Get.find();
  SearchBottomSheetController controller = Get.find();
  OfficineController officineController = Get.find();
  MapWidgetController mapController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Indicator(),
          Column(
            children: [
              Text("1 - Dans quelle zone cherchée ?",
                  style: Helper.getTheme(context).headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 21, 67, 111))),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (utilisateurController
                          .currentUser.value?.circonscription !=
                      null) {
                    controller.page.value = 1;
                    appController.searchByAround.value = false;
                    officineController
                        .officinesInZone(mapController.currentPosition.value);
                  } else {
                    Get.dialog(CirconscriptionChoicesDialog());
                  }
                },
                onLongPress: () {
                  Get.dialog(CirconscriptionChoicesDialog());
                },
                child: Obx(() {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: AppColor.blue),
                      color: appController.searchByAround.value
                          ? Colors.transparent
                          : AppColor.blue,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Chercher dans ${utilisateurController.currentUser.value?.circonscription?.name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: appController.searchByAround.value
                                  ? AppColor.blue
                                  : Colors.white),
                        ),
                        Container(
                          width: 2,
                          height: 25,
                          color: appController.searchByAround.value
                              ? AppColor.blue
                              : Colors.white,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(CirconscriptionChoicesDialog());
                          },
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            color: appController.searchByAround.value
                                ? AppColor.blue
                                : Colors.white,
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Text("Ou dans un rayon de "),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1.0,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    RayonButton(1),
                    RayonButton(2),
                    RayonButton(3),
                    RayonButton(5),
                    RayonButton(10)
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
