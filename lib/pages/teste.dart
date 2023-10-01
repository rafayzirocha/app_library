import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _TesteState();
}

final items = {
  const DropdownMenuItem(
    value: '1',
    child: Text(
      'Português',
    ),
  ),
  const DropdownMenuItem(
    value: '2',
    child: Text(
      'Inglês',
    ),
  ),
  const DropdownMenuItem(
    value: '3',
    child: Text(
      'Espanhol',
    ),
  ),
  const DropdownMenuItem(
    value: '4',
    child: Text(
      'sdasdas',
    ),
  ),
};

class _TesteState extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.dark1,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomField(
                hintText: 'Nome',
                keyboardType: TextInputType.name,
                maxLines: 1,
              ),
              const Gap(20),
              CustomDropDown(
                items: List.of(items),
                selectedValue: '1',
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
