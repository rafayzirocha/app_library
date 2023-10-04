// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/service_provider.dart';

class UserCard extends ConsumerWidget {
  const UserCard({
    super.key,
    required this.getIndex,
    required this.user,
  });

  final int getIndex;
  final UserModel user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaUsuarios);
    return data.when(
      data: (data) => ListTile(
        title: Text(
          data[getIndex].name,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.title2,
        ),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Text(
          data[getIndex].email,
          style: AppStyle.subtitle,
          overflow: TextOverflow.ellipsis,
        ),
        leading: SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppStyle.dark2,
              ),
              child: Icon(
                Icons.image_rounded,
                size: 18,
                color: AppStyle.gray,
              ),
            ),
          ),
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
