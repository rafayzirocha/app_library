import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/user_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as UserModel;
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
                    Navigator.of(context).pushNamed(AppRoutes.userForm);
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
                                ref.read(usersProvider).delete(data.docId);

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
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          data.name,
                          style: AppStyle.title1,
                        ),
                      ),
                      Text(
                        data.rm.toString(),
                        style: AppStyle.title3,
                      ),
                      const Gap(20),
                      Container(
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
                          data.email,
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
                      Chip(
                        label: Text(
                          data.phoneNumber,
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
