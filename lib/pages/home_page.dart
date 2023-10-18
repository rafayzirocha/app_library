import 'package:app_library/constants/app_style.dart';
import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/dashboard_page.dart';
import 'package:app_library/pages/warnings_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: <Widget>[
        const DashboardPage(),
        const BookPage(),
        const AvisosPage(),
        const DashboardPage(),
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
              'assets/images/home-1.svg',
              color: AppStyle.gray,
              height: 16,
              width: 16,
            ),
            selectedIcon: SvgPicture.asset(
              'assets/images/home.svg',
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
