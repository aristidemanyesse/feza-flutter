import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/screens/intro1.dart';
import 'package:ipi/screens/intro2.dart';
import 'package:ipi/screens/intro3.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/utils/helper.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  int count = 0;
  final List<Widget> _pages = [Intro1(), Intro2(), Intro3()];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void nextFunction(int index) {
    if (count < 2) {
      setState(() {
        count += 1;
      });
    } else {
      Get.off(LandingScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 245, 239, 235),
        body: Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          child: SafeArea(
              child: Stack(
            children: [
              Container(
                child: Column(
                  children: [],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      count = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    return _pages[count];
                  },
                  itemCount: _pages.length,
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor:
                          count == 0 ? AppColor.blue : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 3,
                      backgroundColor:
                          count == 1 ? AppColor.blue : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 3,
                      child: SizedBox(
                        height: 1,
                        width: 5,
                      ),
                      backgroundColor:
                          count == 2 ? AppColor.blue : AppColor.placeholder,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: GestureDetector(
                  onTap: () {
                    Get.to(LandingScreen());
                  },
                  child: Text(
                    "Passer",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
