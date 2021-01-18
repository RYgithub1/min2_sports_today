import 'package:flutter/material.dart';
import 'package:min2_sports_today/models/model/news_model.dart';
import 'package:webview_flutter/webview_flutter.dart';



class WebviewScreen extends StatelessWidget {

  final Article article;
  WebviewScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(article.title), centerTitle: true),

        body: WebView(   /// [WebView()]
          initialUrl: article.url,
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}