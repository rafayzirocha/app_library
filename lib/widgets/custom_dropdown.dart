import 'package:flutter/material.dart';

import '../constants/app_style.dart';

class CustomDropDown extends StatelessWidget {
  final String? selectedValue;
  final ValueChanged<String?>? onChanged;
  final List<DropdownMenuItem<String>> items;

  const CustomDropDown({
    Key? key,
    this.selectedValue,
    this.onChanged,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppStyle.dark2,
      ),
      child: DropdownButtonFormField<String>(
        alignment: Alignment.center,
        style: AppStyle.title3,
        borderRadius: BorderRadius.circular(12),
        elevation: 0,
        icon: Icon(
          Icons.arrow_drop_down_rounded,
          size: 18,
          color: AppStyle.gray,
        ),
        dropdownColor: AppStyle.dark2,
        value: selectedValue,
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 20, right: 20),
        ),
        items: items,
        onChanged: onChanged,
      ),
    );
  }
}
