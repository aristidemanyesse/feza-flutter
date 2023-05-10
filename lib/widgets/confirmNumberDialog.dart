import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/screens/sentOTPScreen.dart';
import '../utils/helper.dart';

class ConfirmNumberDialog extends StatelessWidget {
  final String number;

  ConfirmNumberDialog(this.number);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Helper.getScreenHeight(context) * 0.28,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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
                            Navigator.of(context).pop();
                            Navigator.of(context).pushNamed(
                                SendOTPScreen.routeName,
                                arguments: {"numero": number});
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

class Ligne extends StatelessWidget {
  final String title;
  final bool active;

  Ligne({required this.title, required this.active});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(active ? Icons.check_circle_outline : Icons.close,
              size: 15, color: active ? AppColor.green : Colors.red),
          SizedBox(
            width: 20,
          ),
          Text(
            this.title,
            style: TextStyle(
              fontWeight: active ? FontWeight.w600 : FontWeight.normal,
              fontSize: 12.5,
              color: active ? Colors.black : Colors.grey,
              decoration:
                  active ? TextDecoration.none : TextDecoration.lineThrough,
              decorationThickness: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
