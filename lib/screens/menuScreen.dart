import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/components/menuCard.dart';
import 'package:ipi/components/myLogo.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/GardeController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/GardeModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/pharmaciesGarde.dart';
import 'package:ipi/screens/profileScreen.dart';
import 'package:ipi/utils/helper.dart';
import "package:intl/intl.dart";
import 'package:intl/date_symbol_data_local.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreen createState() => _MenuScreen();
}

class _MenuScreen extends State<MenuScreen> {
  UtilisateurController userController = Get.find();
  GardeController gardeController = Get.find();

  DateFormat f = DateFormat();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    initializeDateFormatting("fr");
    f = DateFormat("dd MMMM", "fr");
    userController.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UtilisateurModel? user = userController.currentUser.value;
      GardeModel? garde = gardeController.currentGarde.value;

      return Scaffold(
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                Helper.getAssetName("landing.jpg", "bg"),
                fit: BoxFit.scaleDown,
                repeat: ImageRepeat.repeatY,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Color.fromARGB(255, 245, 239, 235).withOpacity(0.85),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: Helper.getScreenHeight(context) * 0.15,
                  ),
                  MyLogo(
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "ici Pharmacies ivoiriennes",
                    textAlign: TextAlign.center,
                    style: Helper.getTheme(context).headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: AppColor.orange),
                  ),
                  SizedBox(
                    height: Helper.getScreenHeight(context) * 0.1,
                  ),
                  SizedBox(
                      height: Helper.getScreenHeight(context) * 0.4,
                      width: Helper.getScreenWidth(context),
                      child: Stack(
                        children: [
                          Container(
                            height: double.infinity,
                            width: 100,
                            decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                                color: AppColor.blue),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(PharmaciesGarde(),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                  },
                                  child: MenuCard(
                                      imageShape: ClipOval(
                                        child: Container(
                                          color: Colors.white,
                                          height: 60,
                                          width: 60,
                                          child: Image.asset(
                                            Helper.getAssetName(
                                                "plus.png", "icons"),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      name: "Pharmarcies de garde",
                                      subtitle: garde != null
                                          ? Row(
                                              children: [
                                                Text("Du"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${f.format(DateTime.parse(garde.debut ?? ""))}",
                                                  style: TextStyle(
                                                      color: AppColor.green,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text("au"),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${f.format(DateTime.parse(garde.fin ?? ""))}",
                                                  style: TextStyle(
                                                      color: AppColor.green,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            )
                                          : Container()),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(ProfileScreen(),
                                        transition:
                                            Transition.rightToLeftWithFade);
                                  },
                                  child: MenuCard(
                                    imageShape: ClipPath(
                                      clipper: CustomDiamond(),
                                      child: Container(
                                        height: 80,
                                        width: 80,
                                        child: Image.asset(
                                          Helper.getAssetName(
                                              "advice.png", "icons"),
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    name: "Mon compte",
                                    subtitle: Text(
                                      user?.contact ?? "",
                                      style: TextStyle(
                                          color: AppColor.green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
            Positioned(
              top: 10,
              child: SafeArea(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: InkWell(
                    onTap: () {
                      Get.off(HomeScreen());
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
          ],
        ),
      );
    });
  }
}
