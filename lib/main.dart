import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/CirconscriptionController.dart';
import 'package:ipi/controllers/ConnexionController.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/GardeController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/controllers/ReponseController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/screens/medicamentScreen.dart';
import 'package:ipi/screens/pharmaciesGarde.dart';
import 'package:ipi/screens/test.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/utils/local_notifications.dart';
import './screens/spashScreen.dart';
import './screens/landingScreen.dart';
import './screens/loginScreen.dart';
import './screens/sentOTPScreen.dart';
import './screens/introScreen.dart';
import './screens/homeScreen.dart';
import './screens/menuScreen.dart';
import './screens/profileScreen.dart';
import './screens/dessertScreen.dart';
import './const/colors.dart';
import 'screens/makeDemandeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();

  Get.put(ConnexionController());
  Get.put(AppController());
  Get.put(UtilisateurController());
  Get.put(OfficineController());
  Get.put(ProduitController());
  Get.put(CirconscriptionController());
  Get.put(MapWidgetController());
  Get.put(GardeController());
  Get.put(DemandeController());
  Get.put(ReponseController());

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  ConnexionController controller = Get.find();

  @override
  void initState() {
    super.initState();
  }

  GlobalKey homeScreenkey = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        textDirection: TextDirection.ltr,
        children: [
          GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: GetMaterialApp(
              title: 'IPI',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                fontFamily: "Metropolis",
                primarySwatch: Colors.blue,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      AppColor.blue,
                    ),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                    elevation: MaterialStateProperty.all(0),
                  ),
                ),
                textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(
                      AppColor.blue,
                    ),
                  ),
                ),
                textTheme: TextTheme(
                  displaySmall: TextStyle(
                    color: AppColor.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  headlineMedium: TextStyle(
                    color: AppColor.secondary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  headlineSmall: TextStyle(
                    color: AppColor.primary,
                    fontWeight: FontWeight.normal,
                    fontSize: 25,
                  ),
                  titleLarge: TextStyle(
                    color: AppColor.primary,
                    fontSize: 25,
                  ),
                  bodyMedium: TextStyle(
                    color: AppColor.secondary,
                  ),
                ),
              ),
              home: SplashScreen(),
              routes: {
                LandingScreen.routeName: (context) => LandingScreen(),
                LoginScreen.routeName: (context) => LoginScreen(),
                SendOTPScreen.routeName: (context) => SendOTPScreen(),
                IntroScreen.routeName: (context) => IntroScreen(),
                SearchPage.routeName: (context) => SearchPage(),
                MenuScreen.routeName: (context) => MenuScreen(),
                PharmaciesGarde.routeName: (context) => PharmaciesGarde(),
                ProfileScreen.routeName: (context) => ProfileScreen(),
                DessertScreen.routeName: (context) => DessertScreen(),
                MedicamentScreen.routeName: (context) => MedicamentScreen(),
                HomeScreen.routeName: (context) => HomeScreen(),
                // TextRecognizerView.routeName: (context) => TextRecognizerView(),
                TestPage.routeName: (context) => TestPage(),
              },
            ),
          ),
          SafeArea(
              child: !controller.isConnected.value
                  ? Container(
                      height: Helper.getScreenHeight(context) * 0.04,
                      width: double.infinity,
                      color: const Color.fromRGBO(244, 67, 54, 1)
                          .withOpacity(0.85),
                      child: Center(
                        child: Text("Vérifiez votre connexion internet !",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                            textDirection: TextDirection.ltr),
                      ),
                    )
                  : Container())
        ],
      ),
    );
  }
}
