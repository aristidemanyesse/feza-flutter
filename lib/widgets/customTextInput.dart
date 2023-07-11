import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  final String hintText;
  final VoidCallback onEditingComplete;
  final ValueChanged<String?> onChanged;
  final TextEditingController controller;
  final TextInputType keyboard;
  final FocusNode myFocusNode;

  const CustomTextInput({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onEditingComplete,
    required this.myFocusNode,
    required this.onChanged,
    required this.keyboard,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: ShapeDecoration(
        color: AppColor.placeholderBg,
        shape: StadiumBorder(),
      ),
      child: TextField(
        focusNode: myFocusNode,
        controller: controller,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        keyboardType: keyboard,
        inputFormatters: keyboard == TextInputType.number
            ? [
                LengthLimitingTextInputFormatter(14),
                _CreditCardNumberFormatter(),
              ]
            : [],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: AppColor.placeholder,
          ),
        ),
      ),
    );
  }
}

class _CreditCardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = _getFormattedText(newValue.text);
    return newValue.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length));
  }

  String _getFormattedText(String text) {
    text = text.replaceAll(" ", "");
    final inputLength = text.length;
    if (inputLength <= 2) {
      return text;
    } else if (inputLength <= 4) {
      return '${text.substring(0, 2)} ${text.substring(2, text.length)}';
    } else if (inputLength <= 6) {
      return '${text.substring(0, 2)} ${text.substring(2, 4)} ${text.substring(4, text.length)}';
    } else if (inputLength <= 8) {
      return '${text.substring(0, 2)} ${text.substring(2, 4)} ${text.substring(4, 6)} ${text.substring(6, text.length)}';
    } else {
      return '${text.substring(0, 2)} ${text.substring(2, 4)} ${text.substring(4, 6)} ${text.substring(6, 8)} ${text.substring(8, text.length)}';
    }
  }
}
