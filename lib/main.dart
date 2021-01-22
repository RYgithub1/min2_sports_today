import 'package:flutter/material.dart';
import 'package:min2_sports_today/dependency/providers.dart';
import 'package:min2_sports_today/models/database/database.dart';
import 'package:min2_sports_today/style/style.dart';
import 'package:min2_sports_today/viewmodels/news_list_viewmodel.dart';
import 'package:min2_sports_today/views/screens/home_screen.dart';
import 'package:provider/provider.dart';



// MyDatabase myDatabase;
/// [coz DI]



void main() {
  // myDatabase = MyDatabase();   /// [インスタンス取得]
/// [coz DI]

  runApp(
    MultiProvider(
      // providers: [
      //   ChangeNotifierProvider(
      //     create: (context) => NewsListViewModel(),
      //   ),
      // ],
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}



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
