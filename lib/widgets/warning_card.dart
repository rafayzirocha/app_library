// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class WarningCard extends ConsumerWidget {
  const WarningCard({
    super.key,
    required this.getIndex,
    required this.warning,
  });

  final int getIndex;
  final WarningModel warning;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final warningsData = ref.watch(fetchWarnings);
    return warningsData.when(
      data: (warningsData) => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.warningDetails,
            arguments: warning,
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    child: warningsData[getIndex].imageUrl.isNotEmpty
                        ? Image.network(
                            warningsData[getIndex].imageUrl,
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          )
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color(0xFFF3F3F3),
                            ),
                            child: Icon(
                              Icons.image_rounded,
                              size: 18,
                              color: AppStyle.subtitleColor,
                            ),
                          ),
                  ),
                ),
                const Gap(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          warningsData[getIndex].title,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.jost(
                            fontSize: 16,
                            color: const Color(0xFF3C3C3C),
                          ),
                        ),
                        const Gap(4),
                        const Icon(
                          Icons.check_circle_rounded,
                          size: 14,
                          color: Color(0xFF0066FF),
                        )
                      ],
                    ),
                    Text(
                      'Clique e saiba mais...',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.jost(
                        fontSize: 14,
                        color: const Color(0xFFA9A9A9),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
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
}
