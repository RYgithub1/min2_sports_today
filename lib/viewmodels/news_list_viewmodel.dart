import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:min2_sports_today/data/category_info.dart';
import 'package:min2_sports_today/data/search_type.dart';
import 'package:min2_sports_today/models/repository/news_repository.dart';
import 'package:min2_sports_today/models/model/news_model.dart';   /// [Need to define]




class NewsListViewModel extends ChangeNotifier {

  /// [外注: ViewModel -> Repository]
  final NewsRepository _newsRepository = NewsRepository();



  /// [Depend on SearchType]
  SearchType _searchType = SearchType.HEADLINE;
  SearchType get searchType => _searchType;

  String _keyword = "";
  String get keyword => _keyword;

  CategoryInfo _category = categoryInfos[5];
  CategoryInfo get category => _category;

  bool _isLoading = false;
  bool get isLoading => _isLoading;



  List<Article> _newsModelNewsArticles = [];
  /// [getterしないと、呼び出し元pageで、xxx.ooo推測されない]
  List<Article> get newsModelNewsArticles => _newsModelNewsArticles;






  /// [外注: View -> ViewModel]
  /// Future<void> getNews() async {   [引数付きに修正]
  Future<void> getNewsViewModel({@required SearchType searchTypeJyan, String keywordJyan, CategoryInfo categoryJyan}) async {
    print("comm: getNewsViewModel");
    print("comm: getNewsViewModel_v1: $searchTypeJyan, $keywordJyan ");

    /// [定義格納しておけばrefreshの際に使える -> viewからpassしたarguを変数定義]
    _searchType = searchTypeJyan;
    _keyword = keywordJyan;
    _category = categoryJyan;

    _isLoading = true;
    notifyListeners();

    /// [外注: ViewModel -> Repository]
    // await _newsRepository.getNewsRepository(searchType: _searchType, keyword: _keyword, category: _category);
    /// [List<Article>に代入することで、NotifyListeners()で自動通知]
    _newsModelNewsArticles = await _newsRepository.getNewsRepository(searchType: _searchType, keyword: _keyword, category: _category);
    // print("comm: getNewsViewModel_v2: $_searchType, $_keyword, ${_category.categoryId}, ${_newsModelNewsArticles[0]}");
    /// [Instance of 'Article' = インスタンスとして取得出来ているが、粒度が合っていない（配列や階層）]
    // print("comm: getNewsViewModel_v2: $_searchType, $_keyword, ${_category.categoryId}(=sports)");
    print("comm: getNewsViewModel_v3: ${_newsModelNewsArticles[0].title}, ${_newsModelNewsArticles[0].description}, ${_newsModelNewsArticles[0].url}");

    _isLoading = false;
    notifyListeners();
  }



  @override
  void dispose(){
    _newsRepository.dispose();
    super.dispose();
    print("comm: NewsListViewModel: dispose");
  }
}
