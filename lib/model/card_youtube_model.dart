class CardYoutubeModel {
  final TypeCategory type;
  final String imageAsset;

  CardYoutubeModel({required this.imageAsset, required this.type});
}

enum TypeCategory {
  mobile,
  frontEnd,
  programming,
}
