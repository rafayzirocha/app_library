import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

// ignore: unused_import
import '../model/book_model.dart';
import '../provider/service_provider.dart';
import '../widgets/book_card.dart';

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaLivros);

    List<String> suaListaDeStrings = [
      'Arte, Fotografia e Design',
      'História',
      'Administração, Economia e Negócios',
      'Religião, Espiritualidade e Esoterismo',
      'Biografias e Histórias reais',
      'Esportes, Hobbies e Estilo de Vida',
      'Direito, Política e Ciências Sociais',
      'HQ, Mangás e Graphic Novels',
      'Erótico',
      'Gastronomia e Culinária',
      'Tecnologia, Informática e Mídias Digitais',
      'Literatura e Ficção',
      'Educação e Didáticos',
      'Ciência',
      'Psicologia e Comportamento',
      'Romance',
      'Clássicos',
      'Policial e Suspense',
      'Contos, Crônicas e Humor',
      'Saúde',
      'Young Adult',
      'Juvenil',
      'Terror',
      'Ficção Científica',
      'Fantasia',
      'Poesias e Ensaios',
      'Autoajuda e Desenvolvimento Pessoal',
      'Viagem',
      'Não classificado',
    ];

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: CustomField(
                hintText: 'Pesquise um livro...',
                keyboardType: TextInputType.name,
                maxLines: 1,
              ),
            ),
            const Gap(20),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Icons.sort_rounded),
                    iconSize: 18,
                    color: AppStyle.gray,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        AppStyle.dark2,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const Gap(10.0),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 10.0,
                    children: List<Widget>.generate(
                      suaListaDeStrings.length,
                      (int index) {
                        final String label = suaListaDeStrings[index];
                        return FilterChip(
                          padding: const EdgeInsets.all(10),
                          label: Text(
                            label,
                            style: AppStyle.subtitle,
                          ),
                          backgroundColor: AppStyle.dark2,
                          elevation: 0,
                          onSelected: (value) {},
                          pressElevation: 0,
                          selected: false,
                          selectedColor: AppStyle.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide.none,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: data.value != null ? data.value!.length : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) => BookCard(
                  getIndex: index,
                  livro: data.value![index],
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(8);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primary,
        child: Icon(
          Icons.add,
          color: AppStyle.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.bookForm);
        },
      ),
    );
  }
}
