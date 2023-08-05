import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TakeImageController extends GetxController {
  Rx<File> file = new Rx<File>(File(""));
  RxString base64 = "".obs;
  RxBool ok = false.obs;
  RxBool isOrdonnance = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    file.value = File("");
    base64.value = "";
    ok.value = false;
    isOrdonnance.value = false;
    super.onInit();
  }
}

class TakeImage extends StatefulWidget {
  TakeImage();

  @override
  State<TakeImage> createState() => TakeImageState();
}

class TakeImageState extends State<TakeImage> {
  TakeImageState();

  TakeImageController controller = Get.find();

  final picker = ImagePicker();
  late Future<XFile?> pickedFile = Future.value(null);

  Future<void> _captureImageFromCamera() async {
    pickedFile = picker.pickImage(source: ImageSource.camera);

    pickedFile.then((value) {
      var file = File(value!.path);
      controller.isOrdonnance.value = true;
      controller.ok.value = true;
      controller.file.value = file;
      List<int> imageBytes = file.readAsBytesSync();
      controller.base64.value =
          "data:image/png;base64," + base64Encode(imageBytes);
    });
    Get.back();
  }

  Future<void> _pickImageFromGallery() async {
    pickedFile = picker.pickImage(
      source: ImageSource.gallery,
    );
    pickedFile.then((value) {
      var file = File(value!.path);
      controller.file.value = file;
      controller.isOrdonnance.value = true;
      controller.ok.value = true;
      List<int> imageBytes = file.readAsBytesSync();
      controller.base64.value =
          "data:image/png;base64," + base64Encode(imageBytes);
    });
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white.withOpacity(0.85)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    _captureImageFromCamera();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera,
                        size: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Prendre une photo avec la camera",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 1.5,
                  color: Colors.grey,
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    _pickImageFromGallery();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.image_search_outlined,
                        size: 35,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Choisir une photo dans ma gallerie",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
