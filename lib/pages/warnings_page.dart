import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/warning_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

class AvisosPage extends ConsumerWidget {
  const AvisosPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchWarnings);

    List<String> suaListaDeStrings = [
      'Eventos',
      'Prêmios',
    ];

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      appBar: AppBar(
        backgroundColor: AppStyle.dark1,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left,
            size: 18,
            color: AppStyle.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 10.0,
                    children: List<Widget>.generate(
                      suaListaDeStrings.length,
                      (int index) {
                        final String label = suaListaDeStrings[index];
                        return FilterChip(
                          padding: const EdgeInsets.all(10),
                          label: Text(
                            label,
                            style: AppStyle.subtitle,
                          ),
                          backgroundColor: AppStyle.dark2,
                          elevation: 0,
                          onSelected: (value) {},
                          pressElevation: 0,
                          selected: false,
                          selectedColor: AppStyle.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          side: BorderSide.none,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: data.value != null ? data.value!.length : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) => WarningCard(
                  getIndex: index,
                  aviso: data.value![index],
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(8);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppStyle.primary,
        child: Icon(
          Icons.add,
          color: AppStyle.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.warningForm);
        },
      ),
    );
  }
}
