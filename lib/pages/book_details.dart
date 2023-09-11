import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
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
          color: AppStyle.txtColor,
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
                      bookData.thumbnail.isNotEmpty
                          ? Container(
                              height: 300,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  bookData.thumbnail,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                              ),
                            )
                          : Container(
                              height: 200,
                              width: 160,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF3F3F3),
                              ),
                              child: Icon(
                                Icons.image_rounded,
                                size: 18,
                                color: AppStyle.subtitleColor,
                              ),
                            ),
                      const Gap(20),
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFFF3F3F3),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Informações',
                                    style: AppStyle.title,
                                  ),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Titulo',
                                  subtitle: bookData.title,
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Autores',
                                  subtitle: bookData.authors.join(', '),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'ISBN',
                                  subtitle: bookData.isbn.join(', '),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Editora',
                                  subtitle: bookData.publisher,
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Idioma',
                                  subtitle: bookData.language,
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Data de Publicação',
                                  subtitle: bookData.publishedDate.toString(),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Páginas',
                                  subtitle: bookData.pageCount.toString(),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Cópias Disponíveis',
                                  subtitle: bookData.copyCount.toString(),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Empréstimos',
                                  subtitle: bookData.loansCount.toString(),
                                ),
                                const Gap(10),
                                DetailRow(
                                  bookData: bookData,
                                  title: 'Status',
                                  subtitle: bookData.isAvailable
                                      ? 'Disponível'
                                      : 'Indisponível',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFF3F3F3),
                        ),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Descrição',
                                style: AppStyle.title,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              bookData.description,
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                color: AppStyle.subtitleColor,
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.edit_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.bookForm);
        },
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  const DetailRow({
    super.key,
    required this.bookData,
    required this.title,
    required this.subtitle,
  });

  final BookModel bookData;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 16,
            color: AppStyle.subtitleColor,
          ),
        ),
        const Gap(4),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 14,
            color: AppStyle.txtColor,
          ),
        ),
      ],
    );
  }
}
