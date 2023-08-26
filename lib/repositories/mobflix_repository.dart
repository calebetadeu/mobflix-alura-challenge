import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database/db.dart';
import '../model/card_youtube_model.dart';

class MobflixRepository extends ChangeNotifier {
  late Database db;

  final List<CardYoutubeModel> cardsMobile = [];
  final List<CardYoutubeModel> cardsProgamacao = [];
  final List<CardYoutubeModel> cardsFrontEnd = [];
  List<CardYoutubeModel> currentList = [];

  MobflixRepository() {
    _initDatabase();
    currentList = cardsProgamacao;
  }

  _initDatabase() async {
    db = await DB.instance.database;
  }

  Future<void> changeCategory(TypeCategory? type) async {
    switch (type) {
      case TypeCategory.frontEnd:
        currentList = await _getVideosByCategory(TypeCategory.frontEnd);
        break;
      case TypeCategory.programming:
        currentList = await _getVideosByCategory(TypeCategory.programming);
        break;
      case TypeCategory.mobile:
        currentList = await _getVideosByCategory(TypeCategory.mobile);
        break;
      default:
        // Handle the default case if needed
        break;
    }
    notifyListeners();
  }

  Future<void> cadasterVideo(CardYoutubeModel model) async {
    await db.insert('videos', {
      'category': model.type.toString(),
      'link': model.url,
      'type': model.type.value,
    });

    await changeCategory(model.type);
  }

  Future<List<CardYoutubeModel>> _getVideosByCategory(
      TypeCategory category) async {
    final List<Map<String, dynamic>> maps = await db.query(
      'videos',
      where: 'category = ?',
      whereArgs: [category.toString()],
    );

    return List.generate(maps.length, (index) {
      return CardYoutubeModel(
        type: category,
        url: maps[index]['link'],
      );
    });
  }
}
