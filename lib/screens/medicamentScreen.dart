import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/customNavBar.dart';

class MedicamentScreen extends StatelessWidget {
  static const routeName = "/individualScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: Helper.getScreenHeight(context) * 0.4,
                      width: Helper.getScreenWidth(context),
                      child: Image.asset(
                        Helper.getAssetName("pizza3.jpg", "real"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: Helper.getScreenHeight(context) * 0.4,
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
                    ),
                    SafeArea(
                        child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Helper.getScreenHeight(context) * 0.25,
                      ),
                      Container(
                        height: Helper.getScreenHeight(context) * 0.65,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 30),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Paracetamol 500mg",
                                    style:
                                        Helper.getTheme(context).headlineSmall,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: AppColor.green,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: AppColor.green,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: AppColor.green,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: AppColor.green,
                                              ),
                                              Icon(
                                                Icons.star,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Sur ordonnance seulement",
                                            style: TextStyle(
                                                color: Colors.orangeAccent,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "15 050",
                                              style: TextStyle(
                                                color: AppColor.primary,
                                                fontSize: 30,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "Fcfa",
                                              style: TextStyle(
                                                color: AppColor.primary,
                                                fontSize: 12,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Description",
                                                style: Helper.getTheme(context)
                                                    .headlineMedium
                                                    ?.copyWith(
                                                      fontSize: 16,
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada",
                                                style: TextStyle(height: 1.3),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: AppColor.placeholder,
                                          thickness: 1.5,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Recommendation",
                                                style: Helper.getTheme(context)
                                                    .headlineMedium
                                                    ?.copyWith(
                                                      fontSize: 16,
                                                    ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada",
                                                style: TextStyle(height: 1.3),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      )
                    ]))
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
