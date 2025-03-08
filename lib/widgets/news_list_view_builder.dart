import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'news_list_view.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({super.key, required this.category});
  final String category; 

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  // ignore: prefer_typing_uninitialized_variables
  var future;
  @override
  void initState() {
    super.initState();
    future = NewsService(Dio()).getGeneralNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: const Text(
                'There was an error',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          );
        } else {
          return SliverFillRemaining(
            child: Center(
              child: CircularProgressIndicator(color: Colors.black),
            ),
          );
        }
      },
    );

    // isLoading
    //     ? SliverFillRemaining(
    //       child: Center(child: CircularProgressIndicator(color: Colors.black)),
    //     )
    //     : NewsListView(articles: articles);
  }
}
