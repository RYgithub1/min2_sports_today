import 'package:moor/moor.dart';
import 'dart:io';
import 'package:moor/ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as pathYade;
import 'dao.dart';



part 'database.g.dart';



class ArticleRecords extends Table {
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get url => text()();
  TextColumn get urlToImage => text()();
  TextColumn get publishDate => text()();
  TextColumn get content => text()();
}



// @UseMoor(tables: [ArticleRecords])
@UseMoor(tables: [ArticleRecords], daos: [NewsDao])
class MyDatabase extends _$MyDatabase{
  MyDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
}



LazyDatabase _openConnection() {
  return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(pathYade.join(dbFolder.path, 'news.db'));
      return VmDatabase(file);
  });
}