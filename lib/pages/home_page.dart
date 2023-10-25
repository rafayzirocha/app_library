import 'package:app_library/constants/app_style.dart';
import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/avisos_page.dart';
import 'package:app_library/pages/users_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'loans_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: <Widget>[
        const LoansPage(),
        const BookPage(),
        const AvisosPage(),
        if (user.email == 'e096bibli@cps.sp.gov.br') const UsersPage(),
      ][currentIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: const Color(0xFF252525),
        elevation: 0,
        height: 60,
        indicatorColor: AppStyle.dark2,
        onDestinationSelected: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/images/love-1.svg',
              color: AppStyle.gray,
              height: 16,
              width: 16,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/images/love.svg',
              color: AppStyle.primary,
              height: 16,
              width: 16,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/images/book-1.svg',
              color: AppStyle.gray,
              height: 16,
              width: 16,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/images/book.svg',
              color: AppStyle.primary,
              height: 16,
              width: 16,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(
              'assets/images/megaphone.svg',
              color: AppStyle.gray,
              height: 16,
              width: 16,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/images/megaphone-1.svg',
              color: AppStyle.primary,
              height: 16,
              width: 16,
            ),
            label: '',
          ),
          if (user.email == 'e096bibli@cps.sp.gov.br')
            NavigationDestination(
              icon: SvgPicture.asset(
                'assets/images/user-group-1.svg',
                color: AppStyle.gray,
                height: 16,
                width: 16,
              ),
              selectedIcon: SvgPicture.asset(
                'assets/images/user-group.svg',
                color: AppStyle.primary,
                height: 16,
                width: 16,
              ),
              label: '',
            ),
        ],
        selectedIndex: currentIndex,
      ),
    );
  }
}
