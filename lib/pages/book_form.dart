import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../model/book_model.dart';
import '../provider/service_provider.dart';

// ignore: non_constant_identifier_names
final AddNewBookModalProvider =
    StateNotifierProvider<AddNewBookModalController, AddNewBookData>((ref) {
  return AddNewBookModalController();
});

class AddNewBookData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorsController = TextEditingController();
  final TextEditingController isbnController = TextEditingController();
  final TextEditingController publisherController = TextEditingController();
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
    state.publisherController.dispose();
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
    final publisherController = AddNewBookData().publisherController;
    final descriptionController = AddNewBookData().descriptionController;
    final pageCountController = AddNewBookData().pageCountController;
    final copyCountController = AddNewBookData().copyCountController;
    final thumbnailController = AddNewBookData().thumbnailController;

    String? selectedCategory = 'Romance';
    String? selectedLanguage = 'Português';

    final language = {
      const DropdownMenuItem(
        value: 'Português',
        child: Text(
          'Português',
        ),
      ),
      const DropdownMenuItem(
        value: 'Inglês',
        child: Text(
          'Inglês',
        ),
      ),
      const DropdownMenuItem(
        value: 'Espanhol',
        child: Text(
          'Espanhol',
        ),
      ),
    };

    final categories = {
      const DropdownMenuItem(
        value: 'Romance',
        child: Text(
          'Romance',
        ),
      ),
      const DropdownMenuItem(
        value: 'Ficção',
        child: Text(
          'Ficção',
        ),
      ),
      const DropdownMenuItem(
        value: 'Biografia',
        child: Text(
          'Biografia',
        ),
      ),
    };

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      appBar: AppBar(
        backgroundColor: AppStyle.dark1,
        leading: IconButton(
          onPressed: () {},
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
                        controller: titleController,
                        hintText: 'Título',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: authorsController,
                        hintText: 'Autores',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              controller: isbnController,
                              hintText: 'Isbn',
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: CustomDropDown(
                              items: List.of(categories),
                              selectedValue: selectedCategory,
                              onChanged: (value) {
                                selectedCategory = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomDropDown(
                              items: List.of(language),
                              selectedValue: selectedLanguage,
                              onChanged: (value) {
                                selectedLanguage = value;
                              },
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: CustomField(
                              controller: publisherController,
                              hintText: 'Editora',
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Expanded(
                            child: CustomField(
                              controller: pageCountController,
                              hintText: 'Páginas',
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: CustomField(
                              controller: copyCountController,
                              hintText: 'Cópias',
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      CustomField(
                        controller: thumbnailController,
                        hintText: 'Url da Capa',
                        keyboardType: TextInputType.url,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: descriptionController,
                        hintText: 'Descrição',
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                      ),
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
                    List<String> isbnList = isbnController.text.split(', ');
                    List<String> authorsList =
                        authorsController.text.split(', ');
                    int pageCount;
                    int copyCount;

                    try {
                      pageCount = int.parse(pageCountController.text);
                      copyCount = int.parse(copyCountController.text);
                    } catch (e) {
                      return;
                    }

                    // Atualize selectedLanguage com o valor do dropdown de idioma
                    if (selectedLanguage != null) {
                      selectedLanguage = selectedLanguage;
                    }

                    ref.read(bookProvider).addNewBook(
                          BookModel(
                            title: titleController.text,
                            isbn: isbnList,
                            authors: authorsList,
                            category: selectedCategory.toString(),
                            publisher: publisherController.text,
                            publishedDate: DateTime.now(),
                            description: descriptionController.text,
                            pageCount: pageCount,
                            copyCount: copyCount,
                            loansCount: 0,
                            averageRating: 0,
                            ratingsCount: 0,
                            thumbnail: thumbnailController.text,
                            language: selectedLanguage.toString(),
                            isAvailable: true,
                          ),
                        );

                    //Navigator.of(context).pop();
                    //Navigator.of(context).pushNamed(AppRoutes.bookPage);
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
