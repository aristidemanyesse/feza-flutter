import 'package:flutter/material.dart';
import 'package:yebhofon/model/UtilisateurModel.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/screens/landingScreen.dart';
import 'package:csshadow/csshadow.dart';
import 'package:yebhofon/screens/sentOTPScreen.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import '../widgets/customTextInput.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final myNumeroController = TextEditingController();
  String errorText = "";
  int numeroLength = 0;

  void _checkNumero() {
    String text = myNumeroController.text;
    if (text.isEmpty) {
      setState(() {
        errorText = 'Veuillez saisir votre numero de téléphone.';
      });
    } else if (text.length < 10 ||
        (!text.startsWith("01") &&
            !text.startsWith("05") &&
            !text.startsWith("07"))) {
      setState(() {
        errorText = 'Un numero de téléphone valide !';
      });
    } else {
      setState(() {
        errorText = "";
        Navigator.of(context).pushNamed(SendOTPScreen.routeName,
            arguments: {"numero": myNumeroController.text});
      });
    }
  }

  // void test() async {
  //   Map<String, dynamic> variables = {"numero": myNumeroController.text};
  //   List<UtilisateurModel> utilisateurs =
  //       await UtilisateurProvider.all(variables);
  //   print(utilisateurs);
  //   // test();
  // }

  @override
  void dispose() {
    myNumeroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Column(
            children: [
              Stack(children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CsShadow(
                    clipper: CustomClipperAppBar(),
                    shadow: BoxShadow(
                        color: AppColor.placeholder,
                        offset: Offset(0, 15),
                        blurRadius: 5.0,
                        spreadRadius: 4),
                    child: Container(
                        width: double.infinity,
                        height: Helper.getScreenHeight(context) * 0.2,
                        decoration: ShapeDecoration(
                          color: AppColor.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Image.asset(
                          Helper.getAssetName("login_bg.png", "virtual"),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Container(
                  height: Helper.getScreenHeight(context) * 0.2,
                  child: Center(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Inscription",
                          style: Helper.getTheme(context)
                              .headlineLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ]),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  Helper.getAssetName("MealMonkeyLogo.png", "virtual"),
                  height: 90,
                ),
              ),
              SizedBox(
                height: Helper.getScreenHeight(context) * 0.06,
              ),
              Expanded(
                  child: Container(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'On a juste besoin de ton numero de téléphone',
                          style:
                              TextStyle(height: 1.5, color: AppColor.primary),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomTextInput(
                          controller: myNumeroController,
                          keyboard: TextInputType.number,
                          hintText: "07 01 02 03 04",
                          onEditingComplete: () {},
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          errorText,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: myNumeroController.text.length == 14
                                ? _checkNumero
                                : null,
                            child: Text("Vérification"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
              Container(
                alignment: Alignment.center,
                height: 20,
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Yebhofon @ Copyright 2023"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
