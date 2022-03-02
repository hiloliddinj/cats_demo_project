class CatModel {
  final String url;
  final List<Category> categories;

  CatModel({
    required this.url,
    required this.categories,
  });
}

class Category {
  final int id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });
}
