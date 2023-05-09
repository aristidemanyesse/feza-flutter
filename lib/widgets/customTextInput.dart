import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../const/colors.dart';

class CustomTextInput extends StatelessWidget {
  final String _hintText;
  final VoidCallback _onEditingComplete;
  final ValueChanged<String?>? _onChanged;
  final TextEditingController _controller;
  final TextInputType _keyboard;

  const CustomTextInput({
    required String hintText,
    required TextEditingController controller,
    required VoidCallback onEditingComplete,
    ValueChanged<String?>? onChanged,
    TextInputType keyboard = TextInputType.text,
    Key? key,
  })  : _hintText = hintText,
        _onEditingComplete = onEditingComplete,
        _onChanged = onChanged,
        _controller = controller,
        _keyboard = keyboard,
        super(key: key);

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
        controller: _controller,
        onEditingComplete: _onEditingComplete,
        onChanged: _onChanged,
        textAlign: TextAlign.center,
        keyboardType: _keyboard,
        inputFormatters: [
          LengthLimitingTextInputFormatter(14),
          _CreditCardNumberFormatter(),
        ],
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: _hintText,
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
