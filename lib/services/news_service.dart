import 'package:dio/dio.dart';
import 'package:news_app/models/article_model.dart';

class NewsService {
  final Dio dio;
  NewsService(this.dio);
  Future<List<ArticleModel>> getGeneralNews({required String category}) async {
    try {
      Response response = await dio.get(
        'https://newsapi.org/v2/top-headlines',
        queryParameters: {
          'category': category,
          'apiKey': 'a8481ad676f14665923a43cdadc8216f',
        },
      );

      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];

      List<ArticleModel> article =
          articles
              .map(
                (article) => ArticleModel(
                  imagePath: article['urlToImage'],
                  title: article['title'],
                  subTitle: article['description'],
                  url: article['url']
                ),
              )
              .toList();
      return article;
    } catch (e) {
      return [];
    }
  }
}
