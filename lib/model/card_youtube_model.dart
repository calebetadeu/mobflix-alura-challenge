class CardYoutubeModel {
  final TypeCategory type;
  final String url;
  final int?   id;
  CardYoutubeModel({required this.type, required this.url, this.id});
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
