import 'package:flutter/material.dart';
import 'package:ipi/utils/helper.dart';
import 'package:lottie/lottie.dart';

class LoaderScreen extends StatefulWidget {
  @override
  _LoaderScreenState createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    )..repeat(reverse: true);
    _animation = Tween(begin: 2.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
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
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Center(
              child: Image.asset(
            'assets/images/bg/carte_bg.png',
            repeat: ImageRepeat.repeatY,
            width: Helper.getScreenWidth(context),
            height: Helper.getScreenHeight(context),
          )), // Remplacez par votre propre image
        ),
        Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          color: Colors.white.withOpacity(0.75),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Lottie.asset("assets/lotties/search2.json",
                      width: Helper.getScreenWidth(context) * 0.8)
                ],
              ),
              Text(
                "IPI recherche les pharmacies ...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )
            ],
          ),
        ),
      ],
    );
  }
}

// Exemple d'utilisation dans un écran ou un widget
class MyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoaderScreen(),
      ),
    );
  }
}
