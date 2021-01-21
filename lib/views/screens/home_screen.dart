import 'package:flutter/material.dart';
import 'package:min2_sports_today/views/screens/pages/news_blog_page.dart';
import 'package:min2_sports_today/views/screens/pages/news_favorite_page.dart';
import 'package:min2_sports_today/views/screens/pages/news_list_page.dart';



class HomeScreen extends StatefulWidget {
  // HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  final _bottomNavigationPages = [
    NewsListPage(),
    NewsFavoritePage(),
    NewsBlogPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          leading: new IconButton(icon: new Icon(Icons.menu), onPressed: (){print("comm401: menu");}),
          title: new Text("SPORTS TODAY"),
          centerTitle: true,
          actions: [new IconButton(icon: new Icon(Icons.login), onPressed: (){print("comm402: login");})],
        ),

        body: _bottomNavigationPages[_currentIndex],

        bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
            const BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
          ],
          fixedColor: Colors.greenAccent,
          /// [onTap: typedef ValueChanged<T> = void Function(T value);]
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }
        ),
      ),
    );
  }
}