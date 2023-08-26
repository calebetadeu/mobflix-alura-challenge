import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:mobflix_alura_challenge/screens/cadaster/util/youtube_thumbnail.dart';

class CardYoutubeImage extends StatelessWidget {
  const CardYoutubeImage({
    super.key,
    required this.image,
    required this.type,
  });

  final String image;
  final TypeCategory type;
  // final Future<void> launchUrl;

  static Color? colorCategory;
  static String? category;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TypeCategory.mobile:
        colorCategory = Colors.red;
        category = "Mobile";
      case TypeCategory.frontEnd:
        colorCategory = Colors.green;
        category = "Front End";
      case TypeCategory.programming:
        colorCategory = Colors.blue;
        category = "Programmxing";
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              TagYoutube(
                name: category,
                color: colorCategory,
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
