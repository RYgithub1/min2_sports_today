import 'package:flutter/material.dart';



class HomeScreen extends StatefulWidget {
  // HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: (){print("comm: menu");}),
        title: Text("SPORTS TODAY"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.login), onPressed: (){print("comm: login");}),],
      ),
      body: Container(child: Text("test")),
      // bottomNavigationBar: BottomNavigationBar(),
      // floatingActionButton: FloatingActionButton(),
    );
  }
}