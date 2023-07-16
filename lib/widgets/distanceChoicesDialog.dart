import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:marquee_widget/marquee_widget.dart';

class DistanceChoicesDialog extends StatefulWidget {
  const DistanceChoicesDialog({Key? key}) : super(key: key);

  @override
  State<DistanceChoicesDialog> createState() => _DistanceChoicesDialogState();
}

class _DistanceChoicesDialogState extends State<DistanceChoicesDialog> {
  late List<String> distances = ["1", "2", "3", "5", "10"];

  _DistanceChoicesDialogState();

  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white.withOpacity(0.85)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 5),
              alignment: Alignment.center,
              child: Text(
                "Quel périmètre vous convient ?".toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    height: 1.3,
                    color: Colors.green.shade900),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: distances.map((item) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          child: Ligne(distance: item),
                          onTap: () {
                            appController.radius.value = int.parse(item);
                            Get.back();
                          },
                        ),
                        Divider(
                          height: 3,
                        )
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.transparent,
                  ),
                  child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text(
                        "Annuler",
                        style: TextStyle(fontSize: 15, color: Colors.red),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Ligne extends StatelessWidget {
  final String distance;
  Ligne({required this.distance});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 7, 0, 7),
      width: double.infinity,
      child: Row(
        children: [
          Icon(
            Icons.social_distance_rounded,
            size: 19,
          ),
          SizedBox(
            width: 12,
          ),
          Marquee(
            child: Text(
              "$distance Km",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            direction: Axis.horizontal,
            textDirection: TextDirection.ltr,
            animationDuration: Duration(seconds: 4),
            backDuration: Duration(milliseconds: 5000),
            pauseDuration: Duration(milliseconds: 1000),
            directionMarguee: DirectionMarguee.oneDirection,
          ),
        ],
      ),
    );
  }
}
