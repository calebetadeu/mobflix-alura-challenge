import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mobflix_alura_challenge/repositories/mobflix_repository.dart';
import 'package:mobflix_alura_challenge/routes/mobflix_routes.dart';
import 'package:mobflix_alura_challenge/screens/cadaster/cadaster_screen.dart';
import 'package:mobflix_alura_challenge/screens/edit_video.dart';
import 'package:mobflix_alura_challenge/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'localizations/app_localization_delegate.dart';
import 'theme/mobflix_theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MobflixRepository()),
    ],
    child: const MobflixAluraApp(),
  ));
}

class MobflixAluraApp extends StatelessWidget {
  const MobflixAluraApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MobflixTheme.theme,
      initialRoute: MobflixRoutes.home,
      routes: {
        MobflixRoutes.cadaster: (context) => const CadasterScreen(),
        MobflixRoutes.editVideo: (context) => const EditVideoScreen(),
      },
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      home: const Home(), //const CadasterS`creen(), //
    );
  }
}
