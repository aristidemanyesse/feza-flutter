import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/widgets/distanceChoicesDialog.dart';

class SelectDistanceBloc extends StatefulWidget {
  SelectDistanceBloc({Key? key}) : super(key: key);

  @override
  State<SelectDistanceBloc> createState() => _SelectDistanceBlocState();
}

class _SelectDistanceBlocState extends State<SelectDistanceBloc> {
  _SelectDistanceBlocState();

  AppController appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(DistanceChoicesDialog());
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Obx(() {
              int distance = appController.radius.value;
              return Text(
                "$distance Km",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blue),
              );
            }),
            SizedBox(
              width: 10,
            ),
            Icon(Icons.social_distance_rounded, size: 20, color: AppColor.blue),
          ],
        ),
      ),
    );
  }
}
