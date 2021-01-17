import 'package:flutter/material.dart';
import 'package:min2_sports_today/screens/home_screen.dart';
import 'package:min2_sports_today/style/style.dart';



void main() => runApp(MyApp());



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sports today',
      // theme: ThemeData.dark(),
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: BoldFont,
      ),
      home: HomeScreen(),
    );
  }
}
