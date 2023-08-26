import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/routes/mobflix_routes.dart';
import 'package:mobflix_alura_challenge/providers/mobiflix_provider.dart';
import 'package:mobflix_alura_challenge/screens/cadaster/cadaster_screen.dart';
import 'package:mobflix_alura_challenge/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'theme/mobflix_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MobflixProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MobflixTheme.theme,
      initialRoute: MobflixRoutes.home,
      routes: {
        MobflixRoutes.cadaster: (context) => const CadasterScreen(),
      },
      home: const Home(), //const CadasterScreen(), //
    );
  }
}
