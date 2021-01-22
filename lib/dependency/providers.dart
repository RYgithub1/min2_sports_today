import 'package:flutter/material.dart';
import 'package:min2_sports_today/viewmodels/news_list_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';   /// [tegaki]
import 'package:min2_sports_today/models/database/dao.dart';
import 'package:min2_sports_today/models/database/database.dart';
import 'package:min2_sports_today/models/repository/news_repository.dart';
import 'package:min2_sports_today/models/api/api_service.dart';  /// [tegaki]




List<SingleChildWidget> globalProviders = [
    ...independentModels,
    ...dependentModels,
    ...viewModels,
];



/// [依存しないもの、よりprimitiveなLayer、apiやdb。通常provider通り記載]
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

/// [依存するもの、apiやdbを使いたい側のクラス。ProxyProviderでDI]
List<SingleChildWidget> dependentModels = [
    ProxyProvider<MyDatabase, NewsDao>(   /// [for Dao]
      update: (_, db, dao) => NewsDao(db),
    ),
    /// ProxyProvider<NewsDao, ApiService, NewsRepository>(   /// [Need 2]
    ProxyProvider2<NewsDao, ApiService, NewsRepository>(
      // update: (_, dao, apiService, repository) => NewsRepository(dao, apiService),
      /// [Too many positional arguments: 0 expected, but 2 found above.]
      update: (_, dao, apiService, repository) => NewsRepository(dao: dao, apiService: apiService),
    ),
];

/// [いつものViewModelを最後に記載]
List<SingleChildWidget> viewModels = [
    ChangeNotifierProvider<NewsListViewModel>(
      create: (context) => NewsListViewModel(
        //  Provider.of<NewsListViewModel>(context, listen: false),
        /// [NewsListViewModel({})でデータをpassしているのでnamed_parameterへconvert]
        newsRepository: Provider.of<NewsListViewModel>(context, listen: false),
      ),
    ),
];
