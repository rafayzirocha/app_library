import 'package:app_library/constants/app_style.dart';
import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/login_page.dart';
import 'package:app_library/pages/warnings_page.dart';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<Widget> _telas = [
    const BookPage(),
    const WarningsPage(),
    const LoginPage(),
  ];

  void navTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _telas[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 6,
        onTap: navTap,
        iconSize: 18,
        fixedColor: AppColors.blue,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: AppColors.subtitle,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories_outlined),
            activeIcon: Icon(Icons.auto_stories_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_outlined),
            activeIcon: Icon(Icons.groups_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark_outlined),
            activeIcon: Icon(Icons.collections_bookmark_rounded),
            label: '',
          ),
        ],
      ),
    );
  }
}
