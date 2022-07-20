class CategoryModel {
  final int? id;
  final String? title;
  final String? description;
  final String? image;

  CategoryModel({
    this.id,
    this.title,
    this.description,
    this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      title: json["title"],
      description: json['description'],
      image: json["image"],
    );
  }
}
