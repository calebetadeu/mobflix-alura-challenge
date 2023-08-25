class CardYoutubeModel {
  final TypeCategory type;
  final String category;
  final String imageAsset;

  CardYoutubeModel(
      {required this.category, required this.imageAsset, required this.type});
}
enum TypeCategory {
  mobile,
  frontEnd,
  programming,
}
