import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/ResponseModel.dart';
import 'package:yebhofon/models/UtilisateurModel.dart';
import 'package:yebhofon/provider/UtilisateurProvider.dart';
import 'package:yebhofon/screens/sentOTPScreen.dart';
import '../utils/helper.dart';

class ConfirmNumberDialog extends StatelessWidget {
  final String number;
  late String uniq;

  ConfirmNumberDialog(this.number);

  Future<void> userRegistration(BuildContext context, String number) async {
    number = number.replaceAll(" ", "");
    uniq = await UtilisateurProvider.getUniqID();
    List<UtilisateurModel> users =
        await UtilisateurProvider.all({"contact": number});
    if (users.isEmpty) {
      UtilisateurModel user = new UtilisateurModel(contact: number, imei: uniq);
      Map<String, dynamic> variables = user.toJson();
      variables["circonscription"] = "7c6a9402-cf80-46d9-8151-5befa42abc52";
      ResponseModel response = await UtilisateurProvider.create(variables);
      if (response.ok) {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(SendOTPScreen.routeName,
            arguments: {"user": response.data, "numero": number});
      } else {
        Fluttertoast.showToast(
          msg: response.message!,
          gravity: ToastGravity.BOTTOM,
        );
      }
    } else {
      UtilisateurModel user = users[0];
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(SendOTPScreen.routeName,
          arguments: {"user": user, "numero": number});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Helper.getScreenHeight(context) * 0.28,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.85)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 5),
                      alignment: Alignment.center,
                      child: Text(
                        "Es-ce bien votre numero ?".toUpperCase(),
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
                    Container(
                      child: Text(
                        "Nous allons envoyer un code à ce numero ...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, height: 1.5, color: Colors.black),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Text("+225 $number",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white54,
                      ),
                      child: TextButton(
                          onPressed: () {
                            userRegistration(context, number);
                          },
                          child: Text(
                            "C'est bien mon numéro !",
                            style: TextStyle(fontSize: 13),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
