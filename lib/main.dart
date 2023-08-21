import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/screens/home_screen.dart';

import 'theme/mobflix_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: MobflixTheme.theme,
      home: const Home(),
    );
  }
}
