import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:app_library/widgets/emprestimo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../provider/service_provider.dart';

class EmprestimosPage extends ConsumerWidget {
  const EmprestimosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaEmprestimos);

    return data.when(
      data: (data) => DefaultTabController(
        length: 3, // Number of tabs
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
                TabBar(
                  physics: const BouncingScrollPhysics(),
                  dividerColor: AppStyle.dark2,
                  labelColor: AppStyle.primary,
                  labelStyle: GoogleFonts.inter(
                    fontSize: 16,
                  ),
                  unselectedLabelColor: AppStyle.gray,
                  indicatorColor: AppStyle.primary,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    Tab(text: 'Em andamento'),
                    Tab(text: 'Pendentes'),
                    Tab(text: 'Concluídos'),
                  ],
                ),
                const Gap(20),
                Expanded(
                  child: TabBarView(
                    children: [
                      // Your existing code for the first tab
                      data.isEmpty
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
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Gap(8);
                              },
                            ),
                      Center(
                        child: Text(
                          'Tab 2 Content',
                          style: AppStyle.title3,
                        ),
                      ),
                      Center(
                        child: Text(
                          'Tab 2 Content',
                          style: AppStyle.title3,
                        ),
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
