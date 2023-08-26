class CardYoutubeModel {
  final TypeCategory type;
  final String url;

  CardYoutubeModel({ required this.type,required this.url});
}

enum TypeCategory {
  mobile,
  frontEnd,
  programming,
}
