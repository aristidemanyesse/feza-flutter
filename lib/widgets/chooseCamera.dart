import 'package:flutter/material.dart';

class ChooseCamera extends StatelessWidget {
  Function cameraFunction = () {};
  Function galleryFunction = () {};

  ChooseCamera({
    required this.cameraFunction,
    required this.galleryFunction,
  });

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
                    cameraFunction();
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
                    galleryFunction();
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
