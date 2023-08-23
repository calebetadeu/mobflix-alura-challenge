import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

class CardYoutubeList extends StatelessWidget {
  const CardYoutubeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CardYoutubeModel> cardYoutubeList = [
      CardYoutubeModel(
          tagYoutube: const TagYoutube(name: "Mobile", color: Colors.red),
          imageAsset: 'images/banner.jpeg'),
      CardYoutubeModel(
          tagYoutube: const TagYoutube(name: "Mobile", color: Colors.red),
          imageAsset: 'images/banner.jpeg'),
      CardYoutubeModel(
          tagYoutube: const TagYoutube(name: "Mobile", color: Colors.red),
          imageAsset: 'images/banner.jpeg')
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: cardYoutubeList.length, // Corrigido o itemCount
        itemBuilder: (BuildContext context, int index) {
          CardYoutubeModel model = cardYoutubeList[index];
          return Column(
            children: [
              Row(
                children: [
                  TagYoutube(
                    name: model.tagYoutube.name,
                    color: model.tagYoutube.color,
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
                    model.imageAsset,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
