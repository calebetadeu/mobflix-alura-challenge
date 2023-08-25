import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

class MobflixProvider extends ChangeNotifier {
  final List<CardYoutubeModel> _cardsMobile = [
    CardYoutubeModel(
        type: TypeCategory.mobile,
        category: "Mobile",
        imageAsset: 'images/banner.jpeg'),
    CardYoutubeModel(
        type: TypeCategory.mobile,
        category: "Mobile",
        imageAsset: 'images/banner.jpeg'),
    CardYoutubeModel(
        type: TypeCategory.mobile,
        category: "Mobile",
        imageAsset: 'images/banner.jpeg'),
  ];
  final List<CardYoutubeModel> _cardsProgamacao = [
    CardYoutubeModel(
        type: TypeCategory.programming,
        category: "Progamação",
        imageAsset: 'images/banner.jpeg'),
    CardYoutubeModel(
        type: TypeCategory.programming,
        category: "Progamação",
        imageAsset: 'images/banner.jpeg'),
    CardYoutubeModel(
        type: TypeCategory.programming,
        category: "Progamação",
        imageAsset: 'images/banner.jpeg'),
  ];
  final List<CardYoutubeModel> _cardsFrontEnd = [
    CardYoutubeModel(
        type: TypeCategory.frontEnd,
        category: "Front End",
        imageAsset: 'images/banner.jpeg'),
    CardYoutubeModel(
        type: TypeCategory.frontEnd,
        category: "Front End",
        imageAsset: 'images/banner.jpeg'),
    CardYoutubeModel(
        type: TypeCategory.frontEnd,
        category: "Front End",
        imageAsset: 'images/banner.jpeg'),
  ];

  List<CardYoutubeModel> currentList = [];
  MobflixProvider() {
    currentList = _cardsProgamacao;
  }

  Future<void> changeCategory(TypeCategory? type) async {
    switch (type) {
      case TypeCategory.frontEnd:
        currentList = _cardsFrontEnd;
        break;
      case TypeCategory.programming:
        currentList = _cardsProgamacao;
        break;
      case TypeCategory.mobile:
        currentList = _cardsMobile;
        break;
      default:

        // Handle the default case if needed
        break;
    }
    notifyListeners();
  }
}
