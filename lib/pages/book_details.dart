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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        bookData.title,
                        style: GoogleFonts.jost(
                          fontSize: 20,
                          color: const Color(0xFF3C3C3C),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleDetail(
                            bookData: bookData,
                            icon: Icons.hotel_class_rounded,
                            title: '${bookData.averageRating} estrelas',
                          ),
                          CircleDetail(
                            bookData: bookData,
                            icon: Icons.thumbs_up_down_rounded,
                            title: '${bookData.ratingsCount} avaliações',
                          ),
                          CircleDetail(
                            bookData: bookData,
                            icon: Icons.auto_stories_rounded,
                            title: '${bookData.pageCount} páginas',
                          ),
                          CircleDetail(
                            bookData: bookData,
                            icon: Icons.file_copy_rounded,
                            title: '${bookData.copyCount} cópias',
                          ),
                          CircleDetail(
                            bookData: bookData,
                            icon: Icons.bookmarks_rounded,
                            title: '${bookData.loansCount} empréstimos',
                          ),
                        ],
                      ),
                      const Gap(20),
                      Details(bookData: bookData),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.edit_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.bookData,
  });

  final BookModel bookData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Detalhes',
            style: GoogleFonts.jost(
              fontSize: 20,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          const Gap(20),
          Text(
            'ISBN',
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            bookData.isbn.join(', '),
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(10),
          Text(
            'Categorias',
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            bookData.categories.join(', '),
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(10),
          Text(
            'Editora',
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            bookData.publisher,
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(10),
          Text(
            'Data de Publicação',
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            bookData.publishedDate.toString(),
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(10),
          Text(
            'Idioma',
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            bookData.language,
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(20),
          Text(
            'Descrição',
            style: GoogleFonts.jost(
              fontSize: 20,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            bookData.description,
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}

class CircleDetail extends StatelessWidget {
  const CircleDetail({
    super.key,
    required this.bookData,
    required this.icon,
    required this.title,
  });

  final BookModel bookData;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xFFF3F3F3),
          child: Icon(
            icon,
            color: const Color(0xFFA9A9A9),
            size: 18,
          ),
        ),
        const Gap(4),
        Text(
          title,
          style: GoogleFonts.jost(
            fontSize: 16,
            color: const Color(0xFFA9A9A9),
          ),
        ),
      ],
    );
  }
}
