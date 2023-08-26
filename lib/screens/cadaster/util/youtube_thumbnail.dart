import 'package:flutter/material.dart';

Widget getYoutubeThumbnail(String videoUrl) {
  final Uri? uri = Uri.tryParse(videoUrl);
  if (uri == null || uri.hasEmptyPath) {
    // Return a default thumbnail widget or an appropriate image asset widget
    return Image.asset("images/preview_youtube.png", fit: BoxFit.cover);
  }

  return Image.network(
    'https://img.youtube.com/vi/${uri.queryParameters['v']}/0.jpg',
    fit: BoxFit.cover,
    errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
      // Return the default thumbnail widget or any custom widget for error
      return Image.asset("images/preview_youtube.png", fit: BoxFit.cover);
    },
  );
}
