class LivestockSubcategory {
  final int livestockSubCatId;
  final int livestockCatId;
  final String livestockSubcategory;
  final String livestockSubcategoryCode;
  final DateTime dateCreated;
  final int? createdBy;

  LivestockSubcategory({
    required this.livestockSubCatId,
    required this.livestockCatId,
    required this.livestockSubcategory,
    required this.livestockSubcategoryCode,
    required this.dateCreated,
    this.createdBy,
  });

  factory LivestockSubcategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LivestockSubcategory(
        livestockSubCatId: map['livestock_sub_cat_id']?.toInt() ?? 0,
        livestockCatId: map['livestock_cat_id']?.toInt() ?? 0,
        livestockSubcategory: map['livestock_subcategory'] ?? '',
        livestockSubcategoryCode: map['livestock_subcategory_code'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by']),
      );
  static List<LivestockSubcategory> parseLivestockSubcategories(
      Map<String, dynamic> json) {
    final livestockSubcategoriesList =
        json['data']['getAllLivestockSubcategories'] as List<dynamic>;

    return livestockSubcategoriesList
        .map((subcategoryData) => LivestockSubcategory(
              livestockSubCatId: subcategoryData['livestockSubCatId'] ?? 0,
              livestockCatId: subcategoryData['livestockCatId'] ?? 0,
              livestockSubcategory:
                  subcategoryData['livestockSubcategory'] ?? '',
              livestockSubcategoryCode:
                  subcategoryData['livestockSubcategoryCode'] ?? '',
              createdBy: subcategoryData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(subcategoryData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
