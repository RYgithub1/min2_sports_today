import 'package:min2_sports_today/models/database/database.dart';
import 'package:moor/moor.dart';




part 'dao.g.dart';




/// [dao: （query多い場合エラー) queryメソッドとして外出し]
@UseDao(tables: [ArticleRecords])
class NewsDao extends DatabaseAccessor<MyDatabase> with _$NewsDaoMixin {

  NewsDao(MyDatabase db) : super(db);



  /// [--- データの整合性: data格納時に、dbを一旦clearにしてから、データ放り込み、読み込む ---]
  /// [(1)delete: DBの既存データを、clear消し込む]
  Future clearDB() => delete(articleRecords).go();

  /// [(2)insert: DBへ新規データを、insert入れ込む]
  Future insertDB(List<ArticleRecord> articles) async {
    await batch((batch) {
      batch.insertAll(articleRecords, articles);
    });
  }

  /// [(3)read: DBの保持データを、読み込む]
  Future<List<ArticleRecord>> get articlesFromDB => select(articleRecords).get();


  /// [=== ((1,2,3)一つの取引として実行===) Method tod do delete, insert and read ===]
  Future<List<ArticleRecord>> insertAndReadNeawsFromDB(List<ArticleRecord> articles)
      => transaction(() async {
          await clearDB();
          await insertDB(articles);
          return await articlesFromDB;
      });
}
