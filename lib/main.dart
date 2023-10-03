import 'package:app_library/pages/book_details.dart';
import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/emprestimo_page.dart';
import 'package:app_library/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
// ignore: unused_import
import 'pages/book_form.dart';
import 'routes/app_routes.dart';

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
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.dark,
        home: const HomePage(),
        routes: {
          AppRoutes.bookPage: (_) => const BookPage(),
          AppRoutes.bookForm: (_) => const AddNewBookScreen(),
          AppRoutes.bookDetails: (_) => const BookDetails(),
          //AppRoutes.warningPage: (_) => const WarningsPage(),
          //AppRoutes.warningForm: (_) => const AddNewWarningScreen(),
          //AppRoutes.warningDetails: (_) => const WarningsDetails(),
          AppRoutes.emprestimoPage: (_) => const EmprestimoPage(),
        },
      ),
    );
  }
}
