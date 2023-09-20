import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/UserController.dart';
import 'package:ipi/widgets/pleaseWait.dart';

class ConfirmNumberDialog extends StatelessWidget {
  final String number;
  final String name;
  late String uniq = "";

  ConfirmNumberDialog(this.number, this.name);

  UtilisateurController controller = Get.find();

  Future<void> userRegistration(BuildContext context, String number) async {
    String contact = number.replaceAll(" ", "");
    Get.dialog(PleaseWait(), barrierDismissible: false);

    controller.createUser(name, contact);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(0.85)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                alignment: Alignment.center,
                child: Text(
                  "Est-ce bien votre numero ?".toUpperCase(),
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
                  "Nous allons envoyer un code SMS à ce numero ...",
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 14, height: 1.5, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text("+225 $number",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: AppColor.blue),
                      color: Colors.white54,
                    ),
                    child: TextButton(
                      onPressed: () {
                        userRegistration(context, number);
                      },
                      child: Text(
                        "C'est bien mon numéro !",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}
