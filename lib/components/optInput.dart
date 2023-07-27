import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipi/const/colors.dart';

class OTPInput extends StatelessWidget {
  final FocusNode focusNode = FocusNode();
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  OTPInput({Key? key, required this.controller, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        controller: controller,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 35),
        textInputAction: TextInputAction.next,
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "_",
          hintStyle: TextStyle(
            fontSize: 30,
            color: AppColor.placeholder,
          ),
          contentPadding: EdgeInsets.only(top: 15, left: 4),
        ),
      ),
    );
  }
}
