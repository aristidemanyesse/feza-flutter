import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ipi/screens/homeScreen.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/takeImage.dart';

class ShowImage extends StatefulWidget {
  late File file;

  ShowImage(this.file);

  @override
  _ShowImageState createState() => _ShowImageState();
}

class _ShowImageState extends State<ShowImage> {
  TakeImageController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        color: Colors.black.withOpacity(0.6),
        child: Hero(
          tag: "image",
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.file(
                    widget.file,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              Container(
                child: DefaultTextStyle(
                  child: Text(
                    "Votre ordonnance en photo",
                    textAlign: TextAlign.center,
                  ),
                  style: TextStyle(
                      height: 1.7,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.onInit();
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.red, width: 1)),
                      child: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 200,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(color: Colors.green, width: 1)),
                      child: Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
