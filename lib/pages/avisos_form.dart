// ignore_for_file: non_constant_identifier_names

import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../model/warning_model.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_field_descricao.dart';

final AddNovoAvisoProvider =
    StateNotifierProvider<AddNovoAvisoController, AddNovoAvisoData>((ref) {
  return AddNovoAvisoController();
});

class AddNovoAvisoData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
}

class AddNovoAvisoController extends StateNotifier<AddNovoAvisoData> {
  AddNovoAvisoController() : super(AddNovoAvisoData());

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
    final titleController = AddNovoAvisoData().titleController;
    final descriptionController = AddNovoAvisoData().descriptionController;
    final urlController = AddNovoAvisoData().urlController;

    String? categoria = 'Eventos';

    final categorias = {
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
                        'Título',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: '',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                        controller: titleController,
                      ),
                      const Gap(20),
                      Text(
                        'Url da Imagem',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomField(
                        hintText: '',
                        keyboardType: TextInputType.url,
                        maxLines: 1,
                        controller: urlController,
                      ),
                      const Gap(20),
                      Text(
                        'Categoria',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomDropDown(
                        items: categorias.toList(),
                        selectedValue: categoria,
                        onChanged: (value) {
                          categoria = value;
                        },
                      ),
                      const Gap(20),
                      Text(
                        'Descrição',
                        style: AppStyle.title2,
                      ),
                      const Gap(10),
                      CustomFieldDescricao(
                        controller: descriptionController,
                        hintText: '',
                        keyboardType: TextInputType.multiline,
                        maxLines: 15,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
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
