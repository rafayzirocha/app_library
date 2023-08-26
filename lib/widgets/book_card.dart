import 'package:app_library/constants/app_style.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../provider/service_provider.dart';

class BookCard extends ConsumerWidget {
  const BookCard({
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
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
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
                    Text(
                      bookData[getIndex].status,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.plusJakartaSans(
                        color: bookData[getIndex].status == 'Disponível'
                            ? const Color(0xFF0066FF)
                            : Colors.red,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
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
