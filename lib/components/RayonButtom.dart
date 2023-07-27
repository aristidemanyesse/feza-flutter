import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/widgets/searchBottomSheet.dart';

class RayonButton extends StatelessWidget {
  final int radius;
  RayonButton(this.radius);
  AppController appController = Get.find();
  SearchBottomSheetController controller = Get.find();

  bool valide() {
    return appController.radius.value == radius &&
        appController.searchByAround.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        appController.searchByAround.value = true;
        appController.radius.value = radius;
        controller.page.value = 1;
      },
      child: Obx(() {
        return GestureDetector(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 7),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                color: valide() ? AppColor.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: AppColor.blue, width: 1)),
            child: Text(
              "$radius Km",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: valide() ? Colors.white : AppColor.blue),
            ),
          ),
        );
      }),
    );
  }
}
