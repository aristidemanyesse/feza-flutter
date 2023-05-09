import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/widgets/searchBar.dart';
import '../utils/helper.dart';

class SearchedMedicamentListDialog extends StatelessWidget {
  Future<String> getCodeBar() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.DEFAULT);
    print("----------------- $barcodeScanRes");
    return barcodeScanRes;
  }

  Future<String> getScanList() async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", "Annuler", false, ScanMode.DEFAULT);
    print("----------------- $barcodeScanRes");
    return barcodeScanRes;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: Helper.getScreenHeight(context) * 0.55,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white.withOpacity(0.85)),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Helper.getAssetName("pharma1.png", "icons"),
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: Text(
                        "Liste des médicaments".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            height: 1.3,
                            color: Colors.green.shade900),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SearchBar(
                        title: "Recherher médicaments...",
                        onEditionComplete: () {
                          // Navigator.of(context).pushNamed(SearchPage.routeName);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: AppColor.secondary, width: 2)),
                      child: GestureDetector(
                        child: Icon(
                          Icons.file_open_rounded,
                          size: 23,
                        ),
                        onTap: () {
                          this.getScanList();
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          border:
                              Border.all(color: AppColor.secondary, width: 2)),
                      child: GestureDetector(
                        child: Icon(
                          Icons.barcode_reader,
                          size: 23,
                        ),
                        onTap: () {
                          this.getCodeBar();
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  height: 3,
                  thickness: 3,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Ligne(title: "Paracetamol 500mg"),
                        Ligne(title: "Panadol Advence 500mg"),
                        Ligne(title: "Toussifan Verfec"),
                        Ligne(title: "Novalgin 3000"),
                        Ligne(title: "Amoxiline 1000mg"),
                        Ligne(title: "Clamoxyl Enfant/Nourrisson"),
                      ],
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
                      height: 35,
                      width: Helper.getScreenWidth(context) * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white54,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, size: 17, color: AppColor.blue),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Refaire la recherche",
                                style: TextStyle(fontSize: 13),
                              ))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class Ligne extends StatelessWidget {
  String title = "";

  Ligne({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.edit_attributes, size: 19, color: AppColor.placeholder),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 12,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.close, color: Colors.red),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
