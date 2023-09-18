import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobflix_alura_challenge/components/card_youtube_list_vertical.dart';
import 'package:mobflix_alura_challenge/components/tag_youtube_list_horizontal.dart';

import 'package:mobflix_alura_challenge/screens/cadaster/cadaster_screen.dart';

import 'package:mobflix_alura_challenge/screens/home_screen.dart';

void main() {
  testWidgets('Test Home widget', (WidgetTester tester) async {
    // Construa o widget Home dentro de um MaterialApp
    await tester.pumpWidget(
      const MaterialApp(
        home: Home(),
      ),
    );

    // Espere a construção completa da árvore de widgets
    await tester.pumpAndSettle();

    // Encontre widgets dentro do widget Home e verifique se eles estão presentes
    expect(find.text('MOBFLIX'), findsOneWidget);
    expect(find.text('Assista agora'), findsOneWidget);
    //expect(find.byType(TagYoutubeListHorizontal), findsOneWidget);
   // expect(find.byType(CardYoutubeList), findsOneWidget);

    // Execute uma ação de toque no botão Flutuante
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verifique se a ação do botão Flutuante teve o efeito esperado
    expect(find.byType(CadasterScreen), findsOneWidget);
  });
}
