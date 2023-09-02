import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/l10n/app_localization_en.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:provider/provider.dart';

import '../repositories/mobflix_repository.dart';
import 'tag_youtube.dart';

class TagYoutubeListHorizontal extends StatefulWidget {
  const TagYoutubeListHorizontal({Key? key}) : super(key: key);

  @override
  State<TagYoutubeListHorizontal> createState() =>
      _TagYoutubeListHorizontalState();
}

class _TagYoutubeListHorizontalState extends State<TagYoutubeListHorizontal> {
  TypeCategory? selectedCategory;
  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    List<TagYoutube> tagYoutubeList = [
      TagYoutube(
        name: localizations.programming,
        color: Colors.blueAccent,
        type: TypeCategory.programming,
        isSelected: selectedCategory == TypeCategory.programming,
      ),
      TagYoutube(
        name: localizations.frontEndTitle,
        color: Colors.green,
        type: TypeCategory.frontEnd,
        isSelected: selectedCategory == TypeCategory.programming,
      ),
      TagYoutube(
        name: localizations.mobile,
        color: Colors.red,
        type: TypeCategory.mobile,
        isSelected: selectedCategory == TypeCategory.programming,
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 50, // Altura da lista horizontal
        child: ListView.builder(
          scrollDirection: Axis.horizontal, // Define a orientação horizontal
          itemCount: tagYoutubeList.length, // Número de itens na lista
          itemBuilder: (BuildContext context, int index) {
            TagYoutube tag = tagYoutubeList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: TagYoutube(
                name: tag.name,
                color: tag.color,
                changeColor: () async {
                  await context
                      .read<MobflixRepository>()
                      .changeCategory(tag.type);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
