import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/widgets/myLogo.dart';
import 'package:ipi/widgets/optInput.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../const/colors.dart';
import '../utils/helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SendOTPScreen extends StatefulWidget {
  static const routeName = "/sendOTP";
  @override
  _SendOTPScreen createState() => _SendOTPScreen();
}

class _SendOTPScreen extends State<SendOTPScreen> {
  final _focusNode1 = FocusNode();
  final myController1 = TextEditingController();
  final _focusNode2 = FocusNode();
  final myController2 = TextEditingController();
  final _focusNode3 = FocusNode();
  final myController3 = TextEditingController();
  final _focusNode4 = FocusNode();
  final myController4 = TextEditingController();

  late String code;
  late String uniq;
  late UtilisateurModel user;
  late String numero;

  @override
  void dispose() {
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  bool checkOTP() {
    if (this.myController1.text.length != 1 ||
        this.myController2.text.length != 1 ||
        this.myController3.text.length != 1 ||
        this.myController4.text.length != 1) {
      return false;
    } else {
      code = this.myController1.text +
          this.myController2.text +
          this.myController3.text +
          this.myController4.text;
      return true;
    }
  }

  Future<void> validation() async {
    if (user.otp.toString() == code) {
      uniq = await UtilisateurProvider.getUniqID();
      if (user.imei == uniq) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.id!);
        Navigator.of(context)
            .pushNamed(HomeScreen.routeName, arguments: {"user": user});
      } else {
        //TODO faire un dialog pour l'avertir que son compte sera deconnecté des autres téléphones if si oui on continue, si non, on reste la
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userId', user.id!);
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }
    } else {
      setState(() {
        this.myController1.clear();
        this.myController2.clear();
        this.myController3.clear();
        this.myController4.clear();
      });
      Fluttertoast.showToast(
          msg: "Le code OTP n'est pas le bon",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    setState(() {
      numero = arguments["numero"];
      user = arguments["user"];
    });
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          body: SingleChildScrollView(
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
                            Helper.getAssetName("login_bg.png", "bg"),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    height: Helper.getScreenHeight(context) * 0.17,
                    child: Center(
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Validation OTP",
                            style: Helper.getTheme(context)
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                ]),
                Container(
                  alignment: Alignment.center,
                  child: MyLogo(height: 80, width: 80),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "On vérifie que c'est vous!",
                        style: Helper.getTheme(context)
                            .titleLarge!
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Nous venons de vous envoyer un code sur le "),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "+225 $numero",
                        style: TextStyle(
                          color: AppColor.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OTPInput(
                            controller: myController1,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                          ),
                          OTPInput(
                            controller: myController2,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                          OTPInput(
                            controller: myController3,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                          OTPInput(
                            controller: myController4,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).unfocus();
                              } else {
                                FocusScope.of(context).previousFocus();
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: checkOTP() ? validation : null,
                          child: Text("Continuer"),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Je n'ai pas reçu de code. "),
                            Text(
                              "Renvoyez-le !",
                              style: TextStyle(
                                color: AppColor.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
