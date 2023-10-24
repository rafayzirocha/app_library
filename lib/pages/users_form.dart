import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../routes/app_routes.dart';

final AddNewUserProvider =
    StateNotifierProvider<AddNewUserController, AddNewUserData>((ref) {
  return AddNewUserController();
});

class AddNewUserData {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController rmController = TextEditingController();
  final TextEditingController contatoController = TextEditingController();
}

class AddNewUserController extends StateNotifier<AddNewUserData> {
  AddNewUserController() : super(AddNewUserData());

  @override
  void dispose() {
    state.emailController.dispose();
    state.senhaController.dispose();
    state.nomeController.dispose();
    state.rmController.dispose();
    state.contatoController.dispose();
    super.dispose();
  }
}

class AddNewUserPage extends ConsumerWidget {
  const AddNewUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersService = ref.watch(usersServiceProvider);

    final emailController = AddNewUserData().emailController;
    final senhaController = AddNewUserData().senhaController;
    final nomeController = AddNewUserData().nomeController;
    final rmController = AddNewUserData().rmController;
    final contatoController = AddNewUserData().contatoController;

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

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton.filled(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(FeatherIcons.chevronLeft),
                iconSize: 18,
                color: AppStyle.gray,
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    AppStyle.dark2,
                  ),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: '',
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
                        hintText: '',
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
                        hintText: '',
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
                                  hintText: '',
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
                        hintText: '',
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        controller: contatoController,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    splashFactory: InkRipple.splashFactory,
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
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o Email',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (senhaController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha a Senha',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (nomeController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o Nome Completo',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (rmController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o RM',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (contatoController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o Contato',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                        await usersService.createUser(
                          emailController.text,
                          senhaController.text,
                          nomeController.text,
                          rmController.text,
                          contato,
                          cursosSelecionado.toString(),
                        );

                        Navigator.of(context).pushNamed(AppRoutes.homePage);

                        final snackBar = SnackBar(
                          elevation: 0,
                          backgroundColor: AppStyle.dark1,
                          showCloseIcon: true,
                          closeIconColor: AppStyle.gray,
                          content: Text(
                            'Usuário Cadastrado com Sucesso!',
                            style: AppStyle.subtitle,
                          ),
                          duration: const Duration(seconds: 5),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                    'Salvar',
                    style: AppStyle.title2,
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
