import 'package:app_library/pages/book_details.dart';
import 'package:app_library/pages/book_page.dart';
import 'package:app_library/pages/home_page.dart';
import 'package:app_library/pages/loans_details.dart';
import 'package:app_library/pages/login_page.dart';
import 'package:app_library/pages/perfil_page.dart';
import 'package:app_library/pages/register_page.dart';
import 'package:app_library/pages/users_details.dart';
import 'package:app_library/pages/users_form.dart';
import 'package:app_library/pages/warnings_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';
import 'pages/book_form.dart';
import 'pages/avisos_form.dart';
import 'pages/avisos_page.dart';
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
        home: const RegisterPage(),
        routes: {
          AppRoutes.bookPage: (_) => const BookPage(),
          AppRoutes.bookForm: (_) => const AddNewBookScreen(),
          AppRoutes.bookDetails: (_) => const BookDetails(),
          AppRoutes.warningPage: (_) => const AvisosPage(),
          AppRoutes.warningForm: (_) => const AddNewWarningScreen(),
          AppRoutes.warningDetails: (_) => const WarningDetails(),
          AppRoutes.perfilPage: (_) => const PerfilPage(),
          AppRoutes.homePage: (_) => const HomePage(),
          AppRoutes.loginPage: (_) => const LoginPage(),
          AppRoutes.registerPage: (_) => const RegisterPage(),
          AppRoutes.usersDetails: (_) => const UsersDetails(),
          AppRoutes.usersForm: (_) => const AddNewUserPage(),
          AppRoutes.loansDetails: (_) => const LoansDetails(),
        },
      ),
    );
  }
}
