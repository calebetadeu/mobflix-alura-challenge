import 'package:flutter/material.dart';

import 'tag_youtube.dart';

class TagYoutubeListHorizontal extends StatelessWidget {
  const TagYoutubeListHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TagYoutube> tagYoutubeList = [
      const TagYoutube(name: "Front end", color: Colors.blueAccent),
      const TagYoutube(name: "Progamação", color: Colors.green),
      const TagYoutube(name: "Mobile", color: Colors.red),
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
              child: TagYoutube(name: tag.name, color: tag.color),
            );
          },
        ),
      ),
    );
  }
}
