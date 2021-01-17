import 'package:flutter/material.dart';


class NewsBlogPage extends StatelessWidget {
  // const NewsListPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(child: Center(child: Text("blog"))),
      ),
    );
  }
}