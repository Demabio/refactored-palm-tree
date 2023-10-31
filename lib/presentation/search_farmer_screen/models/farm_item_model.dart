/// This class is used in the [cropdetails_item_widget] screen.
class FdetailsItemModel {
  FdetailsItemModel({
    this.prod,
    this.unitOfArea,
    this.lr,
    this.id,
    this.lease,
    this.idle,
    this.livestock,
    this.crop,
    this.name,
    this.landsize,
    this.x,
    this.y,
    this.owner,
    this.completed = false,
  });

  String? prod;

  String? unitOfArea;

  String? lr;

  int? id;

  String? lease;

  String? idle;
  String? livestock;
  String? crop;
  String? name;
  String? landsize;
  String? owner;
  String? x;

  String? y;
  bool completed;
}
