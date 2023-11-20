import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../provider/service_provider.dart';
import '../widgets/book_card.dart';

class SearchBookPage extends ConsumerWidget {
  const SearchBookPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController livro = TextEditingController();
    final data = ref.watch(pesquisaLivros(livro.text));

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: AppStyle.dark2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(FeatherIcons.chevronLeft),
                    iconSize: 18,
                    color: AppStyle.gray,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        AppStyle.dark2,
                      ),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomField(
                      hintText: 'Pesquise pelo livro...',
                      maxLines: 1,
                      controller: livro,
                    ),
                  ),
                ],
              ),
            ),
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
    );
  }
}
