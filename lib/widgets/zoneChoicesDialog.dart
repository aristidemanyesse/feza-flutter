import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/CirconscriptionController.dart';
import 'package:ipi/controllers/MapWidgetController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/CirconscriptionModel.dart';
import 'package:ipi/models/ResponseModel.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/provider/UtilisateurProvider.dart';
import '../utils/helper.dart';

class CirconscriptionChoicesDialog extends StatefulWidget {
  const CirconscriptionChoicesDialog({Key? key}) : super(key: key);

  @override
  State<CirconscriptionChoicesDialog> createState() =>
      _CirconscriptionChoicesDialogState();
}

class _CirconscriptionChoicesDialogState
    extends State<CirconscriptionChoicesDialog> {
  CirconscriptionController controller = Get.find();

  late List<CirconscriptionModel> circonscriptions = [];
  late List<CirconscriptionModel> _circonscriptions = [];

  _CirconscriptionChoicesDialogState();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _circonscriptions = controller.circonscriptions.value;
    circonscriptions = controller.circonscriptions.value;
  }

  filter(value) {
    setState(() {
      _circonscriptions = circonscriptions
          .where((item) =>
              item.name.toLowerCase().contains(value.toString().toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        height: Helper.getScreenHeight(context) * 0.6,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.85)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Text(
                "Où êtes-vous situez ?".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.3,
                    color: Colors.green.shade900),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                  width: Helper.getScreenWidth(context) * 0.6,
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: AppColor.placeholderBg,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      filter(value);
                    },
                    keyboardType: TextInputType.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: AppColor.blue, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:
                            BorderSide(color: AppColor.secondary, width: 1.0),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: AppColor.blue,
                      ),
                      hintText: "Rechercher ...",
                      hintStyle: TextStyle(
                        color: AppColor.placeholder,
                        fontSize: 15,
                      ),
                      contentPadding: const EdgeInsets.only(
                        top: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: _circonscriptions.map((item) {
                      return Ligne(circonscription: item);
                    }).toList(),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
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
                        Get.back();
                      },
                      child: Text(
                        "Annuler",
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Ligne extends StatelessWidget {
  final CirconscriptionModel circonscription;
  UtilisateurController userController = Get.find();
  OfficineController officineController = Get.find();
  MapWidgetController mpController = Get.find();

  Ligne({required this.circonscription});

  void changeCirconscription(
      BuildContext context, CirconscriptionModel circonscription) async {
    UtilisateurModel? user = userController.currentUser.value;
    Map<String, dynamic> variables = user!.toJson();
    variables["circonscription"] = circonscription.id;
    ResponseModel response = await UtilisateurProvider.update(variables);
    Get.back();
    if (response.ok) {
      userController.currentUser.value = response.data;
      Get.snackbar("IPI - Changement de zone",
          "Votre zone est maintenant ${circonscription.name}");
      officineController.officinesInZone(mpController.currentPosition.value);
    } else {
      Fluttertoast.showToast(
          msg: "Une erreur s'est produite, veuillez recommencer !",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 14.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        changeCirconscription(context, circonscription);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 7, 0, 7),
              child: Row(
                children: [
                  Icon(
                    Icons.maps_home_work_outlined,
                    size: 19,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Marquee(
                      child: Text(
                        circonscription.name,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      direction: Axis.horizontal,
                      textDirection: TextDirection.ltr,
                      animationDuration: Duration(seconds: 4),
                      backDuration: Duration(milliseconds: 5000),
                      pauseDuration: Duration(milliseconds: 1000),
                      directionMarguee: DirectionMarguee.oneDirection,
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
            )
          ],
        ),
      ),
    );
  }
}
