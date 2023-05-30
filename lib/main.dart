import 'package:flutter/material.dart';
import 'package:ipi/screens/medicamentScreen.dart';
import 'package:ipi/screens/pharmaciesGarde.dart';

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
import 'screens/searchPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  GlobalKey homeScreenkey = GlobalKey();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'ipi App',
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
        },
      ),
    );
  }
}
