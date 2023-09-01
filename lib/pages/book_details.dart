import 'package:app_library/constants/app_style.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/book_model.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livro = ModalRoute.of(context)!.settings.arguments as BookModel;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    color: AppStyle.txtColor,
                    iconSize: 18,
                    icon: const Icon(
                      FeatherIcons.chevronLeft,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        color: AppStyle.txtColor,
                        iconSize: 18,
                        icon: const Icon(
                          FeatherIcons.edit2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                elevation: 0,
                                title: Text(
                                  'Confirmar Exclusão',
                                  style: GoogleFonts.plusJakartaSans(
                                    fontSize: 20,
                                    color: AppStyle.txtColor,
                                  ),
                                ),
                                content: Text(
                                  'Você tem certeza de que deseja excluir este livro?',
                                  style: GoogleFonts.plusJakartaSans(
                                    color: AppStyle.txtColor,
                                    fontSize: 14,
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Cancelar',
                                      style: GoogleFonts.plusJakartaSans(
                                        color: AppStyle.primaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      ref
                                          .watch(serviceProvider)
                                          .deleteBook(livro.docId);
                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      'Excluir',
                                      style: GoogleFonts.plusJakartaSans(
                                        color: AppStyle.primaryColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        color: AppStyle.txtColor,
                        iconSize: 18,
                        icon: const Icon(
                          FeatherIcons.trash,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        color: AppStyle.txtColor,
                        iconSize: 18,
                        icon: const Icon(
                          FeatherIcons.share2,
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          livro.imageUrl,
                          height: 300,
                          width: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const Gap(20),
                      Text(
                        livro.title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20,
                          color: AppStyle.txtColor,
                        ),
                      ),
                      Text(
                        " por ${livro.author}",
                        style: GoogleFonts.plusJakartaSans(
                          color: AppStyle.subtitleColor,
                          fontSize: 14,
                        ),
                      ),
                      const Gap(20),
                      Wrap(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Status',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppStyle.subtitleColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                livro.status,
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppStyle.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(),
                          Column(
                            children: [
                              Text(
                                'Páginas',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppStyle.subtitleColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                livro.pages.toString(),
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppStyle.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          const VerticalDivider(),
                          Column(
                            children: [
                              Text(
                                'Cópias',
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppStyle.subtitleColor,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                livro.copies.toString(),
                                style: GoogleFonts.plusJakartaSans(
                                  color: AppStyle.primaryColor,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Gap(20),
                      Column(
                        children: [
                          Text(
                            'Categoria',
                            style: GoogleFonts.plusJakartaSans(
                              color: AppStyle.subtitleColor,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Literatura Brasileira',
                            style: GoogleFonts.plusJakartaSans(
                              color: AppStyle.primaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Sinopse',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 20,
                            color: AppStyle.txtColor,
                          ),
                        ),
                      ),
                      const Gap(8),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          livro.synopsis,
                          style: GoogleFonts.plusJakartaSans(
                            color: AppStyle.subtitleColor,
                            fontSize: 14,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      const Gap(20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        child: FilledButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppStyle.primaryColor,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Realizar Empréstimo',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 14,
                            ),
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
