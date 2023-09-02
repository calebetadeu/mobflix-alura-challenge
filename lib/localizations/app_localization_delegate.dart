import 'package:flutter/material.dart';


import '../l10n/app_localization_en.dart'; // Importe sua classe AppLocalizations

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // Carregue a instância correta da classe AppLocalizations com base no idioma
    if (locale.languageCode == 'pt') {
      return AppLocalizations.pt();
    } else {
      return AppLocalizations.en();
    }
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
