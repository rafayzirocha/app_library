import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../constants/app_style.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_field.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);

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
                              'Olá, bem vindo(a) de volta 👋',
                              style: AppStyle.title1,
                            ),
                            Text(
                              'Entre com suas credenciais e explore nossa biblioteca!',
                              style: AppStyle.title3,
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
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppStyle.dark2,
                        ),
                        child: TextFormField(
                          cursorColor: AppStyle.primary,
                          autocorrect: true,
                          controller: senhaController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.only(
                                left: 20, right: 20, top: 14),
                            hintText: 'Informe sua senha',
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                            suffixIconColor: AppStyle.gray,
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          maxLines: 1,
                          style: AppStyle.title3,
                          obscureText: true,
                        ),
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
                            final email = emailController.text;
                            final password = senhaController.text;

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
                            } else {
                              try {
                                await authService.signInWithEmailAndPassword(
                                    email, password);

                                Navigator.of(context)
                                    .pushNamed(AppRoutes.perfilPage);
                              } on FirebaseAuthException catch (e) {
                                switch (e.code) {
                                  case 'user-not-found':
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Usuário não encontrado',
                                          style: AppStyle.subtitle,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      ),
                                    );
                                    break;
                                  case 'wrong-password':
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Senha incorreta',
                                          style: AppStyle.subtitle,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      ),
                                    );
                                    break;
                                  case 'too-many-requests':
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Muitas tentativas de login. Tente novamente mais tarde.',
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
