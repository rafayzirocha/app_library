import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: AppStyle.txtColor,
                    iconSize: 18,
                    icon: const Icon(
                      FeatherIcons.chevronLeft,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFieldWidget(
                        hintText: 'Url da Imagem',
                        maxLine: 1,
                        txtController: imageUrlController,
                        icon: FeatherIcons.image,
                        keyboardType: TextInputType.url,
                      ),
                      const Gap(20),
                      TextFieldWidget(
                        hintText: 'ISBN',
                        maxLine: 1,
                        txtController: isbnController,
                        icon: FeatherIcons.award,
                        keyboardType: TextInputType.number,
                      ),
                      const Gap(20),
                      TextFieldWidget(
                        hintText: 'Título',
                        maxLine: 1,
                        txtController: titleController,
                        icon: FeatherIcons.feather,
                        keyboardType: TextInputType.text,
                      ),
                      const Gap(20),
                      TextFieldWidget(
                        hintText: 'Autor(a)',
                        maxLine: 1,
                        txtController: authorController,
                        icon: FeatherIcons.user,
                        keyboardType: TextInputType.text,
                      ),
                      const Gap(20),
                      TextFieldWidget(
                        hintText: 'Sinopse',
                        maxLine: 1,
                        txtController: synopsisController,
                        icon: FeatherIcons.fileText,
                        keyboardType: TextInputType.text,
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: TextFieldWidget(
                              hintText: 'Número de Páginas',
                              maxLine: 1,
                              txtController: pagesController,
                              icon: FeatherIcons.file,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: TextFieldWidget(
                              hintText: 'Cópias Disponíveis',
                              maxLine: 1,
                              txtController: copiesController,
                              icon: FeatherIcons.copy,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      TextFieldWidget(
                        hintText: 'Disponibilidade',
                        maxLine: 1,
                        txtController: statusController,
                        icon: FeatherIcons.helpCircle,
                        keyboardType: TextInputType.text,
                      ),
                      const Gap(20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppStyle.primaryColor,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {
                            /*int isbn;
                            int pages;
                            int copies;

                            try {
                              isbn = int.parse(isbnController.text);
                              pages = int.parse(pagesController.text);
                              copies = int.parse(copiesController.text);
                            } catch (e) {
                              return;
                            }*/

                            /*ref.read(serviceProvider).addNewBook(
                                  BookModel(
                                    title: titleController.text,
                                    isbn: ['1'],
                                    authors: ['teste'],
                                    publisher: 'publisher',
                                    publishedDate: DateTime.now(),
                                    description: 'description',
                                    pageCount: 1,
                                    copyCount: 1,
                                    loansCount: 0,
                                    averageRating: 1,
                                    ratingsCount: 1,
                                    thumbnail:
                                        'https://books.google.com.br/books/publisher/content?id=HofLDwAAQBAJ&hl=pt-BR&pg=PP1&img=1&zoom=3&bul=1&sig=ACfU3U0eDhpIUr7KdFG1mDsJ9CvQnqvNDg&w=1280',
                                    language: 'language',
                                    isAvailable: true,
                                  ),
                                );

                            Navigator.of(context).pop();*/
                          },
                          child: Text(
                            'Salvar',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 16,
                            ),
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
