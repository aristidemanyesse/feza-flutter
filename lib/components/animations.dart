import 'dart:async';
import 'package:flutter/material.dart';

class Clignotement extends StatefulWidget {
  final Widget child;
  final int milliseconds;
  Clignotement({Key? key, required this.child, required this.milliseconds})
      : super(key: key);

  @override
  State<Clignotement> createState() => _ClignotementState();
}

class _ClignotementState extends State<Clignotement> {
  _ClignotementState();

  bool visible = false;
  Timer timer = Timer.periodic(Duration(milliseconds: 0), (timer) {});

  @override
  void initState() {
    clignote();
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void clignote() {
    timer = Timer.periodic(new Duration(milliseconds: widget.milliseconds),
        (timer) {
      setState(() {
        visible = !visible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: widget.child,
      visible: visible,
    );
  }
}
