import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../model/book_model.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

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

    String? selectedCategory = 'Arte, Fotografia e Design';
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
        value: 'Arte, Fotografia e Design',
        child: Text(
          'Arte, Fotografia e Design',
        ),
      ),
      const DropdownMenuItem(
        value: 'História',
        child: Text(
          'História',
        ),
      ),
      const DropdownMenuItem(
        value: 'Administração, Economia e Negócios',
        child: Text(
          'Administração, Economia e Negócios',
        ),
      ),
      const DropdownMenuItem(
        value: 'Religião, Espiritualidade e Esoterismo',
        child: Text(
          'Religião, Espiritualidade e Esoterismo',
        ),
      ),
      const DropdownMenuItem(
        value: 'Biografias e Histórias reais',
        child: Text(
          'Biografias e Histórias reais',
        ),
      ),
      const DropdownMenuItem(
        value: 'Esportes, Hobbies e Estilo de Vida',
        child: Text(
          'Esportes, Hobbies e Estilo de Vida',
        ),
      ),
      const DropdownMenuItem(
        value: 'Direito, Política e Ciências Sociais',
        child: Text(
          'Direito, Política e Ciências Sociais',
        ),
      ),
      const DropdownMenuItem(
        value: 'HQ, Mangás e Graphic Novels',
        child: Text(
          'HQ, Mangás e Graphic Novels',
        ),
      ),
      const DropdownMenuItem(
        value: 'Erótico',
        child: Text(
          'Erótico',
        ),
      ),
      const DropdownMenuItem(
        value: 'Gastronomia e Culinária',
        child: Text(
          'Gastronomia e Culinária',
        ),
      ),
      const DropdownMenuItem(
        value: 'Tecnologia, Informática e Mídias Digitais',
        child: Text(
          'Tecnologia, Informática e Mídias Digitais',
        ),
      ),
      const DropdownMenuItem(
        value: 'Literatura e Ficção',
        child: Text(
          'Literatura e Ficção',
        ),
      ),
      const DropdownMenuItem(
        value: 'Educação e Didáticos',
        child: Text(
          'Educação e Didáticos',
        ),
      ),
      const DropdownMenuItem(
        value: 'Ciência',
        child: Text(
          'Ciência',
        ),
      ),
      const DropdownMenuItem(
        value: 'Psicologia e Comportamento',
        child: Text(
          'Psicologia e Comportamento',
        ),
      ),
      const DropdownMenuItem(
        value: 'Romance',
        child: Text(
          'Romance',
        ),
      ),
      const DropdownMenuItem(
        value: 'Clássicos',
        child: Text(
          'Clássicos',
        ),
      ),
      const DropdownMenuItem(
        value: 'Policial e Suspense',
        child: Text(
          'Policial e Suspense',
        ),
      ),
      const DropdownMenuItem(
        value: 'Contos, Crônicas e Humor',
        child: Text(
          'Contos, Crônicas e Humor',
        ),
      ),
      const DropdownMenuItem(
        value: 'Saúde',
        child: Text(
          'Saúde',
        ),
      ),
      const DropdownMenuItem(
        value: 'Young Adult',
        child: Text(
          'Young Adult',
        ),
      ),
      const DropdownMenuItem(
        value: 'Juvenil',
        child: Text(
          'Juvenil',
        ),
      ),
      const DropdownMenuItem(
        value: 'Terror',
        child: Text(
          'Terror',
        ),
      ),
      const DropdownMenuItem(
        value: 'Ficção Científica',
        child: Text(
          'Ficção Científica',
        ),
      ),
      const DropdownMenuItem(
        value: 'Fantasia',
        child: Text(
          'Fantasia',
        ),
      ),
      const DropdownMenuItem(
        value: 'Poesias e Ensaios',
        child: Text(
          'Poesias e Ensaios',
        ),
      ),
      const DropdownMenuItem(
        value: 'Autoajuda e Desenvolvimento Pessoal',
        child: Text(
          'Autoajuda e Desenvolvimento Pessoal',
        ),
      ),
      const DropdownMenuItem(
        value: 'Viagem',
        child: Text(
          'Viagem',
        ),
      ),
      const DropdownMenuItem(
        value: 'Não classificado',
        child: Text(
          'Não classificado',
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
                      CustomField(
                        controller: isbnController,
                        hintText: 'Isbn',
                        keyboardType: TextInputType.name,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomDropDown(
                        items: List.of(categories),
                        selectedValue: selectedCategory,
                        onChanged: (value) {
                          selectedCategory = value;
                        },
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
                    } else if (authorsController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha os autores',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (isbnController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha o Isbn',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (publisherController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha a Editora',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (pageCountController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha a Quantidade de Páginas',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else if (copyCountController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha a Quantidade de Cópias',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } /*else if (thumbnailController.text.isEmpty) {
                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Preencha a Url da Capa',
                          style: AppStyle.subtitle,
                        ),
                        duration: const Duration(seconds: 5),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } */
                    else if (descriptionController.text.isEmpty) {
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

                      Navigator.of(context).pop();
                      Navigator.of(context).pushNamed(AppRoutes.bookPage);

                      final snackBar = SnackBar(
                        elevation: 0,
                        backgroundColor: AppStyle.dark1,
                        showCloseIcon: true,
                        closeIconColor: AppStyle.gray,
                        content: Text(
                          'Livro cadastrado com sucesso!',
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
