import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_style.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/custom_field.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

    final emailController = TextEditingController();
    final senhaController = TextEditingController();
    final nomeController = TextEditingController();
    final rmController = TextEditingController();
    final contatoController = TextEditingController();

    String? cursosSelecionado = '1º DSMTEC';

    final cursos = {
      const DropdownMenuItem(
        value: '1º DSMTEC',
        child: Text(
          '1º DSMTEC',
        ),
      ),
      const DropdownMenuItem(
        value: '2º DSMTEC',
        child: Text(
          '2º DSMTEC',
        ),
      ),
      const DropdownMenuItem(
        value: '3º DSMTEC',
        child: Text(
          '3º DSMTEC',
        ),
      ),
    };

    Future<bool> rmExists(String rm) async {
      final usersCollection = FirebaseFirestore.instance.collection('users');
      final userSnapshot =
          await usersCollection.where('rm', isEqualTo: rm).get();

      return userSnapshot.docs.isNotEmpty;
    }

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            LottieBuilder.network(
                              'https://lottie.host/5b7d0452-225c-4133-b237-7980a97c17b7/E8G9WvzaGQ.json',
                              height: 300,
                              repeat: true,
                              alignment: Alignment.center,
                            ),
                            const Gap(20),
                            Text(
                              'Olá, seja bem vindo(a) 👋',
                              style: AppStyle.title1,
                            ),
                            Text(
                              'Crie sua conta e explore nossa biblioteca!',
                              style: AppStyle.title3,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Text(
                        'Email',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: 'Informe o email',
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                        controller: emailController,
                      ),
                      const Gap(20),
                      Text(
                        'Senha',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: 'Informe a senha',
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                        controller: senhaController,
                      ),
                      const Gap(20),
                      Text(
                        'Nome Completo',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: 'Informe seu nome completo',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: nomeController,
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'RM',
                                  style: AppStyle.title2,
                                ),
                                const Gap(10),
                                CustomField(
                                  hintText: 'Informe seu RM',
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  controller: rmController,
                                ),
                              ],
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Curso',
                                  style: AppStyle.title2,
                                ),
                                const Gap(10),
                                CustomDropDown(
                                  items: List.of(cursos),
                                  selectedValue: cursosSelecionado,
                                  onChanged: (value) {
                                    cursosSelecionado = value;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        'Contato',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: '(00) 0000-0000',
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        controller: contatoController,
                      ),
                      const Gap(20),
                      SizedBox(
                        height: 80,
                        width: double.infinity,
                        child: FilledButton(
                          style: ButtonStyle(
                            elevation: const MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(
                              AppStyle.primary,
                            ),
                            shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (emailController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Informe o email',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            } else if (senhaController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Informe a senha',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            } else if (nomeController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Informe seu nome completo',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            } else if (rmController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Informe seu RM',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            } else if (contatoController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Informe seu contato',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            } else if (await rmExists(rmController.text)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'O número do RM já está cadastrado. Por favor, informe outro número.',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                ),
                              );
                            } else {
                              int contato;

                              try {
                                contato = int.parse(contatoController.text);
                              } catch (e) {
                                return;
                              }

                              if (cursosSelecionado != null) {
                                cursosSelecionado = cursosSelecionado;
                              }

                              try {
                                await authService.createUser(
                                  emailController.text,
                                  senhaController.text,
                                  nomeController.text,
                                  rmController.text,
                                  contato,
                                  cursosSelecionado.toString(),
                                );

                                Navigator.of(context)
                                    .pushNamed(AppRoutes.homePage);
                              } on FirebaseAuthException catch (e) {
                                switch (e.code) {
                                  case 'weak-password':
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'A senha é muito fraca',
                                          style: AppStyle.subtitle,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      ),
                                    );
                                    break;
                                  case 'email-already-in-use':
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Email já está em uso',
                                          style: AppStyle.subtitle,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      ),
                                    );
                                    break;
                                  default:
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Ocorreu um erro. Tente novamente mais tarde.',
                                          style: AppStyle.subtitle,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      ),
                                    );
                                }
                              }
                            }
                          },
                          child: Text(
                            'Acessar',
                            style: AppStyle.title2,
                          ),
                        ),
                      ),
                      const Gap(20),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(AppRoutes.loginPage);
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Possui uma conta?',
                              style: GoogleFonts.inter(
                                color: AppStyle.gray,
                              ),
                            ),
                            const Gap(4),
                            Text(
                              'Login',
                              style: GoogleFonts.inter(
                                color: AppStyle.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
