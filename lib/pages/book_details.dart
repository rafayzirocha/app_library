import 'package:app_library/constants/app_style.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../model/book_model.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as BookModel;
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton.filled(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(FeatherIcons.chevronLeft),
                    iconSize: 18,
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
                  if (user?.email == 'e096bibli@cps.sp.gov.br')
                    Row(
                      children: [
                        IconButton.filled(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/pen.svg',
                            color: AppStyle.gray,
                            height: 16,
                            width: 16,
                          ),
                          iconSize: 18,
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
                        IconButton.filled(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/images/trash-2.svg',
                            color: AppStyle.gray,
                            height: 16,
                            width: 16,
                          ),
                          iconSize: 18,
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
                ],
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Text(
                        data.title,
                        style: AppStyle.title1,
                      ),
                      Text(
                        'por ${data.authors.join(', ')}',
                        style: AppStyle.title3,
                      ),
                      const Gap(20),
                      data.thumbnail.isNotEmpty
                          ? Container(
                              height: 200,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  data.thumbnail,
                                  fit: BoxFit.cover,
                                  width: 200,
                                  alignment: Alignment.center,
                                ),
                              ),
                            )
                          : Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppStyle.dark2,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Icon(
                                Icons.image_rounded,
                                size: 40,
                                color: AppStyle.gray,
                              ),
                            ),
                      const Gap(20),
                      IconButton.filled(
                        onPressed: () {},
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        icon: Text(
                          data.category,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: AppStyle.white,
                          ),
                        ),
                        iconSize: 18,
                        color: AppStyle.white,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppStyle.primary,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/id.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'ISBN ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.isbn.join(', '),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
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
                            'Editora ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.publisher,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/globe.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Idioma ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.language,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/calender.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Ano de Publicação ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.publishedDate.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/file.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Quantidade de Páginas ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.pageCount.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/copy.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Quantidade de Cópias ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.copyCount.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/love.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Quantidade de Empréstimos ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.loansCount.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/star.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Média de Avaliações ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.averageRating.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/medal.svg',
                            color: AppStyle.primary,
                          ),
                          const Gap(10),
                          Text(
                            'Total de Avaliações ',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.white,
                            ),
                          ),
                          Text(
                            data.ratingsCount.toString(),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: AppStyle.gray,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Divider(
                        color: AppStyle.dark2,
                      ),
                      const Gap(20),
                      Column(
                        children: [
                          Text(
                            'Descrição',
                            style: AppStyle.title1,
                          ),
                          const Gap(20),
                          Text(
                            data.description,
                            textAlign: TextAlign.justify,
                            style: AppStyle.title3,
                          ),
                        ],
                      ),
                      const Gap(20),
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
                          onPressed: () {},
                          child: Text(
                            'Realizar empréstimo',
                            style: AppStyle.title2,
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
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

Future<dynamic> CustomMsgSuccess(
    BuildContext context, String title, String description) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppStyle.dark1,
        elevation: 0,
        title: Text(
          title,
          style: AppStyle.title1,
        ),
        content: Text(
          description,
          style: AppStyle.title3,
          textAlign: TextAlign.center,
        ),
        icon: LottieBuilder.network(
          'https://lottie.host/786c7314-fe1d-460e-8696-01848358913d/WbWfT8H3Ze.json',
          height: 200,
          width: 200,
          repeat: false,
          alignment: Alignment.center,
        ),
        alignment: Alignment.center,
        insetPadding: const EdgeInsets.all(80),
        scrollable: true,
        contentPadding: const EdgeInsets.only(bottom: 100, left: 20, right: 20),
      );
    },
  );
}
