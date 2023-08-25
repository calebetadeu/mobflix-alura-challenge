import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

class CardYoutubeImage extends StatelessWidget {
  const CardYoutubeImage(
      {super.key,
      required this.category,
      required this.image,
      required this.type});

  final String category;
  final String image;
  final TypeCategory type;

  // static String? typeCategory;
  static Color? colorCategory;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case TypeCategory.mobile:
        colorCategory = Colors.red;
      case TypeCategory.frontEnd:
        colorCategory = Colors.green;
      case TypeCategory.programming:
        colorCategory = Colors.blue;
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
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
