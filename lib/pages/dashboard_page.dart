import 'package:app_library/constants/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../provider/service_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(buscaUsuarioLogado);

    return user.when(
      data: (user) => Scaffold(
        backgroundColor: AppStyle.dark1,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Olá,',
                            style: AppStyle.title3,
                          ),
                          Text(
                            user.nome,
                            style: AppStyle.title1,
                          ),
                          LottieBuilder.network(
                            'https://lottie.host/5b7d0452-225c-4133-b237-7980a97c17b7/E8G9WvzaGQ.json',
                            height: 300,
                            repeat: true,
                            alignment: Alignment.center,
                          ),
                          const Gap(20),
                          Row(
                            children: [
                              Expanded(
                                child: Ink(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: InkWell(
                                    splashFactory: InkRipple.splashFactory,
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {},
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppStyle.dark2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 20, 10, 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/book.svg',
                                              color: AppStyle.white,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          const Gap(10),
                                          Text(
                                            '0 Livros',
                                            style: AppStyle.title3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: Ink(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: InkWell(
                                    splashFactory: InkRipple.splashFactory,
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {},
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppStyle.dark2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 20, 10, 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/megaphone-1.svg',
                                              color: AppStyle.white,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          const Gap(10),
                                          Text(
                                            '0 Avisos',
                                            style: AppStyle.title3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(20),
                              Expanded(
                                child: Ink(
                                  decoration: ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: InkWell(
                                    splashFactory: InkRipple.splashFactory,
                                    borderRadius: BorderRadius.circular(20),
                                    onTap: () {},
                                    child: Container(
                                      decoration: ShapeDecoration(
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: AppStyle.dark2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 20, 10, 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/images/user-group.svg',
                                              color: AppStyle.white,
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          const Gap(10),
                                          Text(
                                            '0 Usuários',
                                            style: AppStyle.title3,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Ink(
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: InkWell(
                              splashFactory: InkRipple.splashFactory,
                              borderRadius: BorderRadius.circular(20),
                              onTap: () {},
                              child: Container(
                                width: double.infinity,
                                decoration: ShapeDecoration(
                                  shape: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: AppStyle.dark2,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/images/love.svg',
                                        color: AppStyle.white,
                                        height: 16,
                                        width: 16,
                                      ),
                                    ),
                                    const Gap(20),
                                    Text(
                                      '0 Empréstimos',
                                      style: AppStyle.title3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
