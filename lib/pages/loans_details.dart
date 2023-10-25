import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/loan_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoansDetails extends ConsumerWidget {
  const LoansDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as LoanModel;
    final user = FirebaseAuth.instance.currentUser!;

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
                  if (user.email == 'e096bibli@cps.sp.gov.br')
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
                                  'Tem certeza que deseja excluir este empréstimo?',
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
                                      ref
                                          .read(loanProvider)
                                          .deleteLoan(data.docId);

                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Empréstimo excluído com sucesso!',
                                          style: AppStyle.subtitle,
                                        ),
                                        duration: const Duration(seconds: 5),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    },
                                    style: ButtonStyle(
                                      overlayColor: MaterialStatePropertyAll(
                                        AppStyle.dark2,
                                      ),
                                    ),
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data.bookTitle,
                            style: AppStyle.title1,
                          ),
                          const Gap(5),
                          data.returned
                              ? Icon(
                                  Icons.circle,
                                  size: 18,
                                  color: AppStyle.primary,
                                )
                              : const Icon(
                                  Icons.circle,
                                  size: 18,
                                  color: Colors.red,
                                ),
                        ],
                      ),
                      Text(
                        'por ${data.bookAuthors.join(', ')}',
                        style: AppStyle.title3,
                      ),
                      const Gap(20),
                      data.bookUrl.isNotEmpty
                          ? Container(
                              height: 200,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  data.bookUrl,
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
                      Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: AppStyle.primary,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              'assets/images/email.svg',
                              color: AppStyle.white,
                              height: 16,
                              width: 16,
                            ),
                            const Gap(10),
                            Text(
                              data.userEmail,
                              style: GoogleFonts.inter(
                                color: AppStyle.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Container(
                        decoration: ShapeDecoration(
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppStyle.dark2,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/mortarboard.svg',
                              color: AppStyle.primary,
                              height: 16,
                              width: 16,
                            ),
                            const Gap(20),
                            Text(
                              'ISBN ${data.bookIsbn.join(',')}',
                              style: AppStyle.title3,
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppStyle.dark2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/calender.svg',
                                    color: AppStyle.primary,
                                    height: 16,
                                    width: 16,
                                  ),
                                  const Gap(10),
                                  Text(
                                    'Retirada ${data.loanDate}',
                                    style: AppStyle.title3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            child: Container(
                              decoration: ShapeDecoration(
                                shape: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppStyle.dark2,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/calender.svg',
                                    color: AppStyle.primary,
                                    height: 16,
                                    width: 16,
                                  ),
                                  const Gap(10),
                                  Text(
                                    'Devolução ${data.dueDate}',
                                    style: AppStyle.title3,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
                    splashFactory: InkRipple.splashFactory,
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/images/whatsapp.svg',
                        color: AppStyle.white,
                        height: 16,
                        width: 16,
                      ),
                      const Gap(10),
                      Text(
                        'Enviar mensagem',
                        style: AppStyle.title2,
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