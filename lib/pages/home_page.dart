import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/library_details.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: <Widget>[
        const LibraryDetails(),
        const BookPage(),
      ][currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.transparent,
        elevation: 0,
        height: 60,
        indicatorColor: const Color(0xFF0066FF),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.local_library_rounded,
              size: 18,
              color: Color(0xFFA9A9A9),
            ),
            selectedIcon: Icon(
              Icons.local_library_rounded,
              size: 18,
              color: Colors.white,
            ),
            label: '',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.library_books_rounded,
              size: 18,
              color: Color(0xFFA9A9A9),
            ),
            selectedIcon: Icon(
              Icons.library_books_rounded,
              size: 18,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
        selectedIndex: currentPageIndex,
      ),
    );
  }
}
