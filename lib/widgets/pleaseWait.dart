import 'package:flutter/material.dart';
import 'package:ipi/const/colors.dart';

class PleaseWait extends StatelessWidget {
  const PleaseWait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            CircularProgressIndicator(color: AppColor.blue),
            SizedBox(
              width: 30,
            ),
            DefaultTextStyle(
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              child: Text("Veuillez patienter ..."),
            )
          ],
        ),
      ),
    );
  }
}
