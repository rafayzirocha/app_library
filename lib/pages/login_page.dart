import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/custom_dropdown.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:app_library/widgets/custom_field_descricao.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import '../model/book_model.dart';
import '../provider/service_provider.dart';
import '../routes/app_routes.dart';

// ignore: non_constant_identifier_names
final NewLoginProvider =
    StateNotifierProvider<NewLoginModalController, NewLoginData>((ref) {
  return NewLoginModalController();
});

class NewLoginData {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
}

class NewLoginModalController extends StateNotifier<NewLoginData> {
  NewLoginModalController() : super(NewLoginData());

  @override
  void dispose() {
    state.emailController.dispose();
    state.senhaController.dispose();
    super.dispose();
  }
}

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = NewLoginData().emailController;
    final senhaController = NewLoginData().senhaController;

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      CustomField(
                        controller: emailController,
                        hintText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 1,
                      ),
                      const Gap(20),
                      CustomField(
                        controller: senhaController,
                        hintText: 'Senha',
                        keyboardType: TextInputType.visiblePassword,
                        maxLines: 1,
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: FilledButton(
                  style: ButtonStyle(
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
                  onPressed: () {},
                  child: Text(
                    'Entrar',
                    style: AppStyle.title2,
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
