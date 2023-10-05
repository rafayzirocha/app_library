// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
          style: AppStyle.title2,
        ),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Text(
          data[getIndex].authors.join(', '),
          style: AppStyle.subtitle,
          overflow: TextOverflow.ellipsis,
        ),
        leading: SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: data[getIndex].thumbnail.isNotEmpty
                ? Image.network(
                    data[getIndex].thumbnail,
                    fit: BoxFit.cover,
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppStyle.dark2,
                    ),
                    child: Icon(
                      Icons.image_rounded,
                      size: 18,
                      color: AppStyle.gray,
                    ),
                  ),
          ),
        ),
        trailing: IconButton.filled(
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.bookDetails,
              arguments: livro,
            );
          },
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          icon: Text(
            data[getIndex].category,
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppStyle.white,
            ),
          ),
          iconSize: 18,
          color: AppStyle.white,
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
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.bookDetails,
            arguments: livro,
          );
        },
      ),
      error: (error, StackTrace) => Center(
        child: Text(StackTrace.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
