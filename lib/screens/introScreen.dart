import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/screens/landingScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:lottie/lottie.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  int count = 0;
  final List<Map<String, String>> _pages = [
    {
      "image": "https://assets9.lottiefiles.com/temp/lf20_8wtnLF.json",
      "title": "Scanne ton ordonnance",
      "desc":
          "Discover the best foods from over 1,000 restaurants and fast delivery to your doorstep"
    },
    {
      "image": "https://assets6.lottiefiles.com/packages/lf20_y08pkYYcW6.json",
      "title": "Trouve les pharmarcies à proximité",
      "desc": "Fast food delivery to your home, office wherever you are"
    },
    {
      "image": "https://assets9.lottiefiles.com/packages/lf20_pgkm3te7.json",
      "title": "Economise ton temps et ton argent",
      "desc":
          "Real time tracking of your food on the app once you placed the order"
    },
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: 400,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Lottie.network(_pages[index]["image"]!);
                    },
                    itemCount: _pages.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 0 ? AppColor.blue : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 1 ? AppColor.blue : AppColor.placeholder,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          count == 2 ? AppColor.blue : AppColor.placeholder,
                    )
                  ],
                ),
                Spacer(),
                Text(
                  _pages[count]["title"]!,
                  textAlign: TextAlign.center,
                  style: Helper.getTheme(context).titleLarge,
                ),
                Spacer(),
                Text(
                  _pages[count]["desc"]!,
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(LandingScreen.routeName);
                      },
                      child: Text("Je suis prêt !")),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
