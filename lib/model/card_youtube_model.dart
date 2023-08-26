class CardYoutubeModel {
  final TypeCategory type;
  final String url;

  CardYoutubeModel({ required this.type,required this.url});
}

enum TypeCategory {
  mobile(),
  frontEnd(),
  programming(),
}
extension TypeCategoryExtension on TypeCategory {
  int get value {
    switch (this) {
      case TypeCategory.mobile:
        return 0;
      case TypeCategory.frontEnd:
        return 1;
      case TypeCategory.programming:
        return 2;
    }
  }
}
