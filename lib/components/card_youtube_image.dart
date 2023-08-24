import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube.dart';

class CardYoutubeImage extends StatelessWidget {
  const CardYoutubeImage(
      {super.key, required this.category, required this.image});

  final String category;
  final String image;

  static String? typeCategory;
  static Color? colorCategory;

  @override
  Widget build(BuildContext context) {
    switch (typeCategory) {
      case "Mobile":
        colorCategory = Colors.red.shade400;
      case "Front End":
        colorCategory = Colors.blue.shade500;
      case "Progamação":
        colorCategory = Colors.green.shade300;
    }
    return Column(
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
    );
  }
}
