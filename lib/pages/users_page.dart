import 'package:app_library/constants/app_style.dart';
import 'package:app_library/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../provider/service_provider.dart';
import '../widgets/user_card.dart';

class UsersPage extends ConsumerWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fetchUsers);
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.perfilPage);
                    },
                    child: CircleAvatar(
                      backgroundColor: AppStyle.dark2,
                      child: SvgPicture.asset(
                        'assets/images/user.svg',
                        height: 16,
                        width: 16,
                        color: AppStyle.gray,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton.filled(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/search.svg',
                          height: 16,
                          width: 16,
                          color: AppStyle.gray,
                        ),
                        color: AppStyle.gray,
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            AppStyle.dark2,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      if (user?.email == 'e096bibli@cps.sp.gov.br')
                        IconButton.filled(
                          onPressed: () {
                            //Navigator.of(context).pushNamed(AppRoutes.bookForm);
                          },
                          icon: SvgPicture.asset(
                            'assets/images/plus.svg',
                            height: 12,
                            width: 12,
                            color: AppStyle.white,
                          ),
                          color: AppStyle.gray,
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              AppStyle.primary,
                            ),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(20),
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: data.value != null ? data.value!.length : 0,
                shrinkWrap: true,
                itemBuilder: (context, index) => UserCard(
                  getIndex: index,
                  user: data.value![index],
                ),
                separatorBuilder: (BuildContext context, int index) {
                  return const Gap(8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
