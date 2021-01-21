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


    return displayDesc == ""
    ? Column(
        children: <Widget>[
          SizedBox(height: 20),
          const Icon(Icons.no_cell),
        ]
    )
    : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            displayDesc,
            style: textTheme.bodyText2.copyWith(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: BoldFont,
            ),
          ),
        ],
    );
  }
}