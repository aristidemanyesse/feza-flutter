import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/makeDemandeScreen.dart';
import 'package:ipi/widgets/DemandeItemCard.dart';
import 'package:ipi/widgets/confirmExitDialog.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import 'package:lottie/lottie.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  UtilisateurController userController = Get.find();
  DemandeController demandeController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      UtilisateurModel? user = userController.currentUser.value;
      List<DemandeModel>? demandes = demandeController.demandes.value;

      return WillPopScope(
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 245, 239, 235),
            body: SafeArea(
              child: Container(
                height: Helper.getScreenHeight(context),
                width: Helper.getScreenWidth(context),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      height: Helper.getScreenHeight(context) * 0.3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Helper.getAssetName("pharma.png", "icons"),
                                    width: 35,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Bonjour,",
                                        style: Helper.getTheme(context)
                                            .headlineSmall
                                            ?.copyWith(
                                              fontSize: 15,
                                            ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        user?.fullname ?? "",
                                        style: Helper.getTheme(context)
                                            .headlineSmall
                                            ?.copyWith(
                                                fontSize: 18,
                                                color: AppColor.blue,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(MenuScreen(),
                                        transition: Transition.rightToLeft);
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Circonscription actuelle"),
                                SizedBox(
                                  height: 7,
                                ),
                                SelectCirconscriptionBloc(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Vos demandes en cours ...",
                                  style: Helper.getTheme(context)
                                      .headlineLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color:
                                              Color.fromARGB(255, 21, 67, 111)),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        HomeScreen.routeName);
                                  },
                                  child: Icon(Icons.refresh),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: demandes.isEmpty
                            ? Center(
                                child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Center(
                                    child: Lottie.asset(
                                      "assets/lotties/empty.json",
                                    ),
                                  ),
                                  Text(
                                    "Aucune demande pour le moment ...",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(height: 1.5),
                                  ),
                                ],
                              ))
                            : SingleChildScrollView(
                                child: Column(
                                  children: demandes.map((demande) {
                                    return DemandeItemCard(demande);
                                  }).toList(),
                                ),
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      height: Helper.getScreenHeight(context) * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(SearchPage(),
                                  transition: Transition.downToUp);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.add,
                                  size: 24,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Faire une nouvelle recherche",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          onWillPop: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmExitDialog();
              },
            );
            return Future.value(false);
          });
    });
  }
}
