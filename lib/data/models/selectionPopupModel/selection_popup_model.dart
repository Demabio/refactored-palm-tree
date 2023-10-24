///SelectionPopupModel is common model
///used for setting data into dropdowns
class SelectionPopupModel {
  int? id;
  String title;
  dynamic value;
  bool isSelected;
  int? code;

  SelectionPopupModel({
    this.id,
    required this.title,
    this.value,
    this.isSelected = false,
    this.code,
  });
}
