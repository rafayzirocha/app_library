// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/loan_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class LoanCard extends ConsumerWidget {
  const LoanCard({
    super.key,
    required this.getIndex,
    required this.loan,
  });

  final int getIndex;
  final LoanModel loan;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchLoans);

    String formatDateBR(DateTime date) {
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(date);
    }

    return data.when(
      data: (data) => ListTile(
        isThreeLine: true,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              data[getIndex].bookTitle,
              overflow: TextOverflow.ellipsis,
              style: AppStyle.title2,
            ),
            const Gap(5),
            loan.returned
                ? Icon(
                    Icons.circle,
                    size: 18,
                    color: AppStyle.primary,
                  )
                : const Icon(
                    Icons.circle,
                    size: 18,
                    color: Colors.red,
                  ),
          ],
        ),
        titleAlignment: ListTileTitleAlignment.center,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Retirada: ${formatDateBR(data[getIndex].loanDate)}',
              style: AppStyle.subtitle,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Vencimento: ${formatDateBR(data[getIndex].dueDate)}',
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
            child: data[getIndex].bookUrl.isNotEmpty
                ? Image.network(
                    data[getIndex].bookUrl,
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
            AppRoutes.loansDetails,
            arguments: loan,
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
