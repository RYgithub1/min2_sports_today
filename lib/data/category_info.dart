class CategoryInfo {
  final int categoryId;
  final String categoryNameEn;
  final String categoryNameJp;

  CategoryInfo({this.categoryId, this.categoryNameEn, this.categoryNameJp});
}



/// [<TA> = <CategoryInfo>]
/// [Default category from api]
final List<CategoryInfo> categoryInfos = [

  CategoryInfo(categoryId: 0, categoryNameEn: "general", categoryNameJp: "総合"),
  CategoryInfo(categoryId: 1, categoryNameEn: "business", categoryNameJp: "ビジネス"),
  CategoryInfo(categoryId: 2, categoryNameEn: "technology", categoryNameJp: "テクノロジー"),
  CategoryInfo(categoryId: 3, categoryNameEn: "science", categoryNameJp: "科学"),
  CategoryInfo(categoryId: 4, categoryNameEn: "health", categoryNameJp: "健康"),
  CategoryInfo(categoryId: 5, categoryNameEn: "sports", categoryNameJp: "スポーツ"),
  CategoryInfo(categoryId: 6, categoryNameEn: "entertainment", categoryNameJp: "エンタメ"),

];
