import 'package:app_library/constants/app_style.dart';

import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

// ignore: non_constant_identifier_names
final AddNewEmprestimoModalProvider = StateNotifierProvider<
    AddNewEmprestimoModalController, AddNewEmprestimoData>((ref) {
  return AddNewEmprestimoModalController();
});

class AddNewEmprestimoData {
  final TextEditingController livroIdController = TextEditingController();
  final TextEditingController rmAlunoController = TextEditingController();
  final TextEditingController dataEmprestimoController =
      TextEditingController();
  final TextEditingController dataDevolucaoController = TextEditingController();
  final TextEditingController devolvidoController = TextEditingController();
}

class AddNewEmprestimoModalController
    extends StateNotifier<AddNewEmprestimoData> {
  AddNewEmprestimoModalController() : super(AddNewEmprestimoData());

  @override
  void dispose() {
    state.livroIdController.dispose();
    state.rmAlunoController.dispose();
    state.dataEmprestimoController.dispose();
    state.dataDevolucaoController.dispose();
    state.devolvidoController.dispose();
    super.dispose();
  }
}

class AddNewEmprestimoScreen extends ConsumerWidget {
  const AddNewEmprestimoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livroIdController = AddNewEmprestimoData().livroIdController;
    final rmAlunoController = AddNewEmprestimoData().rmAlunoController;
    final dataEmprestimoController =
        AddNewEmprestimoData().dataEmprestimoController;
    final dataDevolucaoController =
        AddNewEmprestimoData().dataDevolucaoController;
    final devolvidoController = AddNewEmprestimoData().devolvidoController;

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
                        controller: livroIdController,
                        hintText: 'ID do Livro',
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: rmAlunoController,
                        hintText: 'RM do Aluno',
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: dataEmprestimoController,
                        hintText: 'Data de Empréstimo',
                        keyboardType: TextInputType.datetime,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: dataDevolucaoController,
                        hintText: 'Data de Devolução',
                        keyboardType: TextInputType.datetime,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: devolvidoController,
                        hintText: 'Devolvido',
                        keyboardType: TextInputType.text,
                        maxLines: 1,
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
                    // Aqui você pode adicionar a lógica para salvar o empréstimo
                    // e navegar de volta para a tela anterior
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
