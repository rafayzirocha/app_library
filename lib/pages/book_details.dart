import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/book_model.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ModalRoute.of(context)!.settings.arguments as BookModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 18,
          color: const Color(0xFF3C3C3C),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bookData.title,
                            style: GoogleFonts.jost(
                              fontSize: 20,
                              color: const Color(0xFF3C3C3C),
                            ),
                          ),
                          const Gap(4),
                          bookData.isAvailable
                              ? const Icon(
                                  Icons.check_circle_rounded,
                                  size: 18,
                                  color: Color(0xFF0066FF),
                                )
                              : const Icon(
                                  Icons.cancel_rounded,
                                  size: 18,
                                  color: Colors.red,
                                ),
                        ],
                      ),
                    ),
                    Text(
                      'por ${bookData.authors.join(', ')}',
                      style: GoogleFonts.jost(
                        fontSize: 16,
                        color: const Color(0xFFA9A9A9),
                      ),
                    ),
                    const Gap(20),
                    bookData.thumbnail.isNotEmpty
                        ? Container(
                            height: 200,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                bookData.thumbnail,
                                fit: BoxFit.cover,
                                width: 200,
                                alignment: Alignment.center,
                              ),
                            ),
                          )
                        : Container(
                            height: 200,
                            width: 200,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF3F3F3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Icon(
                              Icons.image_rounded,
                              size: 40,
                              color: AppStyle.subtitleColor,
                            ),
                          ),
                    const Gap(20),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Wrap(
                        spacing: 2,
                        children: [
                          ChipDetails(
                            bookData: bookData,
                            title: 'Cópias: ${bookData.copyCount}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title: 'Páginas: ${bookData.pageCount}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title: 'Empréstimos: ${bookData.loansCount}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title: 'Estrelas: ${bookData.averageRating}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title: 'Avaliações: ${bookData.ratingsCount}',
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Wrap(
                        spacing: 2,
                        children: [
                          ChipDetails(
                            bookData: bookData,
                            title:
                                'Categorias: ${bookData.categories.join(', ')}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title: 'ISBN: ${bookData.isbn.join(', ')}',
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Wrap(
                        spacing: 2,
                        children: [
                          ChipDetails(
                            bookData: bookData,
                            title: 'Editora: ${bookData.publisher}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title:
                                'Data de Publicação: ${bookData.publishedDate}',
                          ),
                          const Gap(10),
                          ChipDetails(
                            bookData: bookData,
                            title: 'Idioma: ${bookData.language}',
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Text(
                            'Descrição',
                            style: GoogleFonts.jost(
                              fontSize: 20,
                              color: const Color(0xFF3C3C3C),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            bookData.description,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.jost(
                              fontSize: 16,
                              color: const Color(0xFFA9A9A9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChipDetails extends StatelessWidget {
  const ChipDetails({
    super.key,
    required this.bookData,
    this.icon,
    required this.title,
  });

  final BookModel bookData;
  final IconData? icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Chip(
      side: BorderSide.none,
      backgroundColor: const Color(0xFFF5F9FF),
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(12),
      ),
      label: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 18,
              color: const Color(0xFF0066FF),
            ),
          if (icon != null) const Gap(4),
          Text(
            title,
            style: GoogleFonts.jost(
              fontSize: 14,
              color: const Color(0xFF0066FF),
            ),
          ),
        ],
      ),
    );
  }
}
