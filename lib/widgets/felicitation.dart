import 'package:flutter/material.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:lottie/lottie.dart';

class FelicitationScreen extends StatefulWidget {
  @override
  _FelicitationScreenState createState() => _FelicitationScreenState();
}

class _FelicitationScreenState extends State<FelicitationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          color: Colors.white.withOpacity(0.85),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Lottie.asset("assets/lotties/felicitation.json",
                  width: Helper.getScreenWidth(context) * 0.5),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Nous avons envoyé vos demandes aux pharmacies concernées, elles vous repondront dans quelques instants ...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      height: 1.7,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              SizedBox(
                height: Helper.getScreenHeight(context) * 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.transparent,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context)
                            .pushReplacementNamed(HomeScreen.routeName);
                      },
                      child: Text(
                        "OK, j'ai compris",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 7, 190, 172)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: Helper.getScreenHeight(context) * 0.1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
