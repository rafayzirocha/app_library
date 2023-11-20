// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/emprestimo_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class EmprestimoAbertoCard extends ConsumerWidget {
  const EmprestimoAbertoCard({
    super.key,
    required this.getIndex,
    required this.emprestimo,
  });

  final int getIndex;
  final EmprestimoModel emprestimo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaEmprestimosAbertos);

    String dataBr(DateTime date) {
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(date);
    }

    return data.when(
      data: (data) => ListTile(
        isThreeLine: true,
        title: Text(
          data[getIndex].livro,
          overflow: TextOverflow.ellipsis,
          style: AppStyle.title2,
        ),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Retirada: ${dataBr(data[getIndex].retirada)}',
              style: AppStyle.subtitle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Devolução: ${dataBr(data[getIndex].devolucao)}',
              style: AppStyle.subtitle,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        leading: SizedBox(
          height: 60,
          width: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: data[getIndex].urlCapa.isNotEmpty
                ? Image.network(
                    data[getIndex].urlCapa,
                    fit: BoxFit.cover,
                  )
                : Container(
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
        onTap: () {
          Navigator.of(context).pushNamed(
            AppRoutes.emprestimosDetails,
            arguments: emprestimo,
          );
        },
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
