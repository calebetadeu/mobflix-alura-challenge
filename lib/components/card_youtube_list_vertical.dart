import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/card_youtube_model.dart';
import '../providers/mobiflix_provider.dart';
import 'card_youtube_image.dart';

class CardYoutubeList extends StatelessWidget {
  const CardYoutubeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MobflixProvider>(
      builder: (context, mobflixProvider, child) {
        List<CardYoutubeModel> list = mobflixProvider.currentList;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              CardYoutubeModel model = list[index];
              return CardYoutubeImage(
                  type: model.type, image: model.imageAsset);
            },
          ),
        );
      },
    );
  }
}
