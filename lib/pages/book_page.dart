import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';
import '../widgets/book_card.dart';

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livros = ref.watch(buscaLivros);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Olá Administrador',
                        style: GoogleFonts.inter(
                          color: AppColors.title,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            size: 14,
                            color: Color(0xFF0066FF),
                          ),
                          const Gap(4),
                          Text(
                            'Biblioteca Etec Pedro Ferreira Alves',
                            style: GoogleFonts.inter(
                              color: AppColors.subtitle,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: AppColors.background,
                    child: Icon(
                      Icons.person_rounded,
                      size: 18,
                      color: AppColors.subtitle,
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColors.background,
                ),
                child: TextField(
                  cursorColor: AppColors.blue,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(right: 20),
                    hintText: 'Pesquise por livro...',
                    hintStyle: GoogleFonts.inter(
                      color: AppColors.subtitle,
                      fontSize: 16,
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Icon(
                        FeatherIcons.search,
                        size: 18,
                        color: AppColors.subtitle,
                      ),
                    ),
                  ),
                  cursorOpacityAnimates: true,
                  keyboardType: TextInputType.emailAddress,
                  maxLines: 1,
                  scrollPhysics: const BouncingScrollPhysics(),
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: AppColors.title,
                  ),
                ),
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: livros.value != null ? livros.value!.length : 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BookCard(
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
          Icons.add_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.bookForm,
          );
        },
      ),
    );
  }
}
