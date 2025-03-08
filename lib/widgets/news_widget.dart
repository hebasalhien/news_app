import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/news_view.dart';

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewsView(url: articleModel.url,)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 5,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                    articleModel.imagePath ??
                    'https://t3.ftcdn.net/jpg/04/62/93/66/360_F_462936689_BpEEcxfgMuYPfTaIAOC1tCDurmsno7Sp.jpg',
                progressIndicatorBuilder:
                    (context, url, downloadProgress) => SizedBox(
                      height: MediaQuery.of(context).size.height * .27,
                      width: double.infinity,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          value: downloadProgress.progress,
                        ),
                      ),
                    ),
                errorWidget:
                    (context, url, error) => SizedBox(
                      height: MediaQuery.of(context).size.height * .27,
                      width: double.infinity,
                      child: Center(child: Icon(Icons.error, size: 30)),
                    ),
              ),
              //       articleModel.imagePath != null
              //           ? Image.network(
              //             articleModel.imagePath!,
              //             fit: BoxFit.fill,
              //             height: MediaQuery.of(context).size.height * .27,
              //             width: double.infinity,
              //           )
              //           : SizedBox(
              //             height: MediaQuery.of(context).size.height * .27,
              //             width: double.infinity,
              //             child: Center(
              //               child: CircularProgressIndicator(
              //                 color: Colors.black,
              //                 constraints: BoxConstraints(
              //                   minHeight: 50,
              //                   minWidth: 50,
              //                 ),
              //               ),
              //             ),
              //           ),
              //
            ),
            Text(
              articleModel.title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              articleModel.subTitle ?? '',
              style: TextStyle(color: Colors.grey, fontSize: 16),
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
