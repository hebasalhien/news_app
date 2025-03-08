import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/widgets/news_widget.dart';

class NewsListView extends StatelessWidget {
  final List<ArticleModel> articles ;

  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return  SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => NewsWidget(articleModel: articles[index]),
            childCount: articles.length,
          ),
        );

    // used the previous widget cause the children of the custom scroll view widget is named slivers
    // so we cannot use any widget before we turn it to sliver so we replaced the list view with the previous widget
    // we can also use SliverList.builder();

    // return ListView.builder(
    //   itemBuilder: (context, index) {
    //     return NewsWidget();
    //   },
    //   physics: NeverScrollableScrollPhysics(),
    //   // when u reach to the end of screen and try to scroll it will make the screen pup up
    //   // as default when u reach to the end of the screen a blue color appears when u try to scroll again
    //   itemCount: 10,
    //   shrinkWrap: true, //not a good solution as it impact on the app performance
    // );
  }
}
