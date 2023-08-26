import 'package:flutter/material.dart';
import 'package:mobflix_alura_challenge/model/card_youtube_model.dart';

class MobflixProvider extends ChangeNotifier {
  final List<CardYoutubeModel> cardsMobile = [];
  final List<CardYoutubeModel> cardsProgamacao = [];
  final List<CardYoutubeModel> cardsFrontEnd = [];

  List<CardYoutubeModel> currentList = [];
  MobflixProvider() {
    currentList = cardsProgamacao;
  }

  Future<void> changeCategory(TypeCategory? type) async {
    switch (type) {
      case TypeCategory.frontEnd:
        currentList = cardsFrontEnd;
        break;
      case TypeCategory.programming:
        currentList = cardsProgamacao;
        break;
      case TypeCategory.mobile:
        currentList = cardsMobile;
        break;
      default:

        // Handle the default case if needed
        break;
    }
    notifyListeners();
  }

  Future<void> cadasterVideo(CardYoutubeModel model) async {
    switch (model.type) {
      case TypeCategory.frontEnd:
        cardsFrontEnd.add(model);
        changeCategory(model.type);
        break;
      case TypeCategory.programming:
        cardsProgamacao.add(model);
        changeCategory(model.type);
        break;
      case TypeCategory.mobile:
        cardsMobile.add(model);
        changeCategory(model.type);
        break;
      default:
        break;
    }
    notifyListeners();
  }
}
