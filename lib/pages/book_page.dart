import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

// ignore: unused_import
import '../model/book_model.dart';
import '../provider/service_provider.dart';
import '../widgets/book_card.dart';

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaLivros);

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(20),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: data.value != null ? data.value!.length : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) => BookCard(
                  getIndex: index,
                  livro: data.value![index],
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(8);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primary,
        child: Icon(
          Icons.add,
          color: AppStyle.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.bookForm);
        },
      ),
    );
  }
}
