import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ipi/main.dart';
import 'package:ipi/models/DemandeModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/DemandeProvider.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/menuScreen.dart';
import 'package:ipi/screens/searchPage.dart';
import 'package:ipi/utils/sharedpre.dart';
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
  late StreamSubscription<String> _sharedPreferencesSubscription;

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  UtilisateurModel? user;
  late List<DemandeModel> demandes = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _sharedPreferencesSubscription.cancel(); // Arrêter le StreamSubscription
    super.dispose();
  }

  // Future<void> showNotification() async {
  //   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
  //     'ipi2106', // Remplacez 'channel_id' par un identifiant unique pour votre canal de notification
  //     'ipi Notificaition', // Remplacez 'channel_name' par le nom du canal de notification
  //     channelDescription:
  //         'lorem  ipsiumm frkje uidfjkbj', // Remplacez 'channel_description' par la description du canal de notification
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //     android: androidPlatformChannelSpecifics,
  //     iOS: iOSPlatformChannelSpecifics,
  //   );

  //   await flutterLocalNotificationsPlugin.show(
  //     5465466,
  //     'Titre de la notification',
  //     'Contenu de la notification',
  //     platformChannelSpecifics,
  //     payload: 'Notification payload',
  //   );
  // }

  Future<void> getData() async {
    await sharedPreferencesService.init();
    String? userId = await sharedPreferencesService.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"id": userId, "imei": uniq});
    user = users[0];

    demandes = await DemandeProvider.all({"user": userId});
    user = users[0];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 245, 239, 235),
          body: Container(
            height: Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context),
            child: Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: Helper.getScreenHeight(context) * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
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
                              Text(
                                "Bonjour ",
                                style: Helper.getTheme(context).headlineSmall,
                              ),
                              Text(
                                user?.fullname ?? "",
                                style: Helper.getTheme(context)
                                    .headlineSmall
                                    ?.copyWith(
                                        color: AppColor.blue,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " !",
                                style: Helper.getTheme(context)
                                    .headlineSmall
                                    ?.copyWith(
                                        color: AppColor.blue,
                                        fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 12),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    MenuScreen.routeName,
                                    arguments: {"user": user});
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
                        height: 50,
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              child: Text("Circonscription actuelle"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SelectCirconscriptionBloc(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
                                      color: Color.fromARGB(255, 21, 67, 111)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: GestureDetector(
                              onTap: () => Navigator.of(context)
                                  .pushReplacementNamed(HomeScreen.routeName),
                              child: Icon(Icons.refresh),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
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
                  margin: EdgeInsets.only(bottom: 10),
                  height: Helper.getScreenHeight(context) * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(SearchPage.routeName);
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
        onWillPop: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmExitDialog();
            },
          );
          return Future.value(false);
        });
  }
}
