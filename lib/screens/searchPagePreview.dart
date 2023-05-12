import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';
import 'package:yebhofon/models/OfficineModel.dart';
import 'package:yebhofon/models/ProduitModel.dart';
import 'package:yebhofon/utils/helper.dart';
import 'package:yebhofon/widgets/bounceAnimation.dart';
import 'package:yebhofon/widgets/indicator.dart';
import 'package:yebhofon/widgets/selectCirconscriptionBloc.dart';

class SearchPagePreview extends StatefulWidget {
  static const routeName = "/SearchPagePreview";
  final List<Map<OfficineModel, List<ProduitModel>>> tableauxOfficines;
  const SearchPagePreview({Key? key, required this.tableauxOfficines})
      : super(key: key);

  @override
  State<SearchPagePreview> createState() => _SearchPagePreviewState();
}

class _SearchPagePreviewState extends State<SearchPagePreview> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(15, 5, 15, 0),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Circonscription"),
                    SelectCirconscriptionBloc(),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 5,
                  color: Colors.grey.shade300,
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.tableauxOfficines.length} pharmacies de garde trouvées",
                    style: TextStyle(
                        color: AppColor.green, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BounceAnimation(
                  duration: Duration(milliseconds: 500),
                  maxHeight: 25.0,
                  child: Indicator(),
                )
              ],
            ),
          ],
        ));
  }
}
