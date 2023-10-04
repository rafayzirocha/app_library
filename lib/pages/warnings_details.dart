import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DetalhesAvisos extends ConsumerWidget {
  const DetalhesAvisos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as WarningModel;
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.warningForm);
                  },
                  icon: Icon(
                    Icons.edit_rounded,
                    size: 18,
                    color: AppStyle.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppStyle.dark1,
                          elevation: 0,
                          title: Text(
                            'Confirmar Exclusão',
                            style: AppStyle.title1,
                          ),
                          content: Text(
                            'Tem certeza de que deseja excluir este registro?',
                            style: AppStyle.title3,
                          ),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                textStyle: MaterialStatePropertyAll(
                                  GoogleFonts.inter(
                                    color: AppStyle.gray,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Cancelar',
                                style: GoogleFonts.inter(
                                  color: AppStyle.gray,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            TextButton(
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                textStyle: MaterialStatePropertyAll(
                                  GoogleFonts.inter(
                                    color: AppStyle.primary,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                ref
                                    .read(warningProvider)
                                    .deleteWarning(data.docId);

                                Navigator.of(context).pop();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 0,
                                    backgroundColor: AppStyle.dark1,
                                    showCloseIcon: true,
                                    closeIconColor: AppStyle.gray,
                                    content: Text(
                                      'Registro excluído com sucesso!',
                                      style: AppStyle.subtitle,
                                    ),
                                    duration: const Duration(seconds: 5),
                                  ),
                                );

                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'Confirmar',
                                style: GoogleFonts.inter(
                                  color: AppStyle.primary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    size: 18,
                    color: AppStyle.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        data.title,
                        style: AppStyle.title1,
                      ),
                    ),
                    const Gap(20),
                    data.imageUrl.isNotEmpty
                        ? Container(
                            height: 200,
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                data.imageUrl,
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
                    Chip(
                      label: Text(
                        data.category,
                        style: GoogleFonts.inter(
                          color: AppStyle.gray,
                          fontSize: 14,
                        ),
                      ),
                      backgroundColor: AppStyle.dark2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide.none,
                      ),
                      side: BorderSide.none,
                      elevation: 0,
                    ),
                    const Gap(20),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Descrição',
                            style: AppStyle.title1,
                          ),
                          const Gap(10),
                          Text(
                            data.description,
                            textAlign: TextAlign.justify,
                            style: AppStyle.title3,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 45,
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
                          Radius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.emprestimoPage);
                  },
                  child: Text(
                    'Realizar empréstimo',
                    style: AppStyle.title2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
