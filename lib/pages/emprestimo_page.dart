import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmprestimoPage extends ConsumerWidget {
  const EmprestimoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppStyle.dark1,
      appBar: AppBar(
        backgroundColor: AppStyle.dark1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 18,
            color: AppStyle.white,
          ),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
