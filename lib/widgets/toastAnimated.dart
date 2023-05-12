import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AnimatedToast extends StatefulWidget {
  final String message;

  AnimatedToast({required this.message});

  @override
  _AnimatedToastState createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<AnimatedToast>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialisation de l'animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);

    // Démarrage de l'animation
    _controller.forward();

    // Fermeture du toast après 3 secondes
    Future.delayed(Duration(seconds: 3), () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Fluttertoast.showToast(
        msg: widget.message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      ),
    );
  }
}
