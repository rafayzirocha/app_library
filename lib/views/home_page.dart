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
        title: ListTile(
          title: Text(
            'Bom Dia',
            style: AppStyle.title,
          ),
          subtitle: Text(
            'Administrador',
            style: AppStyle.subtitle,
          ),
          trailing: const CircleAvatar(
            backgroundImage: NetworkImage(
              'https://img.freepik.com/psd-gratuitas/renderizacao-3d-do-personagem-avatar_23-2150611746.jpg?w=740&t=st=1692158086~exp=1692158686~hmac=8d283ae71b93e9b9da51ecdcbea10d278e15c999a6f4ce9e59749e30d9612786',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
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
