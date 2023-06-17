import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/screens/intro1.dart';
import 'package:ipi/screens/intro2.dart';
import 'package:ipi/screens/intro3.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/utils/helper.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

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
      Navigator.of(context).pushReplacementNamed(LandingScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              top: 7,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(LandingScreen.routeName);
                },
                child: Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
