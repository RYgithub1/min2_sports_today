import 'package:flutter/material.dart';
import 'package:min2_sports_today/models/model/news_model.dart';
import 'package:min2_sports_today/style/style.dart';



class ArticleTileDesc extends StatelessWidget {

  final Article article;
  const ArticleTileDesc({this.article});


  @override
  Widget build(BuildContext context) {

    final textTheme = Theme.of(context).textTheme;

    var displayDesc = "";
    if (article.description != null){
      displayDesc = article.description;
    }


    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          article.title,
          style: textTheme.subtitle1.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 2),
        Text(
          article.publishedDate,
          style: textTheme.overline.copyWith(
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(height: 2),
        Text(
          displayDesc,
          style: textTheme.bodyText2.copyWith(
            fontFamily: RegularFont,
          ),
        ),
      ],
    );
  }
}