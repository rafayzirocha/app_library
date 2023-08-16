import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';
import '../widgets/custom_txt.dart';

final AddNewBookodalProvider =
    StateNotifierProvider<AddNewBookModalController, AddNewBookData>((ref) {
  return AddNewBookModalController();
});

class AddNewBookData {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController authorController = TextEditingController();
  final TextEditingController synopsisController = TextEditingController();
}

class AddNewBookModalController extends StateNotifier<AddNewBookData> {
  AddNewBookModalController() : super(AddNewBookData());

  @override
  void dispose() {
    state.titleController.dispose();
    state.authorController.dispose();
    state.synopsisController.dispose();
    super.dispose();
  }
}

class AddNewBookodal extends ConsumerWidget {
  const AddNewBookodal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = AddNewBookData().titleController;
    final authorController = AddNewBookData().authorController;
    final synopsisController = AddNewBookData().synopsisController;
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Título',
                  maxLine: 1,
                  txtController: titleController,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Autor(a)',
                  maxLine: 1,
                  txtController: authorController,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Sinopse',
                  maxLine: 4,
                  txtController: synopsisController,
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Número de Páginas',
                  maxLine: 1,
                  txtController: TextEditingController(),
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'Número de Exemplares Disponíveis',
                  maxLine: 1,
                  txtController: TextEditingController(),
                ),
                const Gap(12),
                TextFieldWidget(
                  hintText: 'ISBN',
                  maxLine: 1,
                  txtController: TextEditingController(),
                ),
                const Gap(12),
                Row(
                  children: [
                    Expanded(
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFFF5F9FF),
                          foregroundColor: const Color(0xFF0066FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                    const Gap(22),
                    Expanded(
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(
                          backgroundColor: const Color(0xFF0066FF),
                          foregroundColor: const Color(0xFFF5F9FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          ref.read(serviceProvider).addNewBook(
                                BookModel(
                                  title: titleController.text,
                                  author: authorController.text,
                                  synopsis: synopsisController.text,
                                ),
                              );

                          titleController.clear();
                          authorController.clear();
                          synopsisController.clear();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              backgroundColor: const Color(0xFF0066FF),
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
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
