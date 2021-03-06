import 'package:flutter/material.dart';
import 'package:min2_sports_today/models/model/news_model.dart';
import 'package:min2_sports_today/views/conponents/article_tile_desc.dart';
import 'package:min2_sports_today/views/conponents/image_from_url.dart';



class ArticleTile extends StatelessWidget {

  final Article article;
  final ValueChanged onArticleClicked;
  const ArticleTile({this.article, this.onArticleClicked});


  @override
  Widget build(BuildContext context) {

    print("comm101: ArticleTile: ${article.title},  ${article.url}");
    print("comm102: ArticleTile: ${article.urlToImage}");   /// [null]

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  child: ImageFromUrl(imageUrl: article.urlToImage),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ArticleTileDesc(article: article),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}