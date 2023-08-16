import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      data: (bookData) => ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          bookData[getIndex].title,
          style: AppStyle.title,
        ),
        subtitle: Text(
          bookData[getIndex].author,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.subtitle,
        ),
        onTap: () {},
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
