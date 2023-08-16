import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/show_modal.dart';
import '../constants/app_style.dart';
import '../provider/service_provider.dart';
import '../widgets/book_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookData = ref.watch(fetchDataProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Livros',
          style: AppStyle.title,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: bookData.value != null ? bookData.value!.length : 0,
              shrinkWrap: true,
              itemBuilder: (context, index) => BookList(
                getIndex: index,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            context: context,
            builder: (context) => const AddNewBookodal(),
          );
        },
      ),
    );
  }
}
