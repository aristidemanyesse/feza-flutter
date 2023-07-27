import 'package:csshadow/csshadow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/colors.dart';
import '../screens/homeScreen.dart';
import '../screens/menuScreen.dart';
import '../screens/profileScreen.dart';
import '../utils/helper.dart';

class CustomNavBar extends StatelessWidget {
  final bool home;
  final bool menu;
  final bool offer;
  final bool profile;
  final bool more;

  const CustomNavBar(
      {Key? key,
      this.home = false,
      this.menu = false,
      this.offer = false,
      this.profile = false,
      this.more = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: Helper.getScreenWidth(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: CsShadow(
              shadow: BoxShadow(
                  color: AppColor.placeholder,
                  offset: Offset(0, 15),
                  blurRadius: 5.0,
                  spreadRadius: 4),
              clipper: CustomNavBarClipper(),
              child: Container(
                height: 60,
                width: Helper.getScreenWidth(context),
                padding: const EdgeInsets.symmetric(horizontal: 50),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (!menu) {
                          Get.off(MenuScreen());
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.menu_book_rounded,
                              size: menu ? 32 : 25,
                              color:
                                  menu ? AppColor.green : AppColor.placeholder),
                          SizedBox(
                            height: 5,
                          ),
                          Text("Menu",
                              style: TextStyle(
                                  color: menu
                                      ? AppColor.green
                                      : AppColor.placeholder))
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (!profile) {
                          Get.off(ProfileScreen());
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_4_rounded,
                              size: profile ? 29 : 22,
                              color: profile
                                  ? AppColor.green
                                  : AppColor.placeholder),
                          SizedBox(
                            height: 3,
                          ),
                          Text("Mon profil",
                              style: TextStyle(
                                  color: profile
                                      ? AppColor.green
                                      : AppColor.placeholder))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                elevation: 15,
                backgroundColor: Colors.white,
                onPressed: () {
                  if (!home) {
                    Get.off(HomeScreen());
                  }
                },
                child: home
                    ? Image.asset(
                        Helper.getAssetName("pharma.png", "icons"),
                        width: 40,
                      )
                    : Image.asset(
                        Helper.getAssetName("pharma1.png", "icons"),
                        width: 40,
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, 0);
    path.quadraticBezierTo(
      size.width * 0.375,
      0,
      size.width * 0.375,
      size.height * 0.1,
    );
    path.cubicTo(
      size.width * 0.4,
      size.height * 0.9,
      size.width * 0.6,
      size.height * 0.9,
      size.width * 0.625,
      size.height * 0.1,
    );
    path.quadraticBezierTo(
      size.width * 0.625,
      0,
      size.width * 0.7,
      0.1,
    );
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
