import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131313),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131313),
        title: Text(
          'Explore a Biblioteca',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: const Color(0xFFDCDCDC),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person_rounded,
            size: 18,
            color: Color(0xFFDCDCDC),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_rounded,
                size: 18,
                color: Color(0xFFDCDCDC),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Categorias',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: const Color(0xFFDCDCDC),
                ),
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: CardCategory(
                      icon: Icons.menu_book_rounded,
                      title: 'Livros',
                      subtitle: '0 Cadastrados',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.bookPage);
                      },
                    ),
                  ),
                  const Gap(20),
                  const Expanded(
                    child: CardCategory(
                      icon: Icons.favorite_rounded,
                      title: 'Empréstimos',
                      subtitle: '0 Cadastrados',
                    ),
                  ),
                ],
              ),
              const Gap(20),
              const Row(
                children: [
                  Expanded(
                    child: CardCategory(
                      icon: Icons.campaign_rounded,
                      title: 'Avisos',
                      subtitle: '0 Cadastrados',
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: CardCategory(
                      icon: Icons.group_rounded,
                      title: 'Alunos',
                      subtitle: '0 Cadastrados',
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Text(
                'Ações Rápidas',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: const Color(0xFFDCDCDC),
                ),
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.add_rounded,
                title: 'Adicionar',
                subtitle: 'Novo livro',
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.add_rounded,
                title: 'Publicar',
                subtitle: 'Novo aviso',
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.add_rounded,
                title: 'Cadastrar',
                subtitle: 'Novo aluno',
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.add_rounded,
                title: 'Criar',
                subtitle: 'Empréstimo manualmente',
              ),
              const Gap(20),
              Text(
                'Sobre a Biblioteca',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  color: const Color(0xFFDCDCDC),
                ),
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.local_library_rounded,
                title: 'Biblioteca Francisco Bosnyak Filho',
                subtitle: 'Etec Pedro Ferreira Alves',
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.location_on_rounded,
                title: 'Rua Ariovaldo S. Franco, 237, Jd. 31 de março, Mirante',
                subtitle: 'Mogi Mirim, SP, Brazil',
              ),
              const Gap(20),
              const CardCategory(
                icon: Icons.schedule_rounded,
                title: 'Horário de Funcionamento',
                subtitle: 'Segunda à Sexta das 09:00 às 21:00',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardCategory extends StatelessWidget {
  const CardCategory({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          height: 60,
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1A1A),
            borderRadius: BorderRadius.circular(12),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 18,
                    color: AppColors.blue,
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          color: const Color(0xFFDCDCDC),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFFA9A9A9),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
