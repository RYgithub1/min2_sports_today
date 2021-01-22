import 'package:flutter/material.dart';
import 'package:min2_sports_today/models/database/database.dart';
import 'package:min2_sports_today/models/repository/news_repository.dart';
import 'package:provider/provider.dart';
import 'package:min2_sports_today/models/api/api_service.dart';  /// [tegaki]
import 'package:min2_sports_today/models/database/dao.dart';
import 'package:provider/single_child_widget.dart';   /// [tegaki]




List<SingleChildWidget> globalProviders = [
    ...independentModels,
    ...dependentModels,
    ...viewModels,
];



/// [依存しないもの、よりpromitiveなLayer、apiやdb]
List<SingleChildWidget> independentModels = [
    Provider<ApiService>(
      create: (_) => ApiService.create(),
      dispose: (_, apiService) => apiService.dispose(),
    ),
    Provider<MyDatabase>(
      create: (_) => MyDatabase(),
      dispose: (_, db) => db.close(),
    ),
];

/// [依存するもの、apiやdbを使いたい側のクラス]
List<SingleChildWidget> dependentModels = [
    ProxyProvider<MyDatabase, NewsDao>(   /// [for Dao]
      update: (_, db, dao) => NewsDao(db),
    ),
    ProxyProvider<NewsDao, ApiService, NewsRepository>(
      update: (_, dao, apiService, repository) => NewsRepository(dao, apiService),
    ),
];

/// [--]
List<SingleChildWidget> viewModels = [

];
