import 'package:app_library/provider/service_provider.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:app_library/widgets/warning_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class WarningsPage extends ConsumerWidget {
  const WarningsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final warningsData = ref.watch(fetchWarnings);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: warningsData.value != null
                      ? warningsData.value!.length
                      : 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => WarningCard(
                    getIndex: index,
                    warning: warningsData.value![index],
                  ),
                  separatorBuilder: (BuildContext context, int index) {
                    return const Gap(8);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.add_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.warningForm);
        },
      ),
    );
  }
}
