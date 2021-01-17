import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:min2_sports_today/data/category_info.dart';
import 'package:min2_sports_today/data/search_type.dart';
import 'package:min2_sports_today/models/api/api_service.dart';
import 'package:min2_sports_today/models/model/news_model.dart';   /// [Need to define]




class NewsRepository {

  /// [外注: ViewModel -> Repository]
  final ApiService _apiService = ApiService.create();




  /// [外注: ViewModel -> Repository]
  /// [ ... 戻り値の型を設定 -> Repositoryから返してくる型がArticleのList]

  Future<List<Article>> getNewsRepository({@required SearchType searchType, String keyword, CategoryInfo category}) async {
    print("comm: getNewsRepository");

    List<Article> result = [];

    /// [Repositoryからapiにデータ取得: Future<Response> getHeadLineNewsApiService()]
    Response response;


    /// [データ取得/データの中身: ◯/◯, ◯/x, x/-]
    try {
      switch(searchType) {      
        case SearchType.HEADLINE:
            response = await _apiService.getHeadLineNewsApiService();
            break;
        case SearchType.KEYWORD:
            response = await _apiService.getKeywordNewsApiService(keyword: keyword);
            break;
      }
      if (response.isSuccessful){
        final responseBody = response.body;
        result = News.fromJson(responseBody).articles;
        print("comm: ◯/◯");
      } else {
        final responseStatusCode = response.statusCode;
        final responseError = response.error;
        print("comm: ◯/x");
        print("comm: responseStatusCode: $responseStatusCode,  responseError: $responseError");
      }
    } on Exception catch(err) {
        print("comm: x/-");
        print("comm: err: $err");
    } finally {
        print("comm: finally");
    }

    return result;
  }



  void dispose() {
    _apiService.dispose();
  }
}