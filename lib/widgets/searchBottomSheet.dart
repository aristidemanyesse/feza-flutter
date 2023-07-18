import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/controllers/AppController.dart';
import 'package:ipi/controllers/DemandeController.dart';
import 'package:ipi/controllers/OfficineController.dart';
import 'package:ipi/controllers/ProduitController.dart';
import 'package:ipi/screens/ProduitsListe.dart';
import 'package:ipi/utils/helper.dart';
import 'package:ipi/widgets/chooseCamera.dart';
import 'package:ipi/widgets/indicator.dart';
import 'package:ipi/widgets/selectCirconscriptionBloc.dart';
import 'package:ipi/widgets/selectDistanceBloc.dart';
import 'package:ipi/widgets/showImage.dart';

class SearchBottomSheet extends StatefulWidget {
  static const routeName = "/SearchBottomSheet";

  SearchBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBottomSheet> createState() => SearchBottomSheetState();
}

class SearchBottomSheetState extends State<SearchBottomSheet> {
  SearchBottomSheetState();

  AppController appController = Get.find();
  OfficineController officineController = Get.find();
  ProduitController produitController = Get.find();
  DemandeController demandeController = Get.find();

  bool ready = true;
  bool wait = false;

  bool isOrdonnance = false;
  late File file;
  late String base64 = "";

  final picker = ImagePicker();
  late Future<XFile?> pickedFile = Future.value(null);

  void showProduitsListe(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return ProduitsListe();
      },
    );
  }

  Future<void> _captureImageFromCamera() async {
    pickedFile = picker
        .pickImage(source: ImageSource.camera)
        .whenComplete(() => setState(() {
              setState(() {});
            }));
    pickedFile.then((value) {
      setState(() {
        isOrdonnance = true;
        file = File(value!.path);
        List<int> imageBytes = file.readAsBytesSync();
        base64 = "data:image/png;base64," + base64Encode(imageBytes);
      });
    });
    Get.back();
  }

  Future<void> _pickImageFromGallery() async {
    pickedFile = picker
        .pickImage(
          source: ImageSource.gallery,
        )
        .whenComplete(() => setState(() {}));
    pickedFile.then((value) {
      setState(() {
        isOrdonnance = true;
        file = File(value!.path);
        List<int> imageBytes = file.readAsBytesSync();
        base64 = base64Encode(imageBytes);
      });
    });
    Get.back();
  }

  @override
  void initState() {
    //  Faire un fitbounds a chaque markeur

    // ever(officineController.officines, (value) {
    //   print("pi dans pou" + value.length.toString());
    //   setState(() {});
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.51,
      maxChildSize: 0.51,
      minChildSize: 0.27,
      builder: (context, scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
              height: Helper.getScreenHeight(context) * 0.48,
              decoration: ShapeDecoration(
                color: Color.fromARGB(255, 245, 239, 235),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Indicator(),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            appController.searchByAround.value = false;
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffe4f3e4),
                                        Color(0xff92cf94)
                                      ],
                                      stops: [0.25, 1],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Recherche zone",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(() {
                                      return Opacity(
                                        child: SelectCirconscriptionBloc(),
                                        opacity:
                                            appController.searchByAround.value
                                                ? 0
                                                : 1,
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              Obx(() {
                                return Visibility(
                                  child: Calque(),
                                  visible: appController.searchByAround.value,
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            appController.searchByAround.value = true;
                          },
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xffe4f3e4),
                                        Color(0xff92cf94)
                                      ],
                                      stops: [0.25, 1],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Périmètre de  ",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10),
                                    Obx(() {
                                      return Opacity(
                                        child: SelectDistanceBloc(),
                                        opacity:
                                            !appController.searchByAround.value
                                                ? 0
                                                : 1,
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              Obx(() {
                                return Visibility(
                                  child: Calque(),
                                  visible: !appController.searchByAround.value,
                                );
                              })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          showProduitsListe(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, // Couleur de la bordure
                                width: 2.0, // Épaisseur de la bordure
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: AppColor.blue,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Rechercher ...",
                                style: TextStyle(
                                  color: AppColor.placeholder,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              border: Border.all(
                                  color: AppColor.secondary, width: 2)),
                          child: Icon(
                            Icons.camera_alt,
                            size: 26,
                          ),
                        ),
                        onTap: () {
                          Get.dialog(ChooseCamera(
                            cameraFunction: _captureImageFromCamera,
                            galleryFunction: _pickImageFromGallery,
                          ));
                        },
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => showProduitsListe(context),
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColor.secondary, width: 1),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffd1d1d1),
                                      Color(0xffffffff)
                                    ],
                                    stops: [0, 1],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Obx(() {
                                    return Text(
                                      produitController.produitsSelected.length
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    );
                                  }),
                                  const SizedBox(width: 7),
                                  Text(
                                    "médicaments",
                                    style: TextStyle(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColor.secondary, width: 1),
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffd1d1d1),
                                    Color(0xffffffff)
                                  ],
                                  stops: [0, 1],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  isOrdonnance ? "1" : "0",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 7),
                                Text(
                                  "ordonnance",
                                  style: TextStyle(
                                      color: Colors.grey[700],
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: Helper.getScreenWidth(context) * 0.2,
                        height: 100,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: AppColor.secondary, width: 1),
                            gradient: LinearGradient(
                              colors: [Color(0xffd1d1d1), Color(0xffffffff)],
                              stops: [0, 1],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: FutureBuilder<XFile?>(
                            future: pickedFile,
                            builder: (context, data) {
                              if (data.hasData) {
                                file = File(data.data!.path);
                                return Hero(
                                  tag: "image",
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(ShowImage(file));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        height: 200.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Image.file(
                                          file,
                                          fit: BoxFit.cover,
                                          height: 200.0,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return Text("...");
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Obx(() {
                        return Container(
                          width: Helper.getScreenWidth(context) * 0.25,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColor.secondary, width: 1),
                              gradient: LinearGradient(
                                colors: [Color(0xffd1d1d1), Color(0xffffffff)],
                                stops: [0, 1],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: !officineController.wait.value
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${officineController.officines.length}",
                                      style: TextStyle(
                                          fontSize: 50,
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "pharmacies trouvées",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              : Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                          height: 35,
                                          width: 35,
                                          child: CircularProgressIndicator(
                                            color: Colors.grey,
                                          )),
                                      const SizedBox(height: 15),
                                      Text(
                                        "patientez...",
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                        );
                      }),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          demandeController.makeDemande(isOrdonnance, base64);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_search,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Faire la demande ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class Calque extends StatelessWidget {
  const Calque({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff464646).withOpacity(0.7),
              Color(0xffd1d1d1).withOpacity(0.7)
            ],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
