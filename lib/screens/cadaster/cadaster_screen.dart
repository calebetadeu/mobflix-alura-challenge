import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:mobflix_alura_challenge/screens/cadaster/util/youtube_thumbnail.dart';
import 'package:provider/provider.dart';

import '../../components/custom_elevated_button.dart';
import '../../components/input_cadaster.dart';
import '../../components/input_select_cadaster.dart';
import '../../model/selected_category_model.dart';
import '../../repositories/mobflix_repository.dart';
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
      typeCategory: TypeCategory.mobile,
    ),
    SelectedCategoryModel(
      typeCategory: TypeCategory.frontEnd,
    ),
    SelectedCategoryModel(
      typeCategory: TypeCategory.programming,
    ),
  ];
  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  ImageProvider _thumbnailImageProvider =
      AssetImage("images/preview_youtube.png");

  @override
  void initState() {
    super.initState();
    _selectedOption = _categoryList.first;
    urlController.addListener(updateThumbnail);
    // Initialize it with the first value
  }

  void updateThumbnail() {
    setState(() {
      _thumbnailImageProvider = getImageProviderFromUrl(urlController.text);
    });
  }

  // Função para obter um ImageProvider adequado
  ImageProvider getImageProviderFromUrl(String url) {
    if (url.isNotEmpty) {
      return NetworkImage(url); // Use NetworkImage para URLs da web
    } else {
      return AssetImage(
          "images/preview_youtube.png"); // Usar a imagem padrão para URLs vazias
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Cadastre o vídeo",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputCadaster(
                    label: "URL",
                    hint: "Ex:SJDMDMMSMMDKFMD",
                    controller: urlController, // Pass the controller
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputSelectedCadaster(
                    label: 'Categoria',
                    hint: 'Selecione a área',
                    categoryList: _categoryList,
                    type: TypeCategory.mobile,
                    onChanged: (SelectedCategoryModel? newValue) {
                      if (newValue != null) {
                        _selectedOption = newValue;
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Text(
                    "Preview",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 4,
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
                CustomElevatedButton(
                  label: 'Cadastrar',
                  onPressed: () async {
                    final CardYoutubeModel model = CardYoutubeModel(
                      url: urlController.text,
                      type: _selectedOption.typeCategory,
                    );
                    await context
                        .read<MobflixRepository>()
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
                  backgroundColor: Colors.blue.shade700,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
