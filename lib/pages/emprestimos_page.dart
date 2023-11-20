import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:app_library/widgets/emprestimo_aberto_card.dart';
import 'package:app_library/widgets/emprestimo_concluido_card.dart';
import 'package:app_library/widgets/emprestimo_pendente_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../provider/service_provider.dart';

class EmprestimosPage extends ConsumerWidget {
  const EmprestimosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(buscaUsuarioLogado);

    return user.when(
      data: (user) => DefaultTabController(
        length: 3,
        child: Scaffold(
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
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                            AppRoutes.emprestimosSearchPage,
                          );
                        },
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
                TabBar(
                  physics: const BouncingScrollPhysics(),
                  dividerColor: AppStyle.dark2,
                  labelColor: AppStyle.primary,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 16,
                  ),
                  unselectedLabelColor: AppStyle.gray,
                  indicatorColor: AppStyle.primary,
                  overlayColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    Tab(text: 'Abertos'),
                    Tab(text: 'Pendentes'),
                    Tab(text: 'Concluídos'),
                  ],
                ),
                const Gap(20),
                const Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      ProviderScope(
                        child: TabEmprestimosAbertos(),
                      ),
                      ProviderScope(
                        child: TabEmprestimosPendentes(),
                      ),
                      ProviderScope(
                        child: TabEmprestimosConcluidos(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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

class TabEmprestimosAbertos extends ConsumerWidget {
  const TabEmprestimosAbertos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaEmprestimosAbertos);

    return data.when(
      data: (data) => data.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.network(
                    'https://lottie.host/5a49a2b2-f530-4f69-80ab-8a226dda8b54/6zTUUf7Nhy.json',
                    height: 100,
                    repeat: true,
                    alignment: Alignment.center,
                  ),
                  Text(
                    'Não há empréstimos abertos',
                    style: AppStyle.title3,
                  ),
                ],
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => EmprestimoAbertoCard(
                getIndex: index,
                emprestimo: data[index],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(8);
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

class TabEmprestimosPendentes extends ConsumerWidget {
  const TabEmprestimosPendentes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaEmprestimosPendentes);

    return data.when(
      data: (data) => data.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.network(
                    'https://lottie.host/5a49a2b2-f530-4f69-80ab-8a226dda8b54/6zTUUf7Nhy.json',
                    height: 100,
                    repeat: true,
                    alignment: Alignment.center,
                  ),
                  Text(
                    'Não há empréstimos pendentes',
                    style: AppStyle.title3,
                  ),
                ],
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => EmprestimoPendenteCard(
                getIndex: index,
                emprestimo: data[index],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(8);
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

class TabEmprestimosConcluidos extends ConsumerWidget {
  const TabEmprestimosConcluidos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaEmprestimosConcluidos);

    return data.when(
      data: (data) => data.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LottieBuilder.network(
                    'https://lottie.host/5a49a2b2-f530-4f69-80ab-8a226dda8b54/6zTUUf7Nhy.json',
                    height: 100,
                    repeat: true,
                    alignment: Alignment.center,
                  ),
                  Text(
                    'Não há empréstimos concluídos',
                    style: AppStyle.title3,
                  ),
                ],
              ),
            )
          : ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemCount: data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => EmprestimoConcluidoCard(
                getIndex: index,
                emprestimo: data[index],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(8);
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
