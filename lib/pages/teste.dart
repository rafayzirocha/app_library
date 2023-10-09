import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Teste extends StatelessWidget {
  const Teste({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              LottieBuilder.network(
                'https://lottie.host/bd22b317-45ee-4ba3-9374-c12dfe7109dd/gR0PHtk8fq.json',
                height: 200,
                width: 200,
                repeat: true,
                alignment: Alignment.center,
              ),
              Text('Nada por aqui...'),
            ],
          ),
        ),
      ),
    );
  }
}
