import 'package:min2_sports_today/models/model/news_model.dart';
import 'package:min2_sports_today/models/database/database.dart';



/// [ーーーーーーーー Moor独特な記法()()ゆえ、DB保存の際に、DB形式に変換する ーーーーーーーー]


/// [===== (1)Dartのモデルクラス -> DBのテーブルクラス =====]
/// [webから取得したデータはList -> Listに拡張]
extension ConvertToArticleMoor on List<Article> {

  List<ArticleRecord> toArticleRecords(List<Article> articles){
      var articleRecords = [].cast<ArticleRecord>();
      articles.forEach((article) {
        articleRecords.add(
            ArticleRecord(
                title:       article.title         ?? "",
                description: article.description   ?? "",
                url:         article.url           ?? "",
                urlToImage:  article.urlToImage    ?? "",
                publishDate: article.publishedDate ?? "",
                content:     article.content       ?? "",
            ),
        );
      });
      return articleRecords;
  }

}



/// [===== (2)DBのテーブルクラス -> Dartのモデルクラス =====]
extension ConvertToArticle on List<ArticleRecord> {

  List<Article> toArticles(List<ArticleRecord> articleRecords){
      var articles = [].cast<Article>();
      articleRecords.forEach((articleRecord) {
        articles.add(
            Article(
                title:         articleRecord.title       ?? "",
                description:   articleRecord.description ?? "",
                url:           articleRecord.url         ?? "",
                urlToImage:    articleRecord.urlToImage  ?? "",
                publishedDate: articleRecord.publishDate ?? "",
                content:       articleRecord.content     ?? "",
            ),
        );
      });
      return articles;
  }

}