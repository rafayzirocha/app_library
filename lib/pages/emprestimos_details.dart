import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/emprestimo_model.dart';
import 'package:app_library/provider/service_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class EmprestimosDetails extends ConsumerWidget {
  const EmprestimosDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as EmprestimoModel;
    final user = FirebaseAuth.instance.currentUser!;

    ValueNotifier<DateTime> selectedDate = ValueNotifier(data.devolucao);

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: data.retirada,
        lastDate: DateTime(DateTime.now().year + 1),
        cancelText: 'Cancelar',
        confirmText: 'Confirmar',
        locale: const Locale('pt', 'BR'),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light(useMaterial3: true).copyWith(
              primaryColor: AppStyle.primary,
              colorScheme: ColorScheme.dark(primary: AppStyle.primary),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
              datePickerTheme: DatePickerThemeData(
                rangePickerSurfaceTintColor: AppStyle.primary,
                headerForegroundColor: AppStyle.white,
                rangePickerHeaderForegroundColor: AppStyle.white,
                rangeSelectionOverlayColor: MaterialStatePropertyAll(
                  AppStyle.primary,
                ),
                elevation: 0,
                backgroundColor: AppStyle.dark1,
                dayStyle: AppStyle.title2,
                headerHeadlineStyle: AppStyle.title1,
                headerHelpStyle: AppStyle.title2,
                surfaceTintColor: AppStyle.primary,
                todayForegroundColor: MaterialStatePropertyAll(
                  AppStyle.primary,
                ),
                weekdayStyle: AppStyle.title2,
                rangePickerBackgroundColor: AppStyle.primary,
                rangePickerElevation: 0,
                rangeSelectionBackgroundColor: AppStyle.primary,
                yearStyle: GoogleFonts.inter(),
              ),
            ),
            child: child!,
          );
        },
      );

      if (pickedDate != null) {
        selectedDate.value = pickedDate;

        Future<void> atualizaDevolucao() async {
          final emprestimosCollection =
              FirebaseFirestore.instance.collection('emprestimos');

          final emprestimosRef = await emprestimosCollection
              .where(
                'rm',
                isEqualTo: data.rm,
              )
              .where(
                'livro',
                isEqualTo: data.livro,
              )
              .get()
              .then((docs) {
            if (docs.docs.isNotEmpty) {
              return docs.docs.first.reference;
            } else {
              return null;
            }
          });

          if (emprestimosRef != null) {
            await emprestimosRef.update({
              'devolucao': pickedDate,
            });
          }
        }

        atualizaDevolucao();

        Navigator.pop(context);
      }
    }

    String dataBr(DateTime date) {
      final formatter = DateFormat('dd/MM/yyyy');
      return formatter.format(date);
    }

    Future<void> atualizaEmprestimo(int rm, String livro) async {
      final emprestimosCollection =
          FirebaseFirestore.instance.collection('emprestimos');

      final livrosCollection = FirebaseFirestore.instance.collection('books');

      final emprestimosRef = await emprestimosCollection
          .where(
            'rm',
            isEqualTo: rm,
          )
          .where(
            'livro',
            isEqualTo: livro,
          )
          .get()
          .then((docs) {
        if (docs.docs.isNotEmpty) {
          return docs.docs.first.reference;
        } else {
          return null;
        }
      });

      if (emprestimosRef != null) {
        await emprestimosRef.update({
          'status': false,
        });
      }

      final livrosRef = await livrosCollection
          .where(
            'title',
            isEqualTo: livro,
          )
          .get()
          .then((docs) {
        if (docs.docs.isNotEmpty) {
          return docs.docs.first.reference;
        } else {
          return null;
        }
      });

      if (livrosRef != null) {
        await livrosRef.update({
          'isAvailable': true,
          'copyCount': FieldValue.increment(1),
        });
      }
    }

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
                  if (user.email == 'e096bibli@cps.sp.gov.br' &&
                      data.status == true)
                    Row(
                      children: [
                        IconButton.filled(
                          onPressed: () {
                            _selectDate(context);
                          },
                          icon: SvgPicture.asset(
                            'assets/images/calender.svg',
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
                                icon: SvgPicture.asset(
                                  'assets/images/trash-2.svg',
                                  color: AppStyle.primary,
                                  height: 16,
                                  width: 16,
                                ),
                                backgroundColor: AppStyle.dark1,
                                elevation: 0,
                                title: Text(
                                  'Cancelar o Empréstimo',
                                  style: AppStyle.title1,
                                ),
                                content: Text(
                                  'Tem certeza que deseja cancelar esse empréstimo?',
                                  style: AppStyle.title3,
                                ),
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    style: ButtonStyle(
                                      overlayColor: MaterialStatePropertyAll(
                                        AppStyle.dark2,
                                      ),
                                    ),
                                    child: Text(
                                      'Não',
                                      style: GoogleFonts.inter(
                                        color: AppStyle.primary,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      ref
                                          .read(emprestimoProvider)
                                          .excluirEmprestimo(data.docId);

                                      Navigator.of(context).pop();
                                      Navigator.of(context).pop();

                                      final snackBar = SnackBar(
                                        elevation: 0,
                                        backgroundColor: AppStyle.dark1,
                                        showCloseIcon: true,
                                        closeIconColor: AppStyle.gray,
                                        content: Text(
                                          'Empréstimo cancelado com sucesso!',
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
                                      'Sim',
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
                        data.livro,
                        style: AppStyle.title1,
                      ),
                      Text(
                        'por ${data.autores.join(', ')}',
                        style: AppStyle.title3,
                      ),
                      const Gap(20),
                      data.urlCapa.isNotEmpty
                          ? Container(
                              height: 200,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  data.urlCapa,
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
                              'assets/images/user.svg',
                              color: AppStyle.white,
                              height: 16,
                              width: 16,
                            ),
                            const Gap(10),
                            Text(
                              data.aluno,
                              style: GoogleFonts.inter(
                                color: AppStyle.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
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
                                    'Retirada ${dataBr(data.retirada)}',
                                    style: AppStyle.title2,
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
                                    'Devolução ${dataBr(data.devolucao)}',
                                    style: AppStyle.title2,
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
              if (user.email == 'e096bibli@cps.sp.gov.br' &&
                  data.status == true)
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
                    onPressed: () {
                      atualizaEmprestimo(data.rm, data.livro);

                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Confirmar Devolução',
                      style: AppStyle.title2,
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
