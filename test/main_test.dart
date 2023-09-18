import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobflix_alura_challenge/main.dart';
import 'package:mobflix_alura_challenge/repositories/mobflix_repository.dart';
import 'package:mobflix_alura_challenge/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // Importe o pacote sqflite_common_ffi

void main() {
  group('Home tests', () {
    setUpAll(() {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;// Inicialize a fábrica de bancos de dados FFI antes dos testes
    });

    testWidgets('Test Home widget', (WidgetTester tester) async {

      // Crie um widget de teste com MaterialApp envolvendo a classe MobflixAluraApp
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (context) => MobflixRepository(), // Substitua pela sua classe real
            child: const MobflixAluraApp(),
          ),
        ),
      );

      await tester.pumpAndSettle();


      final homeWidget = find.byType(Home);


      expect(homeWidget, findsOneWidget);


      final button = find.byType(ElevatedButton);
      await tester.tap(button);
      await tester.pump();

    });
  });
}
