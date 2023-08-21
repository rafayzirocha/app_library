import 'package:app_library/constants/app_style.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';

class BookList extends ConsumerWidget {
  const BookList({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ref.watch(fetchDataProvider);
    return bookData.when(
      data: (bookData) => Column(
        children: [
          const Gap(20),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(12),
                    child: Image.network(
                      bookData[getIndex].imageUrl.isNotEmpty
                          ? bookData[getIndex].imageUrl
                          : "https://www.jport.co/Editor/image/4721055615600659_empty.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
                const Gap(12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookData[getIndex].title,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.title,
                    ),
                    Text(
                      bookData[getIndex].author,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.subtitle,
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        Icon(
                          bookData[getIndex].status == 'Disponível'
                              ? FeatherIcons.thumbsUp
                              : FeatherIcons.thumbsDown,
                          size: 14,
                          color: bookData[getIndex].status == 'Disponível'
                              ? const Color(0xFF0066FF)
                              : const Color(0xFFA9A9A9),
                        ),
                        const Gap(4),
                        Text(
                          bookData[getIndex].status,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.plusJakartaSans(
                            color: bookData[getIndex].status == 'Disponível'
                                ? const Color(0xFF0066FF)
                                : const Color(0xFFA9A9A9),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Gap(4),
                    Row(
                      children: [
                        const Icon(
                          FeatherIcons.copy,
                          size: 14,
                          color: Color(0xFFA9A9A9),
                        ),
                        const Gap(4),
                        Text(
                          bookData[getIndex].copies,
                          style: AppStyle.subtitle,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
