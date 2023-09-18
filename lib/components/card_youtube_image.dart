import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:mobflix_alura_challenge/screens/cadaster/util/youtube_thumbnail.dart';

import '../l10n/app_localization_en.dart';

class CardYoutubeImage extends StatelessWidget {
  const CardYoutubeImage({
    Key? key,
    required this.image,
    required this.type,
  }) : super(key: key);

  final String image;
  final TypeCategory type;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = AppLocalizations.of(context);

    Color? colorCategory;
    String? category;

    if (localizations != null) {
      switch (type) {
        case TypeCategory.mobile:
          colorCategory = Colors.red;
          category = localizations.mobile;
          break;
        case TypeCategory.frontEnd:
          colorCategory = Colors.green;
          category = localizations.frontEndTitle;
          break;
        case TypeCategory.programming:
          colorCategory = Colors.blue;
          category = localizations.programming;
          break;
      }
    } else {
      // Valores padrão caso localizations seja nulo
      colorCategory = Colors.grey; // Defina uma cor padrão apropriada
      category = "Category"; // Defina uma categoria padrão apropriada
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              TagYoutube(
                name: category ?? "", // Use o valor padrão se category for nulo
                color: colorCategory ?? Colors.grey, // Use o valor padrão se colorCategory for nulo
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: double.infinity,
              child: getYoutubeThumbnail(image),
            ),
          )
        ],
      ),
    );
  }
}
