import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:mobflix_alura_challenge/screens/cadaster/util/youtube_thumbnail.dart';
import 'package:provider/provider.dart';

import '../../components/input_cadaster.dart';
import '../../components/input_select_cadaster.dart';
import '../../model/selected_category_model.dart';
import '../../providers/mobiflix_provider.dart';
import '../home_screen.dart';

class CadasterScreen extends StatefulWidget {
  const CadasterScreen({Key? key}) : super(key: key);

  @override
  State<CadasterScreen> createState() => _CadasterScreenState();
}

class _CadasterScreenState extends State<CadasterScreen> {
  final urlController = TextEditingController();
  late SelectedCategoryModel _selectedOption;

  // late Image _thumbnailYoutube =
  //     Image.asset("images/preview_youtube.png", fit: BoxFit.cover);

  late final List<SelectedCategoryModel> _categoryList = [
    SelectedCategoryModel(
      categoryName: "Mobile",
      typeCategory: TypeCategory.mobile,
    ),
    SelectedCategoryModel(
      categoryName: "Front end",
      typeCategory: TypeCategory.frontEnd,
    ),
    SelectedCategoryModel(
      categoryName: "Progamação",
      typeCategory: TypeCategory.programming,
    ),
  ];
  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _selectedOption = _categoryList[0]; // Initialize it with the first value
  }

  @override
  Widget build(BuildContext context) {
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
                  InputCadaster(
                    label: "URL",
                    hint: "Ex:SJDMDMMSMMDKFMD",
                    controller: urlController, // Pass the controller
                  ),
                  InputSelectedCadaster(
                    label: 'Categoria',
                    hint: 'Selecione a área',
                    categoryList: _categoryList,
                    initialValue: _categoryList[0],
                    onChanged: (SelectedCategoryModel? newValue) {
                      if (newValue != null) {
                        _selectedOption = newValue;
                      }
                    },
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
                      child: getYoutubeThumbnail(urlController.text),
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
                        onPressed: () async {
                          final CardYoutubeModel model = CardYoutubeModel(
                            url: urlController.text,
                            type: _selectedOption.typeCategory,
                          );
                          await context
                              .read<MobflixProvider>()
                              .cadasterVideo(model)
                              .then((value) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return const Home();
                                },
                              ),
                            );
                          });
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
