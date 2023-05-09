import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/screens/landingScreen.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/widgets/customNavBar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = "/profileScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              Helper.getAssetName("login_bg.png", "virtual"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: Helper.getScreenHeight(context) * 0.15,
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
                    Stack(children: [
                      ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            Helper.getAssetName(
                              "user.jpg",
                              "real",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -3,
                        left: 70,
                        child: Container(
                            child: Icon(
                          Icons.camera_alt,
                          color: AppColor.blue,
                          size: 35,
                        )),
                      ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "Emilia Shadrak",
                      style: Helper.getTheme(context).headlineMedium?.copyWith(
                            color: AppColor.primary,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("01 02 03 0405"),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomFormImput(
                            label: "Nom & prénoms",
                            value: "Emilia Clarke",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Circonscription",
                            value: "Port-Bouet",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomFormImput(
                            label: "Mes assurances",
                            value: "AssuB, COOPECJ, GENEASSUR",
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Enregistrer les modifications"),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              profile: true,
            ),
          ),
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
