import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';
import 'package:ipi/utils/sharedpre.dart';
import 'package:ipi/widgets/distanceChoicesDialog.dart';

class SelectDistanceBloc extends StatefulWidget {
  SelectDistanceBloc({Key? key}) : super(key: key);

  @override
  State<SelectDistanceBloc> createState() => _SelectDistanceBlocState();
}

class _SelectDistanceBlocState extends State<SelectDistanceBloc> {
  _SelectDistanceBlocState();

  late int distance = 1;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  void changeDistance() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return DistanceChoicesDialog();
      },
    );
    getData();
  }

  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();

  Future<void> getData() async {
    distance = int.parse(await sharedPreferencesService.getString('distance'));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeDistance();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "$distance Km",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColor.blue),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.social_distance_rounded,
                  size: 20, color: AppColor.blue),
            ],
          )),
    );
  }
}
