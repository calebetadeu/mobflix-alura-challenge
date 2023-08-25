import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';
import 'package:mobflix_alura_challenge/providers/mobiflix_provider.dart';
import 'package:provider/provider.dart';

import 'tag_youtube.dart';

class TagYoutubeListHorizontal extends StatelessWidget {
  const TagYoutubeListHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TagYoutube> tagYoutubeList = [
      const TagYoutube(
        name: "Progamação",
        color: Colors.blueAccent,
        type: TypeCategory.programming,
      ),
      const TagYoutube(
        name: "Front End",
        color: Colors.green,
        type: TypeCategory.frontEnd,
      ),
      const TagYoutube(
          name: "Mobile", color: Colors.red, type: TypeCategory.mobile),
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
                      .read<MobflixProvider>()
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
