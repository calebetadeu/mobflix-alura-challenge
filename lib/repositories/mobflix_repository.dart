import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';

import '../database/db.dart';
import '../model/card_youtube_model.dart';

class MobflixRepository extends ChangeNotifier {
  late Database db;

  final List<CardYoutubeModel> cardsMobile = [];
  final List<CardYoutubeModel> cardsProgamacao = [];
  final List<CardYoutubeModel> cardsFrontEnd = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading; // Getter para isLoading

  List<CardYoutubeModel> currentList = []; // Inicializando como uma lista vazia
  late CardYoutubeModel currentVideoYoutube;
  MobflixRepository() {
    _initializeRepository();
  }

  Future<void> _initializeRepository() async {
    await _initDatabase();
    await _getVideosForCurrentCategory(
        TypeCategory.programming); // Chamando o método
  }

  _initDatabase() async {
    db = await DB.instance.database;
    notifyListeners();
  }

  Future<void> setVideoYoutubeEdit(CardYoutubeModel model) async {
    currentVideoYoutube = model;
  }

  Future<void> changeCategory(TypeCategory? type) async {
    currentList = cardsProgamacao;
    _getVideosForCurrentCategory(type); // Chamando o método
    notifyListeners();
  }

  Future<void> cadasterVideo(CardYoutubeModel model) async {
    await db.insert('videos', {
      'category': model.type.toString(),
      'link': model.url,
      'type': model.type.value,
    });

    _getVideosForCurrentCategory(model.type); // Chamando o método
  }

  Future<void> updateVideo(CardYoutubeModel model) async {
    await db.update(
      'videos',
      {
        'category': model.type.toString(),
        'link': model.url,
        'type': model.type.value,
      },
      where: 'link = ?',
      whereArgs: [model.url],
    );
    currentList.clear(); // Limpa a lista atual
    await _getVideosForCurrentCategory(model.type);
    notifyListeners();
  }


  Future<void> _getVideosForCurrentCategory(TypeCategory? category) async {
    _isLoading =
        true; // Define isLoading como verdadeiro durante o carregamento
    notifyListeners();

    if (category != null) {
      currentList = await _getVideosByCategory(category);
    }

    _isLoading = false; // Define isLoading como falso após o carregamento
    notifyListeners();
  }

  Future<void> deleteVideo(CardYoutubeModel model) async {
    await db.delete(
      'videos',
      where: 'link = ?',
      whereArgs: [model.url],
    );

    _getVideosForCurrentCategory(model.type);
    notifyListeners();
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
