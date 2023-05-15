import 'package:draggable_bottom_sheet/draggable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:yebhofon/screens/pharmaciesGardeBackground.dart';
import 'package:yebhofon/screens/pharmaciesGardeExpanded.dart';
import 'package:yebhofon/screens/pharmaciesGardePreview.dart';

class PharmaciesGarde extends StatelessWidget {
  static const routeName = "/pharmaciesGarde";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableBottomSheet(
        minExtent: MediaQuery.of(context).size.height * 0.15,
        useSafeArea: false,
        curve: Curves.easeIn,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        previewWidget: PharmaciesGardePreview(),
        expandedWidget: PharmaciesGardeExpanded(),
        backgroundWidget: PharmaciesGardeBackground(),
        duration: const Duration(milliseconds: 10),
        maxExtent: MediaQuery.of(context).size.height * 0.5,
        onDragging: (pos) {},
      ),
    );
  }
}
