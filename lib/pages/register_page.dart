import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';
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
    final cursoController = TextEditingController();

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomField(
                hintText: 'Nome',
                maxLines: 1,
                controller: nomeController,
              ),
              const Gap(20),
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
              ),
              const Gap(20),
              CustomField(
                hintText: 'RM',
                maxLines: 1,
                controller: rmController,
              ),
              const Gap(20),
              CustomField(
                hintText: 'Contato',
                maxLines: 1,
                controller: contatoController,
              ),
              const Gap(20),
              CustomField(
                hintText: 'Curso',
                maxLines: 1,
                controller: cursoController,
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
                    final nome = nomeController.text;
                    final email = emailController.text;
                    final password = senhaController.text;
                    final rm = rmController.text;
                    final curso = cursoController.text;

                    int contato;

                    try {
                      contato = int.parse(contatoController.text);
                    } catch (e) {
                      return;
                    }

                    try {
                      // await authService.createUser(email, password);
                      await authService.createUser(
                        email,
                        password,
                        nome,
                        rm,
                        contato,
                        curso,
                      );

                      // Navegar para a página de destino do usuário
                      Navigator.of(context).pushNamed(AppRoutes.bookPage);
                    } on FirebaseAuthException catch (e) {
                      // Mostrar uma mensagem de erro ao usuário
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('$e.message'),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Registrar',
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
