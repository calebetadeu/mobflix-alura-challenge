import 'package:flutter/widgets.dart';

class AppLocalizations {
  static const _localizedValues = {
    'title': 'My App',
    'greeting': 'Hello, welcome to my app!',
    
    // Add more localized strings here
  };

  static String? of(BuildContext context, String key) {
    return _localizedValues[key];
  }
}
