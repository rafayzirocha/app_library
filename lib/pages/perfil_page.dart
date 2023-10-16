import 'package:app_library/provider/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_style.dart';

class PerfilPage extends ConsumerWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(buscaUsuarioLogado);

    return data.when(
      data: (data) => Scaffold(
        backgroundColor: AppStyle.dark1,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
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
                            data.nome,
                            style: AppStyle.title1,
                          ),
                          Text(
                            'Etec Pedro Ferreira Alves',
                            style: AppStyle.title3,
                          ),
                          const Gap(20),
                          CircleAvatar(
                            backgroundColor: AppStyle.dark2,
                            radius: 64,
                          ),
                          const Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Seu RM é ',
                                style: AppStyle.title2,
                              ),
                              Text(
                                data.rm,
                                style: AppStyle.title3,
                              ),
                            ],
                          ),
                          const Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/email.svg',
                                color: AppStyle.primary,
                              ),
                              const Gap(10),
                              Text(
                                data.email,
                                style: AppStyle.title2,
                              ),
                            ],
                          ),
                          const Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/mobile-phone.svg',
                                color: AppStyle.primary,
                              ),
                              const Gap(10),
                              Text(
                                data.contato.toString(),
                                style: AppStyle.title2,
                              ),
                            ],
                          ),
                          const Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/mortarboard.svg',
                                color: AppStyle.primary,
                              ),
                              const Gap(10),
                              Text(
                                data.curso,
                                style: AppStyle.title2,
                              ),
                            ],
                          ),
                          const Gap(20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Você tem ',
                                style: AppStyle.title2,
                              ),
                              Text(
                                '0',
                                style: GoogleFonts.inter(
                                  color: AppStyle.primary,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                ' empréstimos realizados!',
                                style: AppStyle.title2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: double.infinity,
                  child: FilledButton(
                    style: ButtonStyle(
                      elevation: const MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(
                        AppStyle.primary,
                      ),
                      shape: const MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      ref.watch(authServiceProvider).signOut();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Sair da conta',
                      style: AppStyle.title2,
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
