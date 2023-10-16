import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../provider/service_provider.dart';
import '../widgets/book_card.dart';

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaLivros);

    /*List<String> suaListaDeStrings = [
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
    ];*/

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {},
                    child: CircleAvatar(
                      backgroundColor: AppStyle.dark2,
                      child: SvgPicture.asset(
                        'assets/images/user-group.svg',
                        height: 16,
                        width: 16,
                        color: AppStyle.gray,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: () {},
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        icon: Text(
                          'Selecionar Categorias',
                          style: AppStyle.subtitle,
                        ),
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
                      const Gap(10),
                      IconButton.filled(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/search.svg',
                          height: 16,
                          width: 16,
                          color: AppStyle.gray,
                        ),
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
                      const Gap(10),
                      IconButton.filled(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.bookForm);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/plus.svg',
                          height: 12,
                          width: 12,
                          color: AppStyle.white,
                        ),
                        color: AppStyle.gray,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppStyle.primary,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
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
    );
  }
}
