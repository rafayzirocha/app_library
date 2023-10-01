// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

/*import 'package:app_library/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class BookCard extends ConsumerWidget {
  const BookCard({
    super.key,
    required this.getIndex,
    required this.livro,
  });

  final int getIndex;
  final BookModel livro;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaLivros);
    return data.when(
      data: (data) => ListTile(
        title: Text(
          data[getIndex].title,
          overflow: TextOverflow.ellipsis,
        ),
        titleAlignment: ListTileTitleAlignment.center,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
        subtitle: Text(
          data[getIndex].authors.join(', '),
          overflow: TextOverflow.ellipsis,
        ),
        subtitleTextStyle: GoogleFonts.inter(
          fontSize: 14,
          color: const Color(0xFFA5A5A5),
          fontWeight: FontWeight.w400,
        ),
        leading: Container(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              data[getIndex].thumbnail,
              fit: BoxFit.cover,
            ),
          ),
        ),
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      error: (error, StackTrace) => Center(
        child: Text(StackTrace.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}*/
