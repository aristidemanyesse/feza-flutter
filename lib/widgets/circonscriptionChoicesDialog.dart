import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/CirconscriptionModel.dart';
import 'package:yebhofon/models/ResponseModel.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/CirconscriptionProvider.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/screens/homeScreen.dart';
import '../utils/helper.dart';

class CirconscriptionChoicesDialog extends StatefulWidget {
  const CirconscriptionChoicesDialog({Key? key}) : super(key: key);
  static const routeName = "/CirconscriptionChoicesDialog";

  @override
  State<CirconscriptionChoicesDialog> createState() =>
      _CirconscriptionChoicesDialogState();
}

class _CirconscriptionChoicesDialogState
    extends State<CirconscriptionChoicesDialog> {
  late List<CirconscriptionModel> circonscriptions = [];
  late List<CirconscriptionModel> _circonscriptions = [];

  _CirconscriptionChoicesDialogState();

  @override
  void initState() {
    super.initState();
    CirconscriptionProvider.all({}).then((datas) {
      setState(() {
        _circonscriptions = circonscriptions = datas;
      });
    });
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
                        Navigator.of(context).pop();
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

  Ligne({required this.circonscription});

  void changeCirconscription(BuildContext context, String circId) async {
    bool test = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String uniq = await UtilisateurProvider.getUniqID();
    if (userId != null) {
      List<UtilisateurModel> users =
          await UtilisateurProvider.all({"id": userId, "imei": uniq});
      if (users.isNotEmpty) {
        UtilisateurModel user = users[0];
        Map<String, dynamic> variables = user.toJson();
        variables["circonscription"] = circId;
        ResponseModel response = await UtilisateurProvider.update(variables);
        if (response.ok) {
          test = true;
          Fluttertoast.showToast(
              msg: "Votre nouvelle zone est : ${circonscription.name} ",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green.shade600,
              textColor: Colors.white,
              fontSize: 14.0);
          Navigator.pop(context);
        }
      }
    }
    if (!test) {
      Navigator.pop(context, false);
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
        changeCirconscription(context, circonscription.id!);
      },
      child: Container(
        child: Column(
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
                    width: 15,
                  ),
                  Text(
                    circonscription.name,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  )
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
