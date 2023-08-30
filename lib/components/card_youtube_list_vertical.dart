import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/screens/edit_video.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../model/card_youtube_model.dart';
import '../repositories/mobflix_repository.dart';
import 'card_youtube_image.dart';

class CardYoutubeList extends StatelessWidget {
  const CardYoutubeList({Key? key}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    final Uri? uri = Uri.tryParse(url);

    if (await canLaunchUrl(uri!)) {
      await launchUrl(uri);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MobflixRepository>(
      builder: (context, mobflixProvider, child) {
        List<CardYoutubeModel> list = mobflixProvider.currentList;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              CardYoutubeModel model = list[index];
              return GestureDetector(
                onTap: () {
                  _launchInBrowser(model.url); // Open the YouTube video URL
                },
                onLongPress: () {
                  mobflixProvider.setVideoYoutubeEdit(model).then((_) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const EditVideoScreen();
                        },
                      ),
                    );
                  });
                },
                child: CardYoutubeImage(type: model.type, image: model.url),
              );
            },
          ),
        );
      },
    );
  }
}
