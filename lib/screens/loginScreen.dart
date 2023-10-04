import 'package:flutter/material.dart';
import 'package:ipi/components/customTextInput.dart';
import 'package:ipi/components/myLogo.dart';
import 'package:ipi/widgets/confirmNumberDialog.dart';
import '../const/colors.dart';
import '../utils/helper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final myNumeroController = TextEditingController();
  String errorText = "";
  bool checkText = false;
  int numeroLength = 0;
  final myFocusNode = FocusNode();

  bool _checkNumero() {
    String text = myNumeroController.text;
    if (text.startsWith("01") ||
        text.startsWith("05") ||
        text.startsWith("07")) {
      if (myNumeroController.text.length == 14) {
        checkText = true;
        errorText = "";
        myFocusNode.unfocus();
      } else {
        checkText = false;
      }
    } else if (myNumeroController.text.length > 0) {
      checkText = false;
      errorText = 'Renseignez un numéro de téléphone valide !';
    }

    setState(() {});
    return checkText;
  }

  void confirmationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmNumberDialog(myNumeroController.text, "");
      },
    );
  }

  @override
  void initState() {
    myFocusNode.addListener(() {
      if (myFocusNode.hasFocus) {
      } else {}
    });
    super.initState();
  }

  @override
  void dispose() {
    myNumeroController.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        setState(() {});
      },
      child: Scaffold(
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Spacer(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mon compte",
                    style: Helper.getTheme(context).headlineLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.orange),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: MyLogo(
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'On a juste besoin de ton numero de téléphone',
                          style:
                              TextStyle(height: 1.5, color: AppColor.primary),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              border: Border.all(color: AppColor.blue)),
                          child: CustomTextInput(
                            controller: myNumeroController,
                            myFocusNode: myFocusNode,
                            textAlign: TextAlign.center,
                            onChanged: (myNumeroController) {
                              if (myNumeroController!.toString().length == 14) {
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
                          height: 5,
                        ),
                        Text(
                          errorText,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 45,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed:
                                _checkNumero() ? confirmationPopup : null,
                            child: Text("Vérification"),
                          ),
                        )
                      ],
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    height: 20,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("iPi @ Copyright 2023"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
