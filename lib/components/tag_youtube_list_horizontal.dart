import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/l10n/app_localization_en.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:provider/provider.dart';

import '../repositories/mobflix_repository.dart';
import 'tag_youtube.dart';

class TagYoutubeListHorizontal extends StatelessWidget {
  const TagYoutubeListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);
    final TypeCategory? selectedCategory = Provider.of<TypeCategory?>(
      context,
      listen: false,
    );

    final List<TagYoutube> tagYoutubeList = [
      TagYoutube(
        name: localizations?.programming ?? 'Programming', // Fallback se localizations for nulo
        color: Colors.blueAccent,
        type: TypeCategory.programming,
        isSelected: selectedCategory == TypeCategory.programming,
        changeColor: () async {
          await context
              .read<MobflixRepository>()
              .changeCategory(TypeCategory.programming);
        },
      ),
      TagYoutube(
        name: localizations?.frontEndTitle ?? 'Front End', // Fallback se localizations for nulo
        color: Colors.green,
        type: TypeCategory.frontEnd,
        isSelected: selectedCategory == TypeCategory.frontEnd,
        changeColor: () async {
          await context
              .read<MobflixRepository>()
              .changeCategory(TypeCategory.frontEnd);
        },
      ),
      TagYoutube(
        name: localizations?.mobile ?? 'Mobile', // Fallback se localizations for nulo
        color: Colors.red,
        type: TypeCategory.mobile,
        isSelected: selectedCategory == TypeCategory.mobile,
        changeColor: () async {
          await context
              .read<MobflixRepository>()
              .changeCategory(TypeCategory.mobile);
        },
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
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: tagYoutubeList[index],
            );
          },
        ),
      ),
    );
  }
}
