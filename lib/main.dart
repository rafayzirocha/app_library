import 'package:app_library/pages/book_details.dart';
import 'package:app_library/pages/book_form.dart';
import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/library_details.dart';
import 'package:app_library/pages/warnings_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'pages/warnings_form.dart';
import 'pages/warnings_page.dart';
import 'routes/app_routes.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppLibrary());
}

class AppLibrary extends StatelessWidget {
  const AppLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0066FF)),
          useMaterial3: true,
        ),
        home: const HomePage(),
        routes: {
          AppRoutes.homePage: (_) => const HomePage(),
          AppRoutes.libraryDetails: (_) => const LibraryDetails(),
          AppRoutes.bookPage: (_) => const BookPage(),
          AppRoutes.bookForm: (_) => const AddNewBookScreen(),
          AppRoutes.bookDetails: (_) => const BookDetails(),
          AppRoutes.warningPage: (_) => const WarningsPage(),
          AppRoutes.warningForm: (_) => const AddNewWarningScreen(),
          AppRoutes.warningDetails: (_) => const WarningsDetails(),
        },
      ),
    );
  }
}
