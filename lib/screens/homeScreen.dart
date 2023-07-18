import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/makeDemandeScreen.dart';
import 'package:ipi/screens/profileScreen.dart';
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
    demandeController.onInit();
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
      List<DemandeModel>? demandes = demandeController.demandes;
      Map<String, bool>? repondesDemandes = demandeController.repondesDemandes;

      return WillPopScope(
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 245, 239, 235),
            body: SafeArea(
              child: Container(
                height: Helper.getScreenHeight(context),
                width: Helper.getScreenWidth(context),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(MenuScreen(),
                                        transition: Transition.leftToRight);
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.end,
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
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(ProfileScreen());
                                        },
                                        child: Text(
                                          user?.fullname ?? "",
                                          style: Helper.getTheme(context)
                                              .headlineSmall
                                              ?.copyWith(
                                                  fontSize: 18,
                                                  color: AppColor.blue,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Image.asset(
                                    Helper.getAssetName("pharma.png", "icons"),
                                    width: 35,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
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
                                child: Text(
                                  "Vos demandes en cours ...",
                                  style: Helper.getTheme(context)
                                      .headlineLarge
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 21, 67, 111)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: Container(
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
                                    return DemandeItemCard(demande,
                                        repondesDemandes[demande.id] ?? false);
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
