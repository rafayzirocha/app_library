import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class LivroCard extends ConsumerWidget {
  const LivroCard({
    super.key,
    required this.getIndex,
  });

  final int getIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livros = ref.watch(buscaLivros);
    return livros.when(
      data: (livros) => Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.bookDetails,
              );
            },
            borderRadius: BorderRadius.circular(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    child: Image.network(
                      livros[getIndex].imageUrl.isNotEmpty
                          ? livros[getIndex].imageUrl
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
                      livros[getIndex].title,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.title,
                    ),
                    Text(
                      livros[getIndex].author,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle.subtitle,
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
