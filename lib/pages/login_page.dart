// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';

final LoginProvider = StateNotifierProvider<LoginController, LoginData>(
  (ref) {
    return LoginController();
  },
);

class LoginData {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
}

class LoginController extends StateNotifier<LoginData> {
  LoginController() : super(LoginData());

  @override
  void dispose() {
    state.emailController.dispose();
    state.passwordController.dispose();
    super.dispose();
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = LoginData().emailController;
    final passwordController = LoginData().passwordController;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Acesse a Biblioteca',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: AppColors.title,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Entre com suas credenciais e mergulhe em um oceano de livros. Explore, aprenda e descubra novos horizontes literários conosco. ',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.subtitle,
                  ),
                ),
                Text(
                  'Sua jornada de leitura começa aqui!',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.blue,
                  ),
                ),
                const Gap(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-mail',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.title,
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.background,
                      ),
                      child: TextField(
                        controller: emailController,
                        cursorColor: AppColors.blue,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                        ),
                        cursorOpacityAnimates: true,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        scrollPhysics: const BouncingScrollPhysics(),
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.title,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Senha',
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        color: AppColors.title,
                      ),
                    ),
                    const Gap(10),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.background,
                      ),
                      child: TextField(
                        controller: passwordController,
                        cursorColor: AppColors.blue,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                        ),
                        cursorOpacityAnimates: true,
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        obscureText: true,
                        scrollPhysics: const BouncingScrollPhysics(),
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: AppColors.title,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppColors.blue,
                          ),
                          shape: const MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Esqueceu sua senha? ',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppColors.subtitle,
                          ),
                        ),
                        Text(
                          'Clique aqui',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppColors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
