import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/screens/landingScreen.dart';
import 'package:yebhofon/utils/helper.dart';
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
      "desc": "Accédez rapidement aux médicaments dont vous avez besoin"
    },
    {
      "image": "https://assets6.lottiefiles.com/packages/lf20_y08pkYYcW6.json",
      "title": "Trouve les pharmarcies à proximité",
      "desc":
          "Localisez les pharmacies les plus proches avec vos médicaments en stock"
    },
    {
      "image": "https://assets9.lottiefiles.com/packages/lf20_pgkm3te7.json",
      "title": "Economise ton temps et ton argent",
      "desc": "Économisez votre temps, votre argent et évitez les tracas"
    },
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
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
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
            child: Stack(
          children: [
            Padding(
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
                        return Lottie.network(_pages[count]["image"]!);
                      },
                      itemCount: _pages.length,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 2,
                        width: 10,
                      ),
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
                        child: SizedBox(
                          height: 1,
                          width: 5,
                        ),
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
                    style: TextStyle(height: 1.5, fontSize: 15),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          nextFunction(count);
                        },
                        child: count < 2
                            ? Text("Suivant")
                            : Text("Je suis prêt !")),
                  ),
                  Spacer()
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacementNamed(LandingScreen.routeName);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Passer >>",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: AppColor.blue.withOpacity(0.07)),
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
