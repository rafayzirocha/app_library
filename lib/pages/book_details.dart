import 'package:app_library/constants/app_style.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/service_provider.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livros = ref.watch(buscaLivros);
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
              Image.network(
                'https://m.media-amazon.com/images/I/617CUx6UO9L._AC_UF1000,1000_QL80_FMwebp_.jpg',
                height: 200,
                width: 200,
              ),
              const Gap(20),
              Text(
                'O Pequeno Princípe',
                style: AppStyle.title,
              ),
              Text(
                'Antoine de Saint-Exupéry',
                style: AppStyle.subtitle,
              ),
              const Gap(20),
              Wrap(
                spacing: 20.0,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFF3F3F3),
                        child: Icon(
                          FeatherIcons.check,
                          size: 18,
                          color: AppStyle.primaryColor,
                        ),
                      ),
                      Text(
                        'Disponível',
                        style: AppStyle.subtitle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFF3F3F3),
                        child: Icon(
                          FeatherIcons.copy,
                          size: 18,
                          color: AppStyle.subtitleColor,
                        ),
                      ),
                      Text(
                        '1 Cópia',
                        style: AppStyle.subtitle,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xFFF3F3F3),
                        child: Icon(
                          FeatherIcons.file,
                          size: 18,
                          color: AppStyle.subtitleColor,
                        ),
                      ),
                      Text(
                        '132 Páginas',
                        style: AppStyle.subtitle,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
