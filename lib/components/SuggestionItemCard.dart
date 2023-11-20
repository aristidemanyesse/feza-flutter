import 'package:flutter/material.dart';
import 'package:ipi/models/ProduitModel.dart';
import 'package:ipi/webservice/apiservice.dart';
import 'package:marquee_widget/marquee_widget.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class SuggestionItemCard extends StatelessWidget {
  final ProduitModel produit;
  final String image;

  SuggestionItemCard({required this.produit})
      : image = ApiService.BASE_URL + produit.image!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network(
              //   this.image,
              //   width: 60,
              //   height: 35,
              // ),
              Image.asset(
                "assets/images/icons/med.jpg",
                width: 30,
                height: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Marquee(
                      child: Text(
                        this.produit.name,
                        style: Helper.getTheme(context)
                            .headlineMedium
                            ?.copyWith(color: AppColor.primary, fontSize: 14),
                      ),
                      direction: Axis.horizontal,
                      textDirection: TextDirection.ltr,
                      animationDuration: Duration(seconds: 4),
                      backDuration: Duration(milliseconds: 5000),
                      pauseDuration: Duration(milliseconds: 1000),
                      directionMarguee: DirectionMarguee.oneDirection,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      this.produit.forme ?? "",
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 2,
        )
      ],
    );
  }
}
