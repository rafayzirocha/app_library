import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:app_library/widgets/emprestimo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../provider/service_provider.dart';

class EmprestimosPage extends ConsumerWidget {
  const EmprestimosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaEmprestimos);

    return data.when(
      data: (data) => Scaffold(
        backgroundColor: AppStyle.dark1,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.perfilPage);
                      },
                      child: CircleAvatar(
                        backgroundColor: AppStyle.dark2,
                        child: SvgPicture.asset(
                          'assets/images/user.svg',
                          height: 16,
                          width: 16,
                          color: AppStyle.gray,
                        ),
                      ),
                    ),
                    IconButton.filled(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/images/search.svg',
                        height: 16,
                        width: 16,
                        color: AppStyle.gray,
                      ),
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
                  ],
                ),
              ),
              const Gap(20),
              Expanded(
                child: data.isEmpty
                    ? Center(
                        child: Text(
                          'Não há empréstimos',
                          style: AppStyle.title3,
                        ),
                      )
                    : ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: data.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) => EmprestimoCard(
                          getIndex: index,
                          emprestimo: data[index],
                        ),
                        separatorBuilder: (BuildContext context, int index) {
                          return const Gap(8);
                        },
                      ),
              )
            ],
          ),
        ),
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
