import 'dart:async';
import 'package:flutter/material.dart';
import 'package:csshadow/csshadow.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/components/myLogo.dart';
import 'package:ipi/components/optInput.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/provider/CommunicateProvider.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class SendOTPScreen extends StatefulWidget {
  @override
  _SendOTPScreen createState() => _SendOTPScreen();
}

class _SendOTPScreen extends State<SendOTPScreen> {
  UtilisateurController controller = Get.find();
  final box = GetStorage();

  final _focusNode1 = FocusNode();
  final myController1 = TextEditingController();
  final _focusNode2 = FocusNode();
  final myController2 = TextEditingController();
  final _focusNode3 = FocusNode();
  final myController3 = TextEditingController();
  final _focusNode4 = FocusNode();
  final myController4 = TextEditingController();

  late String code = "";

  @override
  void initState() {
    sendOTP();
    super.initState();
  }

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

  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 2);

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  // Step 5
  void resetTimer() {
    setState(() => countdownTimer!.cancel());
    setState(() => myDuration = Duration(minutes: 2));
  }

  // Step 6
  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  String strDigits(int n) => n.toString().padLeft(2, '0');

  Future<void> validation() async {
    if (controller.currentUser.value?.otp.toString() == code) {
      controller.currentUser.value?.imei = box.read('imei');
      controller.updateUser(
          contact: controller.currentUser.value?.contact ?? "",
          name: controller.currentUser.value?.fullname ?? "",
          redirect: false);
      Get.off(HomeScreen());
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

  void sendOTP() {
    CommunicateProvider.send_SMS({
      "number": controller.currentUser.value?.contact,
      "message":
          "iPi - OTP - Bonjour, votre code OTP est: ${controller.currentUser.value?.otp} ! Bonne santé !"
    });
    startTimer();
    // Timer(Duration(milliseconds: 3000), () {
    //   Get.snackbar('iPi - Vérification OTP',
    //       'Votre code OTP est le ${controller.currentUser.value?.otp}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 235),
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
                  Text("Nous venons de vous envoyer un code SMS sur le "),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "+225 ${controller.currentUser.value?.contact}",
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
                  minutes == "0" && seconds == "0"
                      ? GestureDetector(
                          onTap: () {
                            sendOTP();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Je n'ai pas reçu de code. "),
                              Container(
                                  margin: EdgeInsets.only(left: 7),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(color: AppColor.blue),
                                  ),
                                  child: Text(
                                    "Renvoyez-le !",
                                    style: TextStyle(
                                      color: AppColor.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ],
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.only(left: 7),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColor.blue),
                          ),
                          child: Text(
                            "$minutes:$seconds",
                            style: TextStyle(
                              color: AppColor.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
