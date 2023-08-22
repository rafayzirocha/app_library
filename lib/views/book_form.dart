import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';
import '../model/book_model.dart';
import '../provider/service_provider.dart';
import '../widgets/custom_txt.dart';

final AddNewBookodalProvider =
    StateNotifierProvider<AddNewBookModalController, AddNewBookData>((ref) {
  return AddNewBookModalController();
});

class AddNewBookData {
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController synopsisController = TextEditingController();
  final TextEditingController pagesController = TextEditingController();
  final TextEditingController copiesController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
}

class AddNewBookModalController extends StateNotifier<AddNewBookData> {
  AddNewBookModalController() : super(AddNewBookData());

  @override
  void dispose() {
    state.imageUrlController.dispose();
    state.isbnController.dispose();
    state.titleController.dispose();
    state.authorController.dispose();
    state.synopsisController.dispose();
    state.pagesController.dispose();
    state.copiesController.dispose();
    state.statusController.dispose();
    super.dispose();
  }
}

class AddNewBookScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrlController = AddNewBookData().imageUrlController;
    final isbnController = AddNewBookData().isbnController;
    final titleController = AddNewBookData().titleController;
    final authorController = AddNewBookData().authorController;
    final synopsisController = AddNewBookData().synopsisController;
    final pagesController = AddNewBookData().pagesController;
    final copiesController = AddNewBookData().copiesController;
    final statusController = AddNewBookData().statusController;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Url da Imagem',
                  maxLine: 1,
                  txtController: imageUrlController,
                  icon: FeatherIcons.image,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'ISBN',
                  maxLine: 1,
                  txtController: isbnController,
                  icon: FeatherIcons.award,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Título',
                  maxLine: 1,
                  txtController: titleController,
                  icon: FeatherIcons.feather,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Autor(a)',
                  maxLine: 1,
                  txtController: authorController,
                  icon: FeatherIcons.user,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Sinopse',
                  maxLine: 1,
                  txtController: synopsisController,
                  icon: FeatherIcons.fileText,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Número de Páginas',
                  maxLine: 1,
                  txtController: pagesController,
                  icon: FeatherIcons.file,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Cópias Disponíveis',
                  maxLine: 1,
                  txtController: copiesController,
                  icon: FeatherIcons.copy,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Disponibilidade',
                  maxLine: 1,
                  txtController: statusController,
                  icon: FeatherIcons.helpCircle,
                ),
                const Gap(12),
                Container(
                  width: double.infinity,
                  height: 60,
                  child: FilledButton.tonal(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppStyle.primaryColor,
                      foregroundColor: const Color(0xFFF5F9FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      ref.read(serviceProvider).addNewBook(
                            BookModel(
                              imageUrl: imageUrlController.text,
                              isbn: isbnController.text,
                              title: titleController.text,
                              author: authorController.text,
                              synopsis: synopsisController.text,
                              pages: pagesController.text,
                              copies: copiesController.text,
                              status: statusController.text,
                            ),
                          );

                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          backgroundColor: AppStyle.primaryColor,
                          content: Text(
                            'Livro Cadastrado com Sucesso!',
                            style: AppStyle.txtSnackBar,
                          ),
                          duration: const Duration(seconds: 5),
                        ),
                      );
                    },
                    child: Text(
                      'Salvar',
                      style: GoogleFonts.plusJakartaSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
