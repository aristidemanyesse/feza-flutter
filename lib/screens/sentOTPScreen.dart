import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yebhofon/screens/homeScreen.dart';
import 'package:yebhofon/screens/landingScreen.dart';
import 'package:yebhofon/widgets/myLogo.dart';
import 'package:yebhofon/widgets/optInput.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

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
    }
    return true;
  }

  dynamic validation() {
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    final numero = arguments["numero"];

    return Scaffold(
      body: SafeArea(
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
              child: MyLogo(),
            ),
            SizedBox(
              height: Helper.getScreenHeight(context) * 0.06,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'On verifie que c\'est vous!',
                        style: Helper.getTheme(context).titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 20,
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
                        height: 50,
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
              ),
            ),
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
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
