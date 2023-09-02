import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../components/custom_elevated_button.dart';
import '../components/input_cadaster.dart';
import '../components/input_select_cadaster.dart';
import '../l10n/app_localization_en.dart';
import '../model/card_youtube_model.dart';
import '../model/selected_category_model.dart';
import '../repositories/mobflix_repository.dart';
import 'cadaster/util/youtube_thumbnail.dart';

class EditVideoScreen extends StatefulWidget {
  const EditVideoScreen({Key? key}) : super(key: key);

  @override
  _EditVideoScreenState createState() => _EditVideoScreenState();
}

class _EditVideoScreenState extends State<EditVideoScreen> {
  final urlController = TextEditingController();

  late SelectedCategoryModel _selectedOption;
  late SelectedCategoryModel _initialValue;

  late final List<SelectedCategoryModel> _categoryList = [
    SelectedCategoryModel(typeCategory: TypeCategory.mobile),
    SelectedCategoryModel(typeCategory: TypeCategory.frontEnd),
    SelectedCategoryModel(typeCategory: TypeCategory.programming),
  ];

  @override
  void initState() {
    super.initState();
    _selectedOption = _categoryList[0];

    final mobflixProvider = context.read<MobflixRepository>();
    urlController.text = mobflixProvider.currentVideoYoutube.url;
    _initialValue = SelectedCategoryModel(
        typeCategory: mobflixProvider.currentVideoYoutube.type);
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);

    return Consumer<MobflixRepository>(
      builder: (context, mobflixProvider, child) {
        final currentVideo = mobflixProvider.currentVideoYoutube;
        return Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      localizations.editVideoTitle,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputCadaster(
                        label: localizations.urlLabel,
                        hint: "Ex:SJDMDMMSMMDKFMD",
                        controller: urlController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InputSelectedCadaster(
                        label: localizations.categoryLabel,
                        hint: localizations.selectedArea,
                        categoryList: _categoryList,
                        type: mobflixProvider.currentVideoYoutube.type,
                        onChanged: (SelectedCategoryModel? newValue) {
                          if (newValue != null) {
                            setState(() {
                              _selectedOption = newValue;
                            });
                          }
                        },
                      ),
                    ),
                    //     const SizedBox(height: 19),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        localizations.preview,
                        style: const TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    //      const SizedBox(height: 12),
                    Center(
                      child: SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: getYoutubeThumbnail(
                          mobflixProvider.currentVideoYoutube.url,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomElevatedButton(
                      label: localizations.toAlter,
                      onPressed: () async {
                        final CardYoutubeModel model = CardYoutubeModel(
                          url: urlController.text,
                          type: _selectedOption.typeCategory,
                        );
                        await context
                            .read<MobflixRepository>()
                            .updateVideo(model)
                            .then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        });
                      },
                      backgroundColor: Colors.blue.shade700,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 8),
                    CustomElevatedButton(
                      label: localizations.remove,
                      onPressed: () async {
                        await context
                            .read<MobflixRepository>()
                            .deleteVideo(currentVideo)
                            .then((value) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          );
                        });
                      },
                      backgroundColor: Colors.red.shade800,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
