import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/card_youtube_image.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

class CardYoutubeList extends StatelessWidget {
  const CardYoutubeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CardYoutubeModel> cardYoutubeList = [
      CardYoutubeModel(category: "Mobile", imageAsset: 'images/banner.jpeg'),
      CardYoutubeModel(
          category: "Progamação", imageAsset: 'images/banner.jpeg'),
      CardYoutubeModel(category: "Front End", imageAsset: 'images/banner.jpeg')
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cardYoutubeList.length, // Corrigido o itemCount
        itemBuilder: (BuildContext context, int index) {
          CardYoutubeModel model = cardYoutubeList[index];
          return CardYoutubeImage(
              category: model.category, image: model.imageAsset);
        },
      ),
    );
  }
}
