// ignore_for_file: use_build_context_synchronously

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

final authStateProvider = StateProvider<User?>(
  (ref) => FirebaseAuth.instance.currentUser,
);

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final authState = ref.watch(authStateProvider);
    final emailController = TextEditingController();
    final senhaController = TextEditingController();

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomField(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                controller: emailController,
              ),
              const Gap(20),
              CustomField(
                hintText: 'Senha',
                keyboardType: TextInputType.visiblePassword,
                maxLines: 1,
                controller: senhaController,
                obscureText: true,
              ),
              const Gap(20),
              SizedBox(
                height: 45,
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
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    final email = emailController.text;
                    final password = senhaController.text;

                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      Navigator.of(context).pushNamed(AppRoutes.bookPage);
                      CustomMsgSuccess(
                        context,
                        'Olá!',
                        'Creio que uma forma de felicidade é a leitura.',
                      );
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 0,
                            backgroundColor: AppStyle.dark1,
                            showCloseIcon: true,
                            closeIconColor: AppStyle.gray,
                            content: Text(
                              'Email não encontrado',
                              style: AppStyle.subtitle,
                            ),
                            duration: const Duration(seconds: 5),
                          ),
                        );
                      } else if (e.code == 'wrong-password') {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            elevation: 0,
                            backgroundColor: AppStyle.dark1,
                            showCloseIcon: true,
                            closeIconColor: AppStyle.gray,
                            content: Text(
                              'Senha incorreta. Tente novamente',
                              style: AppStyle.subtitle,
                            ),
                            duration: const Duration(seconds: 5),
                          ),
                        );
                      } else if (emailController.text.isEmpty) {
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
                      }
                      print(e);
                    }
                  },
                  child: Text(
                    'Acessar',
                    style: AppStyle.title2,
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

Future<dynamic> CustomMsgSuccess(
    BuildContext context, String title, String description) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppStyle.dark1,
        elevation: 0,
        title: Text(
          title,
          style: AppStyle.title1,
        ),
        content: Text(
          description,
          style: AppStyle.title3,
          textAlign: TextAlign.center,
        ),
        icon: LottieBuilder.network(
          'https://lottie.host/786c7314-fe1d-460e-8696-01848358913d/WbWfT8H3Ze.json',
          height: 200,
          width: 200,
          repeat: false,
          alignment: Alignment.center,
        ),
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.all(80),
        scrollable: true,
        contentPadding: EdgeInsets.only(bottom: 100, left: 20, right: 20),
      );
    },
  );
}
