import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.maxLine,
    required this.txtController,
  });

  final String hintText;
  final int maxLine;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: txtController,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: AppStyle.txtField,
        ),
        maxLines: maxLine,
      ),
    );
  }
}
