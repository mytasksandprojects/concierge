class Promotions {
  final int? id;
  final String? title;
  final String? titleEn;
  final String? titleAr;
  final String? image;
  final String? imageEn;
  final String? imageAr;
  final String? route;

  Promotions(
      {this.id,
        this.title,
        this.titleEn,
        this.titleAr,
        this.image,
        this.imageEn,
        this.imageAr,
        this.route});

  factory Promotions.fromJson(Map<String, dynamic> json) {
    return Promotions(
      id: json["id"],
      title: json["title"],
      titleEn: json["title_en"],
      titleAr: json["title_ar"],
      image: json["image"],
      imageEn: json["image_en"],
      imageAr: json["image_ar"],
      route: json["route"],
    );
  }
}
