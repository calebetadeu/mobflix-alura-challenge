import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/theme/mobflix_theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOBFLIX"),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
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
                    style: MobflixTheme.outlinedButtonStyle(),
                    child: const Text(
                      "Assista agora",
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Conteúdo da Página",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
