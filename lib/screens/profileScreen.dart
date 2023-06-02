import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/models/UtilisateurModel.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/utils/helper.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profileScreen";
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  late UtilisateurModel user;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    setState(() {
      user = arguments["user"];
    });

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
                    Stack(children: [
                      ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            Helper.getAssetName(
                              "user.jpg",
                              "icons",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Positioned(
                      //   bottom: -3,
                      //   left: 70,
                      //   child: Container(
                      //       child: Icon(
                      //     Icons.camera_alt,
                      //     color: AppColor.blue,
                      //     size: 35,
                      //   )),
                      // ),
                    ]),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      user.fullname ?? "_",
                      style: Helper.getTheme(context).headlineMedium?.copyWith(
                            color: AppColor.primary,
                          ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(user.contact ?? "_"),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomFormImput(
                            label: "Nom & prénoms",
                            value: user.fullname ?? "",
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          CustomFormImput(
                            label: "Circonscription",
                            value: user.circonscription?.name ?? "...",
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // CustomFormImput(
                          //   label: "Mes assurances",
                          //   value: "AssuB, COOPECJ, GENEASSUR",
                          // ),
                          // SizedBox(
                          //   height: 45,
                          // ),
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
          Container(
            height: Helper.getScreenHeight(context) * 0.13,
            width: Helper.getScreenWidth(context),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.4],
                colors: [
                  Colors.black.withOpacity(0.9),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
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
