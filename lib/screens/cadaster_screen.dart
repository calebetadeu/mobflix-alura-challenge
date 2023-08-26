import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

import '../components/input_cadaster.dart';
import '../components/input_select_cadaster.dart';
import '../model/selected_category_model.dart';
import 'home_screen.dart';

class CadasterScreen extends StatelessWidget {
  const CadasterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<SelectedCategoryModel> categoryList = [
      SelectedCategoryModel(
        categoryName: "Mobile",
        typeCategory: TypeCategory.mobile,
      ),
      SelectedCategoryModel(
        categoryName: "Front end",
        typeCategory: TypeCategory.frontEnd,
      ),
      SelectedCategoryModel(
        categoryName: "Progamção",
        typeCategory: TypeCategory.programming,
      ),
      // Adicione mais categorias aqui
    ];

    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 20,
              right: 20.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Cadastre o vídeo",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const InputCadaster(
                    label: "URL",
                    hint: "Ex:SJDMDMMSMMDKFMD",
                  ),
                  InputSelectedCadaster(
                    label: 'Categoria',
                    hint: 'Selecione a área',
                    categoryList: categoryList,
                    initialValue: categoryList[0],
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Text(
                    "Preview",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Image.asset(
                        'images/preview_youtube.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const Home();
                              },
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.blue.shade700,
                        ),
                        child: const Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
