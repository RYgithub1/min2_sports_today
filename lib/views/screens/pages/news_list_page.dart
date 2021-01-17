import 'package:flutter/material.dart';
import 'package:min2_sports_today/data/category_info.dart';
import 'package:min2_sports_today/data/search_type.dart';
import 'package:min2_sports_today/viewmodels/news_list_viewmodel.dart';
import 'package:min2_sports_today/views/conponents/search_bar.dart';
import 'package:provider/provider.dart';




class NewsListPage extends StatelessWidget {

  /// [========= build() ===========================]
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SearchBar(
              /// [method -> get data -> SearchBar()CLASS -> pass with the data]
              onSearch: (keywordYade) => getKeywordNews(context, keywordYade),
            ),
            // CircularProgressIndicator(),
          ]
        ),

        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.refresh),
          tooltip: "refresh",
          onPressed: () => refleshEachTypeNews(context),
        ),
      ),
    );
  }



  /// [========= method() ===========================]
  Future<void> refleshEachTypeNews(BuildContext context) async {
    print("comm: refleshEachTypeNews");
    /// [外注: View -> ViewModel]
    final newsListViewModel = Provider.of<NewsListViewModel>(context, listen: false);
    /// [ ... 押下時点での、NewsListViewModel/searchTypeをベースにリフレッシュ]
    await newsListViewModel.getNewsViewModel(
        searchTypeJyan: newsListViewModel.searchType,
        keywordJyan: newsListViewModel.keyword,
        categoryJyan: newsListViewModel.category,
    );
  }


  Future<void> getKeywordNews(BuildContext context, keywordYade) async {
    print("comm: getKeywordnews");
    /// [外注: View -> ViewModel]
    final newsListViewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await newsListViewModel.getNewsViewModel(
        searchTypeJyan: SearchType.KEYWORD,
        keywordJyan: keywordYade,
        categoryJyan: categoryInfos[5],
    );
  }


  Future<void> getHeadLineNews(BuildContext context, keyword) async {
    print("comm: getKeywordnews");
    /// [外注: View -> ViewModel]
    final newsListViewModel = Provider.of<NewsListViewModel>(context, listen: false);
    await newsListViewModel.getNewsViewModel(
        searchTypeJyan: SearchType.HEADLINE,
        categoryJyan: categoryInfos[5],
    );
  }

}