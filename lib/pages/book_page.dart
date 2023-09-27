import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../model/book_model.dart';
import '../provider/service_provider.dart';
import '../widgets/book_card.dart';

class BookPage extends ConsumerWidget {
  const BookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livros = ref.watch(buscaLivros);
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
                  onPressed: () {
                    ref.read(bookProvider).addNewBook(
                          BookModel(
                            title: 'title',
                            isbn: ['isbn'],
                            authors: ['authors'],
                            categories: ['categories'],
                            publisher: 'publisher',
                            publishedDate: DateTime.now(),
                            description: 'description',
                            pageCount: 1,
                            copyCount: 1,
                            loansCount: 0,
                            averageRating: 0,
                            ratingsCount: 0,
                            thumbnail: '',
                            language: 'language',
                            isAvailable: true,
                          ),
                        );
                  },
                  icon: const Icon(
                    FeatherIcons.plus,
                    size: 18,
                    color: Color(0xFFDCDCDC),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FeatherIcons.search,
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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: livros.value != null ? livros.value!.length : 0,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BookCard(
                      getIndex: index,
                      livro: livros.value![index],
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Gap(20);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
