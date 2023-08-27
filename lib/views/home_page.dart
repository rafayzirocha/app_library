import 'package:app_library/constants/app_style.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';
import '../widgets/book_card.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ref.watch(fetchDataProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Gap(12),
              Container(
                alignment: Alignment.center,
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/dog.png'),
                ),
              ),
              const Gap(12),
              Text(
                'Seja bem vindo(a)',
                style: AppStyle.subtitle,
              ),
              Text(
                'Administrador',
                style: AppStyle.title,
              ),
              const Gap(12),
              const BookSearch(),
              const Gap(12),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      bookData.value != null ? bookData.value!.length : 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => BookCard(
                    getIndex: index,
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(12);
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

class BookSearch extends StatelessWidget {
  const BookSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        cursorColor: AppStyle.primaryColor,
        cursorRadius: const Radius.circular(20),
        style: AppStyle.title,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
          hintText: 'Busque por um livro...',
          hintStyle: AppStyle.txtField,
          prefixIcon: Icon(
            FeatherIcons.search,
            size: 16,
            color: AppStyle.subtitleColor,
          ),
        ),
        maxLines: 1,
      ),
    );
  }
}
