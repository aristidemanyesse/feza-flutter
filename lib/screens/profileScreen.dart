import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/confirmExitDialog.dart';
import 'package:ipi/widgets/customTextInput.dart';
import 'package:ipi/widgets/zoneChoicesDialog.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profileScreen";
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  UtilisateurController controller = Get.find();

  final myNameController = TextEditingController();
  final focusNode2 = FocusNode();
  final myNumeroController = TextEditingController();
  String errorText = "";
  int numeroLength = 0;
  final myFocusNode = FocusNode();
  late UtilisateurModel user = UtilisateurModel();
  bool isUpdated = false;

  bool _checkNumero() {
    bool test = false;
    String err = "";
    String text = myNumeroController.text;
    if (text.startsWith("01") ||
        text.startsWith("05") ||
        text.startsWith("07")) {
      if (myNumeroController.text.length == 14) {
        test = true;
        err = "";
        myFocusNode.unfocus();
      } else {
        test = false;
      }
    } else if (myNumeroController.text.length > 0) {
      test = false;
      err = 'Un numero de téléphone valide !';
    }

    setState(() {
      errorText = err;
    });
    return test;
  }

  @override
  void initState() {
    user = controller.currentUser.value!;
    myNameController.text = user.fullname ?? "";
    myNumeroController.text = user.contact ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 235),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
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
                            height: Helper.getScreenHeight(context) * 0.15,
                            decoration: ShapeDecoration(
                              color: AppColor.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                              ),
                            ),
                            child: Image.asset(
                              Helper.getAssetName("login_bg.png", "bg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Helper.getScreenHeight(context) * 0.12,
                        child: Center(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Mon profil",
                                style: Helper.getTheme(context)
                                    .headlineLarge
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              )),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(children: [
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: Colors.grey, width: 3)),
                        child: ClipOval(
                          child: Container(
                            height: 120,
                            width: 120,
                            child: Image.asset(
                              Helper.getAssetName(
                                "user.jpg",
                                "icons",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: isUpdated,
                        child: Positioned(
                          bottom: -3,
                          left: 70,
                          child: Container(
                              child: Icon(
                            Icons.camera_alt,
                            color: AppColor.blue,
                            size: 35,
                          )),
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 60,
                    ),
                    Visibility(
                      visible: !isUpdated,
                      child: Column(
                        children: [
                          Text(
                            user.fullname ?? "_",
                            style: Helper.getTheme(context)
                                .headlineMedium
                                ?.copyWith(
                                  color: AppColor.primary,
                                ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "+225 ${user.contact}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isUpdated = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: AppColor.blue, width: 1)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Modifier",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: AppColor.blue),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.edit,
                                    color: AppColor.blue,
                                    size: 13,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: isUpdated,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Ton nom en entier"),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(25)),
                              child: CustomTextInput(
                                controller: myNameController,
                                myFocusNode: focusNode2,
                                onChanged: (myNameController) {},
                                hintText: "Ton nom",
                                textAlign: TextAlign.center,
                                keyboard: TextInputType.name,
                                onEditingComplete: () {
                                  myFocusNode.nextFocus();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Ton numéro de téléphone"),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border:
                                      Border.all(color: Colors.grey, width: 2)),
                              child: CustomTextInput(
                                controller: myNumeroController,
                                myFocusNode: myFocusNode,
                                textAlign: TextAlign.center,
                                onChanged: (myNumeroController) {
                                  if (myNumeroController!.toString().length ==
                                      14) {
                                    _checkNumero();
                                  }
                                },
                                keyboard: TextInputType.number,
                                hintText: "07 01 02 03 04",
                                onEditingComplete: () {
                                  myFocusNode.unfocus();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  controller.updateUser(
                                      name: myNameController.text,
                                      contact: myNumeroController.text);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text("Enregistrer les modifications"),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          isUpdated
              ? Positioned(
                  top: 25,
                  child: SafeArea(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isUpdated = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Icon(
                            Icons.close,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Positioned(
                  top: 25,
                  child: SafeArea(
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          Visibility(
            visible: !isUpdated,
            child: Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.transparent,
                      ),
                      child: TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DeconnexionDialog();
                              },
                            );
                          },
                          child: Text(
                            "Se déconnecter",
                            style: TextStyle(fontSize: 15, color: Colors.red),
                          )),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {
  const CustomFormImput({
    Key? key,
    String label = "",
    String value = "",
    bool isPassword = false,
  })  : _label = label,
        _value = value,
        _isPassword = isPassword,
        super(key: key);

  final String _label;
  final String _value;
  final bool _isPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.only(left: 40),
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: _label,
          contentPadding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
        ),
        obscureText: _isPassword,
        initialValue: _value,
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}
