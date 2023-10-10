import 'package:firebase_auth/firebase_auth.dart';
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
    return Scaffold(
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
                          'Rafael Rocha Silveira',
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
                              '25039',
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
                              FirebaseAuth.instance.currentUser!.email
                                  .toString(),
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
                              'assets/images/phone.svg',
                              color: AppStyle.primary,
                            ),
                            const Gap(10),
                            Text(
                              '+55 (19) 99665-4546',
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
                              'assets/images/school.svg',
                              color: AppStyle.primary,
                            ),
                            const Gap(10),
                            Text(
                              '3° DSMTEC',
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
            ],
          ),
        ),
      ),
    );
  }
}
