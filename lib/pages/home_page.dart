import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          children: [
            const Gap(20),
            Text(
              'Módulos',
              style: AppStyle.title1,
            ),
            const Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.bookPage);
                      },
                      icon: const Icon(Icons.book_rounded),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Livros',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.campaign_rounded),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Avisos',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.group_rounded),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Usuários',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_rounded),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Empréstimos',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
              ],
            ),
            const Gap(20),
            Text(
              'Ações Rápidas',
              style: AppStyle.title1,
            ),
            const Gap(20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.bookForm);
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Novo Livro',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Criar Aviso',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Novo Usuário',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
                const Gap(20),
                Column(
                  children: [
                    IconButton.filled(
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                      iconSize: 18,
                      color: AppStyle.gray,
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          AppStyle.dark2,
                        ),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const Gap(10),
                    Text(
                      'Criar Empréstimo',
                      style: AppStyle.subtitle,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
