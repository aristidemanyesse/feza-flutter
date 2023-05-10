import 'package:flutter/material.dart';
import 'package:yebhofon/models/ProduitModel.dart';

import '../const/colors.dart';
import '../utils/helper.dart';

class SuggestionItemCard extends StatelessWidget {
  final ProduitModel produit;
  final String image;

  SuggestionItemCard({required this.produit})
      : image = "http://192.168.1.14:8005/" + produit.image!;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                this.image,
                width: 50,
                height: 30,
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.produit.name,
                      style: Helper.getTheme(context)
                          .headlineMedium
                          ?.copyWith(color: AppColor.primary, fontSize: 14),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      this.produit.description,
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