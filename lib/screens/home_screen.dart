import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/components/card_youtube_list_vertical.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube_list_horizontal.dart';
import 'package:mobflix_alura_challenge/routes/mobflix_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOBFLIX"),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            SizedBox(
              height: 155,
              width: double.infinity,
              child: Image.asset(
                'images/banner.jpeg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  child: const Text(
                    "Assista agora",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 20),
          const TagYoutubeListHorizontal(),
          const SizedBox(height: 20),
          const Expanded(child: CardYoutubeList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MobflixRoutes.cadaster);
        },
        shape: const CircleBorder(),
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
