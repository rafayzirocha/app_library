import 'package:app_library/constants/app_style.dart';
import 'package:app_library/model/warning_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class WarningsDetails extends ConsumerWidget {
  const WarningsDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final warningsData =
        ModalRoute.of(context)!.settings.arguments as WarningModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 18,
          color: const Color(0xFF3C3C3C),
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.chevron_left),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            warningsData.title,
                            style: GoogleFonts.jost(
                              fontSize: 20,
                              color: const Color(0xFF3C3C3C),
                            ),
                          ),
                          const Gap(4),
                          const Icon(
                            Icons.verified_rounded,
                            size: 18,
                            color: Color(0xFF0066FF),
                          ),
                        ],
                      ),
                      const Gap(20),
                      warningsData.imageUrl.isNotEmpty
                          ? Container(
                              height: 200,
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  warningsData.imageUrl,
                                  fit: BoxFit.cover,
                                  width: 200,
                                  alignment: Alignment.center,
                                ),
                              ),
                            )
                          : Container(
                              height: 200,
                              width: 200,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF3F3F3),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Icon(
                                Icons.image_rounded,
                                size: 40,
                                color: AppStyle.subtitleColor,
                              ),
                            ),
                      const Gap(20),
                      Details(warningsData: warningsData),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF0066FF),
        child: const Icon(
          Icons.edit_rounded,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.warningsData,
  });

  final WarningModel warningsData;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Descrição',
            style: GoogleFonts.jost(
              fontSize: 20,
              color: const Color(0xFF3C3C3C),
            ),
          ),
          Text(
            warningsData.description,
            style: GoogleFonts.jost(
              fontSize: 16,
              color: const Color(0xFFA9A9A9),
            ),
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
