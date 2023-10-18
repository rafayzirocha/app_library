// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class AvisosCard extends ConsumerWidget {
  const AvisosCard({
    super.key,
    required this.getIndex,
    required this.aviso,
  });

  final int getIndex;
  final WarningModel aviso;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchWarnings);
    return data.when(
      data: (data) => ListTile(
        title: Text(
          data[getIndex].title,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.title2,
        ),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Text(
          'Ver mais...',
          style: AppStyle.subtitle,
          overflow: TextOverflow.ellipsis,
        ),
        leading: SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: data[getIndex].imageUrl.isNotEmpty
                ? Image.network(
                    data[getIndex].imageUrl,
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
          onPressed: () {},
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
            AppRoutes.warningDetails,
            arguments: aviso,
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
