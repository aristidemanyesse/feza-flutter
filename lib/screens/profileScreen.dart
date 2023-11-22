import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ipi/components/customTextInput.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/models/coreApp/Tools.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';
import 'package:ipi/screens/spashScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/confirmDialog.dart';
import 'package:ipi/widgets/pleaseWait.dart';
import 'package:ipi/widgets/takeImage.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  UtilisateurController controller = Get.find();
  TakeImageController imageController = Get.find();

  final myNameController = TextEditingController();
  final focusNode2 = FocusNode();
  final myNumeroController = TextEditingController();
  String errorText = "";
  int numeroLength = 0;
  final myFocusNode = FocusNode();
  late Utilisateur user = Utilisateur();
  bool isUpdated = false;

  final box = GetStorage();

  void deconnexion() async {
    controller.currentUser.value = null;
    box.erase();
    Tools.getUniqID().then((value) => box.write("imei", value));
    controller.updateUser(
        contact: controller.currentUser.value?.contact ?? "",
        name: controller.currentUser.value?.fullname ?? "",
        redirect: false,
        isValide: false);
    await Future.delayed(Duration(milliseconds: 3000));
    Get.to(SplashScreen());
  }

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
        test = false;
      }
    } else if (myNumeroController.text.length > 0) {
      test = false;
      err = 'Renseignez un numero de téléphone valide !';
    }

    setState(() {
      errorText = err;
    });
    return test;
  }

  @override
  void initState() {
    myNameController.text = controller.currentUser.value!.fullname;
    myNumeroController.text = controller.currentUser.value!.contact;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    imageController.isOrdonnance.value = false;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 239, 235),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              Helper.getAssetName("landing.jpg", "bg"),
              fit: BoxFit.scaleDown,
              repeat: ImageRepeat.repeatY,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Color.fromARGB(255, 245, 239, 235).withOpacity(0.90),
          ),
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Mon profil",
                    style: Helper.getTheme(context).headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.orange),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.grey, width: 3),
                    ),
                    child: Stack(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
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
                      Visibility(
                        visible: isUpdated,
                        child: Positioned(
                          bottom: -3,
                          left: 70,
                          child: GestureDetector(
                            onTap: () {
                              Get.dialog(TakeImage());
                            },
                            child: Container(
                              child: Icon(
                                Icons.camera_alt,
                                color: AppColor.blue,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  Spacer(),
                  Visibility(
                    visible: !isUpdated,
                    child: Column(
                      children: [
                        Obx(() {
                          return Text(
                            controller.currentUser.value!.fullname,
                            style: Helper.getTheme(context)
                                .headlineMedium
                                ?.copyWith(
                                  color: AppColor.primary,
                                ),
                          );
                        }),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "+225 ${controller.currentUser.value!.contact}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                                border:
                                    Border.all(color: AppColor.blue, width: 1)),
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
                                border:
                                    Border.all(color: Colors.grey, width: 1.5),
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
                  ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                ],
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
                              border:
                                  Border.all(color: AppColor.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                            color: AppColor.blue,
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
                            Get.dialog(
                              ConfirmDialog(
                                title: "Déconnexion",
                                message:
                                    "Voulez-vous vraiment vous déconnecter ? \n Toutes vos données seront effacer de cet appareil !",
                                testOk: "Oui",
                                testCancel: "Non",
                                functionOk: () {
                                  deconnexion();
                                },
                                functionCancel: () {
                                  Get.back();
                                },
                              ),
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
