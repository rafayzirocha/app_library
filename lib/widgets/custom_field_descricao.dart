import 'package:flutter/material.dart';

import '../constants/app_style.dart';

class CustomFieldDescricao extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType keyboardType;
  final int maxLines;
  final Function? onChanged;

  const CustomFieldDescricao({
    Key? key,
    this.controller,
    this.onChanged,
    required this.hintText,
    required this.keyboardType,
    required this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppStyle.dark2,
      ),
      child: TextFormField(
        cursorColor: AppStyle.primary,
        autocorrect: true,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
          hintText: hintText,
        ),
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: AppStyle.title3,
        onChanged: (value) {
          if (onChanged != null) {
            onChanged!(value);
          }
        },
      ),
    );
  }
}
