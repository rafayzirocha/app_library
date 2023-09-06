import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/book_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';
import '../widgets/livro_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livros = ref.watch(buscaLivros);
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
                  GestureDetector(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFFF3F3F3),
                      child: Icon(
                        FeatherIcons.user,
                        size: 18,
                        color: AppStyle.subtitleColor,
                      ),
                    ),
                  ),
                  Text(
                    'Explore os livros',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      color: AppStyle.txtColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    color: AppStyle.txtColor,
                    iconSize: 18,
                    icon: const Icon(
                      FeatherIcons.messageCircle,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filledTonal(
                    padding: const EdgeInsets.all(12),
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFFF3F3F3),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.star,
                          size: 18,
                          color: AppStyle.subtitleColor,
                        ),
                        const Gap(8),
                        Text(
                          'Favoritos',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppStyle.subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton.filledTonal(
                    padding: const EdgeInsets.all(12),
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFFF3F3F3),
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.filter,
                          size: 18,
                          color: AppStyle.subtitleColor,
                        ),
                        const Gap(8),
                        Text(
                          'Filtros',
                          style: GoogleFonts.plusJakartaSans(
                            color: AppStyle.subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: livros.value != null ? livros.value!.length : 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => LivroCard(
                    getIndex: index,
                    livro: livros.value![index],
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(8);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          /*Navigator.of(context).pushNamed(
            AppRoutes.bookForm,
          );*/
          ref.read(serviceProvider).addNewBook(
                BookModel(
                  title: 'Vidas Secas',
                  isbn: ['9788501119148', '8501119148'],
                  authors: ['Graciliano Ramos'],
                  categories: ['Romance'],
                  publisher: 'Record',
                  publishedDate: DateTime.now(),
                  description:
                      'Um dos maiores clássicos da literatura brasileira.  Lançado originalmente em 1938 e apresentado aqui em novo projeto gráfico, Vidas secas acompanha a trajetória da família de Fabiano, Sinha Vitória, os dois filhos do casal e a cachorra Baleia na fuga do sertão em busca de oportunidades. É o romance em que Graciliano alcança o máximo da expressão que vinha buscando em sua prosa: o que impulsiona os personagens é a seca, áspera e cruel, e paradoxalmente a ligação telúrica, afetiva, que expõe naqueles seres em retirada, à procura de meios de sobrevivência e um futuro.',
                  pageCount: 143,
                  copyCount: 1,
                  loansCount: 0,
                  averageRating: 0,
                  ratingsCount: 0,
                  thumbnail:
                      'https://books.google.com.br/books/publisher/content?id=HofLDwAAQBAJ&hl=pt-BR&pg=PP1&img=1&zoom=3&bul=1&sig=ACfU3U0eDhpIUr7KdFG1mDsJ9CvQnqvNDg&w=1280',
                  language: 'Português',
                  isAvailable: true,
                ),
              );
        },
      ),
    );
  }
}
