// ignore_for_file: non_constant_identifier_names

import 'package:app_library/model/book_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';
import '../widgets/custom_txt.dart';

final AddNewBookModalProvider =
    StateNotifierProvider<AddNewBookModalController, AddNewBookData>((ref) {
  return AddNewBookModalController();
});

class AddNewBookData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorsController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController categoriesController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
  final TextEditingController languageController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController pageCountController = TextEditingController();
  final TextEditingController copyCountController = TextEditingController();
  final TextEditingController thumbnailController = TextEditingController();
}

class AddNewBookModalController extends StateNotifier<AddNewBookData> {
  AddNewBookModalController() : super(AddNewBookData());

  @override
  void dispose() {
    state.titleController.dispose();
    state.authorsController.dispose();
    state.isbnController.dispose();
    state.categoriesController.dispose();
    state.publisherController.dispose();
    state.languageController.dispose();
    state.descriptionController.dispose();
    state.pageCountController.dispose();
    state.copyCountController.dispose();
    state.thumbnailController.dispose();
    super.dispose();
  }
}

class AddNewBookScreen extends ConsumerWidget {
  const AddNewBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = AddNewBookData().titleController;
    final authorsController = AddNewBookData().authorsController;
    final isbnController = AddNewBookData().isbnController;
    final categoriesController = AddNewBookData().categoriesController;
    final publisherController = AddNewBookData().publisherController;
    final languageController = AddNewBookData().languageController;
    final descriptionController = AddNewBookData().descriptionController;
    final pageCountController = AddNewBookData().pageCountController;
    final copyCountController = AddNewBookData().copyCountController;
    final thumbnailController = AddNewBookData().thumbnailController;

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
          'Cadastrando novo livro',
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
              List<String> isbnList = isbnController.text.split(',');
              List<String> authorsList = authorsController.text.split(',');
              List<String> categoriesList =
                  categoriesController.text.split(',');
              int pageCount;
              int copyCount;

              try {
                pageCount = int.parse(pageCountController.text);
                copyCount = int.parse(copyCountController.text);
              } catch (e) {
                return;
              }

              ref.read(serviceProvider).addNewBook(
                    BookModel(
                      title: titleController.text,
                      isbn: isbnList,
                      authors: authorsList,
                      categories: categoriesList,
                      publisher: publisherController.text,
                      publishedDate: DateTime.now(),
                      description: descriptionController.text,
                      pageCount: pageCount,
                      copyCount: copyCount,
                      loansCount: 0,
                      averageRating: 0,
                      ratingsCount: 0,
                      thumbnail: thumbnailController.text,
                      language: languageController.text,
                      isAvailable: true,
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
                        title: 'Autores',
                        maxLine: 1,
                        txtController: authorsController,
                        keyboardType: TextInputType.text,
                        helperText: 'Separe os autores por vírgula',
                      ),
                      const Gap(10),
                      CustomTextField(
                        title: 'ISBN',
                        maxLine: 1,
                        txtController: isbnController,
                        keyboardType: TextInputType.text,
                        helperText: 'Separe ISBN por vírgula',
                      ),
                      const Gap(10),
                      CustomTextField(
                        title: 'Categorias',
                        maxLine: 1,
                        txtController: categoriesController,
                        keyboardType: TextInputType.text,
                        helperText: 'Separe as categorias por vírgula',
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              title: 'Editora',
                              maxLine: 1,
                              txtController: publisherController,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: CustomTextField(
                              title: 'Idioma',
                              maxLine: 1,
                              txtController: languageController,
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              title: 'Páginas',
                              maxLine: 1,
                              txtController: pageCountController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const Gap(10),
                          Expanded(
                            child: CustomTextField(
                              title: 'Cópias Disponíveis',
                              maxLine: 1,
                              txtController: copyCountController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                      CustomTextField(
                        title: 'URL da Capa',
                        maxLine: 1,
                        txtController: thumbnailController,
                        keyboardType: TextInputType.url,
                      ),
                      const Gap(10),
                      CustomTextField(
                        title: 'Descrição',
                        maxLine: 10,
                        txtController: descriptionController,
                        keyboardType: TextInputType.multiline,
                      ),
                      const Gap(10),
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
