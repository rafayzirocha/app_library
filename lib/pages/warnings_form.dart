// ignore_for_file: non_constant_identifier_names

import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../model/warning_model.dart';
import '../routes/app_routes.dart';

final AddNewWarningModalProvider =
    StateNotifierProvider<AddNewWarningModalController, AddNewWarningData>(
        (ref) {
  return AddNewWarningModalController();
});

class AddNewWarningData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
}

class AddNewWarningModalController extends StateNotifier<AddNewWarningData> {
  AddNewWarningModalController() : super(AddNewWarningData());

  @override
  void dispose() {
    state.titleController.dispose();
    state.descriptionController.dispose();
    state.urlController.dispose();
    super.dispose();
  }
}

class AddNewWarningScreen extends ConsumerWidget {
  const AddNewWarningScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = AddNewWarningData().titleController;
    final descriptionController = AddNewWarningData().descriptionController;
    final urlController = AddNewWarningData().urlController;

    String? categoria = 'Eventos';

    final categories = {
      const DropdownMenuItem(
        value: 'Eventos',
        child: Text(
          'Eventos',
        ),
      ),
      const DropdownMenuItem(
        value: 'Prêmios',
        child: Text(
          'Prêmios',
        ),
      ),
    };

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
                        hintText: 'Titulo',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: titleController,
                      ),
                      const Gap(20),
                      CustomDropDown(
                        items: categories.toList(),
                        selectedValue: categoria,
                        onChanged: (value) {
                          categoria = value;
                        },
                      ),
                      const Gap(20),
                      CustomField(
                        hintText: 'Descrição',
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        controller: descriptionController,
                      ),
                      const Gap(20),
                      CustomField(
                        hintText: 'Url da Imagem',
                        keyboardType: TextInputType.url,
                        maxLines: 1,
                        controller: urlController,
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
                    if (titleController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o título',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (descriptionController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha a Descrição',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      if (categoria != null) {
                        categoria = categoria;
                      }

                      ref.read(warningProvider).addNewWarning(
                            WarningModel(
                              title: titleController.text,
                              description: descriptionController.text,
                              category: categoria.toString(),
                              imageUrl: urlController.text,
                              publishedDate: DateTime.now(),
                            ),
                          );
                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(AppRoutes.warningPage);

                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Aviso cadastrado com sucesso!',
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
