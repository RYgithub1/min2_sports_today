import 'package:flutter/material.dart';
import 'package:min2_sports_today/data/category_info.dart';
import 'package:min2_sports_today/data/search_type.dart';
import 'package:min2_sports_today/viewmodels/news_list_viewmodel.dart';
import 'package:min2_sports_today/views/conponents/article_tile.dart';
import 'package:min2_sports_today/views/conponents/search_bar.dart';
import 'package:min2_sports_today/views/screens/webview_screen.dart';
import 'package:provider/provider.dart';
import 'package:min2_sports_today/models/model/news_model.dart';




class NewsListPage extends StatelessWidget {

  /// [========= build() ===========================]
  @override
  Widget build(BuildContext context) {

    final _newsListViewModel = Provider.of<NewsListViewModel>(context, listen: false);
    /// [画面開いた瞬間での条件文: ロードしてない&&記事がない]
    if(!_newsListViewModel.isLoading && _newsListViewModel.newsModelNewsArticles.isEmpty) {
      Future( () => _newsListViewModel.getNewsViewModel(searchTypeJyan: SearchType.HEADLINE) );
    }


    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SearchBar(
              /// [method -> get data -> SearchBar()CLASS -> pass with the data]
              onSearch: (keywordYade) => getKeywordNews(context, keywordYade),
            ),

            // Expanded(child: Center(child: Text("news here"))),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Consumer<NewsListViewModel>(
                  builder: (context, newsListViewModelDade, child) {
                    return newsListViewModelDade.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(
                              newsListViewModelDade.newsModelNewsArticles.length,
                              (position) {
                                  return ArticleTile(
                                        article: newsListViewModelDade.newsModelNewsArticles[position],
                                        onArticleClicked: (articleGo) => _openArticleWebPage(articleGo, context),
                                  );
                              },
                          ),
                      );
                  },
                ),
              ),
            ),
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



  void _openArticleWebPage(Article articleGo, BuildContext context) {
    print("comm: _openArticleWebPage ${articleGo.url}");
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WebviewScreen(article: articleGo),
        ),
    );
  }

}