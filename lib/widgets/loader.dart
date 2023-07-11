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
    _animation = Tween(begin: 1.5, end: 1.0).animate(
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
        Container(
          width: Helper.getScreenWidth(context),
          height: Helper.getScreenHeight(context),
          color: Colors.white.withOpacity(0.5),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset("assets/lotties/search2.json",
                  width: Helper.getScreenWidth(context) * 0.5),
              Text(
                "IPI envoie votre demande aux pharmacies sélectionnées...",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
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
