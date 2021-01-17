import 'package:flutter/material.dart';
import 'package:min2_sports_today/views/conponents/search_bar.dart';



class NewsListPage extends StatelessWidget {

  /// [========= build() =========]
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SearchBar(
              /// [method -> get data -> SearchBar()CLASS -> pass with the data]
              onSearch: (keyword) => getKeywordnews(context, keyword),
            ),
            // CircularProgressIndicator(),
          ]
        ),

        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.refresh),
          tooltip: "refresh",
          onPressed: () => onReflesh(context),
        ),
      ),
    );
  }


  /// [========= method() =========]
  onReflesh(BuildContext context) {
    print("comm: onReflesh");

  }

  getKeywordnews(BuildContext context, keyword) {
    print("comm: getKeywordnews");

  }
}