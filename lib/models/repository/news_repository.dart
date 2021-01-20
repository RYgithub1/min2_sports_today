import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:min2_sports_today/data/category_info.dart';
import 'package:min2_sports_today/data/search_type.dart';
import 'package:min2_sports_today/main.dart';
import 'package:min2_sports_today/models/api/api_service.dart';
import 'package:min2_sports_today/models/model/news_model.dart';   /// [Need to define]
import 'package:min2_sports_today/util/extensions.dart';



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

        result = await insertAndReadFromDB(responseBody);


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


    // print("comm: result: $result");
    /// [Instance of 'Article' = インスタンスとして取得出来ているが、粒度が合っていない（配列や階層）]
    // for (var i = 0; i < result.length; i++) {
    //   print("comm: result: $result[i]");
    // }
    return result;
  }



  void dispose() {
    _apiService.dispose();
  }




  Future<List<Article>> insertAndReadFromDB(responseBody) async {
    /// [database使うのでクラスからインスタンス作成して呼び込む]
    final dao = myDatabase.newsDao;   /// [トップレベルプロパティで宣言したのをimport必要]
    /// final articles = News.fromJson(responseBody);   /// [返ってきたデータをXXX.fromJson()]
    final articles = News.fromJson(responseBody).articles;   /// [返ってきたデータをXXX.fromJson() -> articlesのみ欲しい]


    /// [(変換 ): Webから取得した記事リスト(Dartモデルクラス: Article)を、DBのテーブルクラスに変換してから、DB登録]
    final articleRecords = await dao.insertAndReadNeawsFromDB(
      articles.toArticleRecords(articles),
    );
    /// [(逆変換): DBから取得したデータを、モデルクラスに再変換して返す = dartの拡張メソッド]
    return articleRecords.toArticles(articleRecords);
  }

}