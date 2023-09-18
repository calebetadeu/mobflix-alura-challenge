import 'dart:async';

import 'package:flutter/material.dart';

class AppLocalizations {
  final String title;
  final String greeting;
  final String frontEndTitle;
  final String mobile;
  final String programming;
  final String editVideoTitle;
  final String urlLabel;
  final String categoryLabel;
  final String preview;
  final String toAlter;
  final String remove;
  final String cadasterVideo;
  final String cadaster;
  final String selectedArea;
  final String noVideosCategory;
  AppLocalizations(
      {required this.title,
      required this.greeting,
      required this.frontEndTitle,
      required this.mobile,
      required this.programming,
      required this.editVideoTitle,
      required this.urlLabel,
      required this.categoryLabel,
      required this.preview,
      required this.toAlter,
      required this.selectedArea,
      required this.cadaster,
      required this.cadasterVideo,
      required this.noVideosCategory,
      required this.remove});

  static Future<AppLocalizations> load(Locale locale) async {
    String languageCode = locale.languageCode;
    if (languageCode == 'pt') {
      return AppLocalizations.pt();
    } else {
      return AppLocalizations.en();
    }
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  factory AppLocalizations.en() {
    return AppLocalizations(
        title: 'Mobflix',
        greeting: 'Hello, welcome to my app!',
        frontEndTitle: 'Front End',
        mobile: 'Mobile',
        programming: 'Programming',
        editVideoTitle: 'Edit Video',
        urlLabel: 'URL',
        categoryLabel: 'Category',
        preview: 'Preview',
        toAlter: 'Alter',
        cadaster: 'Cadaster',
        noVideosCategory: 'Sem vídeos nesta categoria',
        selectedArea: 'Selected Area',
        cadasterVideo: 'Cadaster Video',
        remove: 'Delete');
  }

  factory AppLocalizations.pt() {
    return AppLocalizations(
        title: 'Mobflix',
        greeting: 'Olá, bem-vindo ao meu aplicativo!',
        frontEndTitle: 'Front End',
        mobile: 'Mobile',
        programming: 'Programação',
        cadasterVideo: 'Cadastre o vídeo',
        editVideoTitle: "Edite o Video",
        urlLabel: "Url",
        categoryLabel: 'Categoria',
        preview: 'Preview',
        toAlter: 'Alterar',
        noVideosCategory: 'Sem vídeos nesta categoria',
        cadaster: 'Cadastre',
        selectedArea: 'Selecione a área',
        remove: 'Remover');
  }
}
