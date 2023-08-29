import 'package:app_library/pages/book_details.dart';
import 'package:app_library/pages/book_form.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
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
          AppRoutes.bookForm: (_) => AddNewBookScreen(),
          AppRoutes.bookDetails: (_) => const BookDetails(),
        },
      ),
    );
  }
}
