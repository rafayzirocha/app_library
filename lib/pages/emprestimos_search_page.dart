import 'package:app_library/constants/app_style.dart';
import 'package:app_library/widgets/custom_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmprestimosSearchPage extends StatefulWidget {
  @override
  _EmprestimosSearchPageState createState() => _EmprestimosSearchPageState();
}

class _EmprestimosSearchPageState extends State<EmprestimosSearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<DocumentSnapshot> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.dark1,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppStyle.dark2,
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton.filled(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(FeatherIcons.chevronLeft),
                    iconSize: 18,
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
                  Expanded(
                    child: CustomField(
                      hintText: 'Pesquise pelo livro...',
                      maxLines: 1,
                      controller: _searchController,
                    ),
                  ),
                  IconButton.filled(
                    onPressed: () {
                      _pesquisaEmprestimos();
                    },
                    icon: SvgPicture.asset(
                      'assets/images/search.svg',
                      height: 16,
                      width: 16,
                      color: AppStyle.gray,
                    ),
                    iconSize: 18,
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
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_searchResults[index]['livro']),
                    subtitle: Text(_searchResults[index]['aluno']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _pesquisaEmprestimos() async {
    String searchText = _searchController.text;

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('emprestimos')
        .where('livro', isGreaterThanOrEqualTo: searchText)
        .get();

    setState(() {
      _searchResults = querySnapshot.docs;
    });
  }
}
