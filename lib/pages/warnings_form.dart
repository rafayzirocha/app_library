// ignore_for_file: non_constant_identifier_names

/*import 'package:app_library/model/warning_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';
import '../widgets/custom_txt.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 18,
          color: AppStyle.txtColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: Text(
          'Cadastrando novo aviso',
          style: GoogleFonts.jost(
            fontSize: 16,
            color: const Color(0xFF3C3C3C),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              ref.read(warningProvider).addNewWarning(
                    WarningModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      imageUrl: urlController.text,
                      publishedDate: DateTime.now(),
                    ),
                  );
              Navigator.of(context).pop();
            },
            iconSize: 18,
            color: AppStyle.primaryColor,
            icon: const Icon(Icons.check_rounded),
          ),
        ],
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
                      CustomTextField(
                        title: 'Título',
                        maxLine: 1,
                        txtController: titleController,
                        keyboardType: TextInputType.text,
                      ),
                      const Gap(10),
                      CustomTextField(
                        title: 'Descrição',
                        maxLine: 10,
                        txtController: descriptionController,
                        keyboardType: TextInputType.multiline,
                      ),
                      const Gap(10),
                      CustomTextField(
                        title: 'Url da Imagem',
                        maxLine: 1,
                        txtController: urlController,
                        keyboardType: TextInputType.text,
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
}*/
