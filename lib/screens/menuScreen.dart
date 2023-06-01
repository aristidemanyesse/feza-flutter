import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/screens/dessertScreen.dart';
import 'package:ipi/screens/pharmaciesGarde.dart';
import 'package:ipi/screens/profileScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/menuCard.dart';
import 'package:ipi/widgets/myLogo.dart';

class MenuScreen extends StatefulWidget {
  static const routeName = "/menuScreen";
  @override
  _MenuScreen createState() => _MenuScreen();
}

class _MenuScreen extends State<MenuScreen> {
  late UtilisateurModel user;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    setState(() {
      user = arguments["user"];
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Helper.getAssetName("splashIcon.png", "bg"),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.08,
                ),
                MyLogo(),
                SizedBox(
                  height: Helper.getScreenHeight(context) * 0.05,
                ),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.5,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(PharmaciesGarde.routeName);
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
                                  subtitle: "Du 22 Mai au 29 Mai",
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(DessertScreen.routeName);
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
                                  name: "Conseils Santé",
                                  subtitle: "25",
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      ProfileScreen.routeName,
                                      arguments: {"user": user});
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
                                  subtitle: user.contact ?? "",
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
          Container(
            height: Helper.getScreenHeight(context) * 0.2,
            width: Helper.getScreenWidth(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4],
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
