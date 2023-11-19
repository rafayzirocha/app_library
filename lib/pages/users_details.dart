import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/user_model.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../provider/service_provider.dart';

class UsersDetails extends ConsumerWidget {
  const UsersDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as UserModel;
    final usersService = ref.watch(usersServiceProvider);

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
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: () async {
                          final Uri whatsapp = Uri.parse(
                            'https://wa.me/${data.contato}',
                          );
                          launchUrl(whatsapp);
                        },
                        icon: SvgPicture.asset(
                          'assets/images/whatsapp.svg',
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              backgroundColor: AppStyle.dark1,
                              elevation: 0,
                              title: Text(
                                'Confirmação de exclusão',
                                style: AppStyle.title1,
                              ),
                              content: Text(
                                'Tem certeza que deseja excluir esse usuário?',
                                style: AppStyle.title3,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  style: ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                      AppStyle.dark2,
                                    ),
                                  ),
                                  child: Text(
                                    'Cancelar',
                                    style: GoogleFonts.inter(
                                      color: AppStyle.primary,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    usersService.deleteUser(data.docId);
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Excluir',
                                    style: GoogleFonts.inter(
                                      color: AppStyle.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: SvgPicture.asset(
                          'assets/images/trash-2.svg',
                          color: AppStyle.white,
                          height: 16,
                          width: 16,
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
                        data.nome,
                        style: AppStyle.title1,
                      ),
                      Text(
                        data.email,
                        style: AppStyle.title3,
                      ),
                      const Gap(20),
                      CircleAvatar(
                        backgroundColor: AppStyle.dark2,
                        radius: 64,
                        child: SvgPicture.asset(
                          'assets/images/user.svg',
                          height: 24,
                          width: 24,
                          color: AppStyle.gray,
                        ),
                      ),
                      const Gap(20),
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: AppStyle.primary,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          data.rm,
                          style: GoogleFonts.inter(
                            color: AppStyle.white,
                            fontSize: 16,
                          ),
                        ),
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
                    ],
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
