import 'package:flutter/material.dart';
import 'package:yebhofon/const/colors.dart';

class SearchBar extends StatelessWidget {
  final String title;
  VoidCallback onEditionComplete;

  SearchBar({required this.title, required this.onEditionComplete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: AppColor.placeholderBg,
      ),
      child: TextField(
        onEditingComplete: onEditionComplete,
        keyboardType: TextInputType.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.blue, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            borderSide: BorderSide(color: AppColor.secondary, width: 1.0),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColor.blue,
          ),
          hintText: title,
          hintStyle: TextStyle(
            color: AppColor.placeholder,
            fontSize: 15,
          ),
          contentPadding: const EdgeInsets.only(
            top: 15,
          ),
        ),
      ),
    );
  }
}
