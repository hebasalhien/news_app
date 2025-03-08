class ArticleModel {
  final String? imagePath;
  final String title;
  final String? subTitle;
  final String url;
  ArticleModel({
    required this.url,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  factory ArticleModel.fromjson(Map<String, dynamic> json) {
    return ArticleModel(
      imagePath: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      url: json['url'],
    );
  }
}
