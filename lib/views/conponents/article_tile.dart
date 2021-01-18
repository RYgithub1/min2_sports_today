import 'package:flutter/material.dart';
import 'package:min2_sports_today/models/model/news_model.dart';



class ArticleTile extends StatelessWidget {

  final Article article;
  final ValueChanged onArticleClicked;
  const ArticleTile({this.article, this.onArticleClicked});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: () => onArticleClicked(article),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Container(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}