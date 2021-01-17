import 'package:flutter/material.dart';
import 'package:min2_sports_today/data/category_info.dart';
import 'package:min2_sports_today/data/search_type.dart';




class NewsRepository {


  /// [外注: ViewModel -> Repository]
  Future<void> getNewsRepository({@required SearchType searchType, String keyword, CategoryInfo category}) async {

    print("comm: getNewsRepository");

  }

}