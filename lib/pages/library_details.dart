import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryDetails extends ConsumerWidget {
  const LibraryDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final data = ModalRoute.of(context)!.settings.arguments as WarningModel;

    return Scaffold(
      backgroundColor: Colors.white,
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
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Biblioteca Francisco Bosnyak Filho',
                            style: GoogleFonts.jost(
                              fontSize: 20,
                              color: const Color(0xFF3C3C3C),
                            ),
                          ),
                          const Gap(4),
                          const Icon(
                            Icons.check_circle_rounded,
                            size: 18,
                            color: Color(0xFF0066FF),
                          ),
                        ],
                      ),
                      Text(
                        'Etec Pedro Ferreira Alves',
                        style: GoogleFonts.jost(
                          fontSize: 16,
                          color: const Color(0xFFA9A9A9),
                        ),
                      ),
                      const Gap(20),
                      Container(
                        height: 200,
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://scontent.fcpq2-1.fna.fbcdn.net/v/t39.30808-6/308638410_408758088096252_1748782347015857449_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=52f669&_nc_eui2=AeGNgNOiqA2J3ML4Xr16vgNcYCSCW8vLXatgJIJby8tdq02KAhvGQ1uRPFEXPYFqBfH_FkjlfkU9eDY8oyrYI598&_nc_ohc=mx7IwRrsEoIAX_XpczB&_nc_ht=scontent.fcpq2-1.fna&oh=00_AfDk1CKO7yq9wMQK-dkG3lTO5bDkajqOZzQOcSns0D1fbw&oe=650D28F0',
                            fit: BoxFit.cover,
                            width: 200,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      const Gap(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.location_on_rounded),
                            iconSize: 18,
                            color: const Color(0xFFA9A9A9),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.email_rounded),
                            iconSize: 18,
                            color: const Color(0xFFA9A9A9),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.call_rounded),
                            iconSize: 18,
                            color: const Color(0xFFA9A9A9),
                          ),
                        ],
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
