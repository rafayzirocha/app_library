import 'package:app_library/provider/service_provider.dart';
import 'package:feather_icons/feather_icons.dart';
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
      backgroundColor: const Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131313),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.chevron_left,
            size: 18,
            color: Color(0xFFDCDCDC),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FeatherIcons.edit2,
                    size: 18,
                    color: Color(0xFFDCDCDC),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(bookProvider).deleteBook(bookData.docId);
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    FeatherIcons.trash,
                    size: 18,
                    color: Color(0xFFDCDCDC),
                  ),
                ),
              ],
            ),
          ),
        ],
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
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: const Color(0xFFDCDCDC),
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
                      style: GoogleFonts.inter(
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
                              color: Color(0xFF1A1A1A),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Icon(
                              Icons.image_rounded,
                              size: 40,
                              color: Color(0xFFA9A9A9),
                            ),
                          ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Text(
                            'Descrição',
                            style: GoogleFonts.inter(
                              fontSize: 20,
                              color: const Color(0xFFDCDCDC),
                            ),
                          ),
                          const Gap(10),
                          Text(
                            bookData.description,
                            textAlign: TextAlign.justify,
                            style: GoogleFonts.inter(
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
