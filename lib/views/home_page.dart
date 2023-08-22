import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../constants/app_style.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';
import '../widgets/book_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ref.watch(fetchDataProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              const Gap(20),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cadastro de Livros',
                        style: AppStyle.title,
                      ),
                      Text(
                        'Explore a Biblioteca...',
                        style: AppStyle.subtitle,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      bookData.value != null ? bookData.value!.length : 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BookList(
                    getIndex: index,
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(20);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.bookForm,
          );
        },
      ),
    );
  }
}
