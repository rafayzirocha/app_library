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
import 'package:lottie/lottie.dart';
import '../model/book_model.dart';

class BookDetails extends ConsumerWidget {
  const BookDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ModalRoute.of(context)!.settings.arguments as BookModel;
    final user = FirebaseAuth.instance.currentUser!;
    final dataUser = ref.watch(buscaUsuarioLogado);

    DateTime dataAtual = DateTime.now();
    DateTime dataComUmaSemana = dataAtual.add(const Duration(days: 7));

    Future<void> updateBookCopyCount(String title) async {
      final booksCollection = FirebaseFirestore.instance.collection('books');

      final bookRef = await booksCollection
          .where('title', isEqualTo: title)
          .get()
          .then((docs) {
        if (docs.docs.isNotEmpty) {
          return docs.docs.first.reference;
        } else {
          return null;
        }
      });

      if (bookRef != null) {
        await bookRef.update({
          'copyCount': FieldValue.increment(-1),
          'loansCount': FieldValue.increment(1),
        });

        final book = await bookRef.get();
        if (book.get('copyCount') == 0) {
          await bookRef.update({
            'isAvailable': false,
          });
        }
      }
    }

    return dataUser.when(
      data: (dataUser) => Scaffold(
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
                                'Excluir o Livro',
                                style: AppStyle.title1,
                              ),
                              content: Text(
                                'Tem certeza que deseja excluir o livro?',
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
                                    'Cancelar',
                                    style: GoogleFonts.inter(
                                      color: AppStyle.primary,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(bookProvider)
                                        .deleteBook(data.docId);

                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();

                                    final snackBar = SnackBar(
                                      elevation: 0,
                                      backgroundColor: AppStyle.dark1,
                                      showCloseIcon: true,
                                      closeIconColor: AppStyle.gray,
                                      content: Text(
                                        'Livro ${data.title} excluído com sucesso!',
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
                              data.title,
                              style: AppStyle.title1,
                            ),
                            const Gap(5),
                            data.isAvailable
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
                                'assets/images/category.svg',
                                color: AppStyle.white,
                                height: 16,
                                width: 16,
                              ),
                              const Gap(10),
                              Text(
                                data.category,
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
                                'ISBN ${data.isbn.join(',')}',
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
                                      'assets/images/language.svg',
                                      color: AppStyle.primary,
                                      height: 16,
                                      width: 16,
                                    ),
                                    const Gap(10),
                                    Text(
                                      data.language,
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
                                      'assets/images/file.svg',
                                      color: AppStyle.primary,
                                      height: 16,
                                      width: 16,
                                    ),
                                    const Gap(10),
                                    Text(
                                      '${data.pageCount} páginas',
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
                                      'assets/images/copy.svg',
                                      color: AppStyle.primary,
                                      height: 16,
                                      width: 16,
                                    ),
                                    const Gap(10),
                                    Text(
                                      '${data.copyCount} cópias',
                                      style: AppStyle.title3,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                              if (user.email == 'e096bibli@cps.sp.gov.br') {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Não foi possível realizar o empréstimo pois o usuário é Administrador!',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else if (data.copyCount == 0) {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Sem cópias disponíveis do livro',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else if (data.isAvailable == false) {
                                final snackBar = SnackBar(
                                  elevation: 0,
                                  backgroundColor: AppStyle.dark1,
                                  showCloseIcon: true,
                                  closeIconColor: AppStyle.gray,
                                  content: Text(
                                    'Livro não disponível para empréstimo',
                                    style: AppStyle.subtitle,
                                  ),
                                  duration: const Duration(seconds: 5),
                                );

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                int rm = int.parse(dataUser.rm);

                                ref.read(emprestimoProvider).novoEmprestimo(
                                      EmprestimoModel(
                                        aluno: dataUser.nome,
                                        email: dataUser.email,
                                        curso: dataUser.curso,
                                        contato: dataUser.contato,
                                        rm: rm,
                                        livro: data.title,
                                        isbn: data.isbn,
                                        autores: data.authors,
                                        urlCapa: data.thumbnail,
                                        retirada: dataAtual,
                                        devolucao: dataComUmaSemana,
                                        status: true,
                                      ),
                                    );

                                updateBookCopyCount(data.title);

                                Navigator.of(context).pop();

                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 20),
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                          maxHeight: double.infinity,
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                        ),
                                        child: Wrap(
                                          crossAxisAlignment:
                                              WrapCrossAlignment.center,
                                          alignment: WrapAlignment.center,
                                          children: [
                                            LottieBuilder.network(
                                              'https://lottie.host/786c7314-fe1d-460e-8696-01848358913d/WbWfT8H3Ze.json',
                                              height: 200,
                                              repeat: true,
                                              alignment: Alignment.center,
                                            ),
                                            Text(
                                              'Empréstimo realizado com sucesso!',
                                              style: AppStyle.title1,
                                            ),
                                            Text(
                                              'Você já pode retirar seu livro na biblioteca.',
                                              style: AppStyle.title3,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  backgroundColor: AppStyle.dark1,
                                  elevation: 0,
                                );
                              }
                            },
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
      ),
      error: (error, StackTrace) => Center(
        child: Text(StackTrace.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
