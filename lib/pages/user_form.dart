// ignore_for_file: non_constant_identifier_names

import 'package:app_library/model/user_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../routes/app_routes.dart';

final AddNewUserProvider =
    StateNotifierProvider<AddNewUserModalController, AddNewUserData>((ref) {
  return AddNewUserModalController();
});

class AddNewUserData {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rmController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
}

class AddNewUserModalController extends StateNotifier<AddNewUserData> {
  AddNewUserModalController() : super(AddNewUserData());

  @override
  void dispose() {
    state.nameController.dispose();
    state.rmController.dispose();
    state.emailController.dispose();
    state.phoneNumberController.dispose();
    super.dispose();
  }
}

class AddNewUserPage extends ConsumerWidget {
  const AddNewUserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = AddNewUserData().rmController;
    final rmController = AddNewUserData().rmController;
    final emailController = AddNewUserData().emailController;
    final phoneNumberController = AddNewUserData().phoneNumberController;

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomField(
                        hintText: 'Nome',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: nameController,
                      ),
                      const Gap(20),
                      CustomField(
                        hintText: 'RM do Aluno',
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        controller: rmController,
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
                        hintText: 'Número de Telefone',
                        keyboardType: TextInputType.phone,
                        maxLines: 1,
                        controller: phoneNumberController,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
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
                  onPressed: () {
                    if (nameController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o Nome',
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
                    } else if (emailController.text.isEmpty) {
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
                    } else if (phoneNumberController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o Número de Telefone',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      int rm;

                      try {
                        rm = int.parse(rmController.text);
                      } catch (e) {
                        return;
                      }

                      ref.read(usersProvider).add(
                            UserModel(
                              name: nameController.text,
                              rm: rm,
                              email: emailController.text,
                              phoneNumber: phoneNumberController.text,
                            ),
                          );
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(AppRoutes.userPage);

                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Usuário cadastrado com sucesso!',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
