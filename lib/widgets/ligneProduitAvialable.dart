import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';

class Ligne extends StatelessWidget {
  final String title;
  final String forme;
  final bool active;

  Ligne({required this.title, required this.forme, required this.active});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(active ? Icons.check_circle_outline : Icons.close,
              size: 20, color: active ? AppColor.green : Colors.red),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                this.title,
                style: TextStyle(
                  fontWeight: active ? FontWeight.w600 : FontWeight.normal,
                  fontSize: 14,
                  color: active ? Colors.black : Colors.grey,
                  decoration:
                      active ? TextDecoration.none : TextDecoration.lineThrough,
                  decorationThickness: 2.0,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                forme,
                style: TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class LigneSearched extends StatelessWidget {
  String title = "";

  LigneSearched({required this.title});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
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
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            child: Icon(Icons.delete_forever, color: Colors.red),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
