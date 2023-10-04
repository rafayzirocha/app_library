// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class WarningCard extends ConsumerWidget {
  const WarningCard({
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
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              data[getIndex].title,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.title2,
            ),
            const Gap(4),
            Icon(
              Icons.circle,
              size: 14,
              color: AppStyle.primary,
            )
          ],
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
