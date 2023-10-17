import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';

/// This class is used in the [cropdetails_item_widget] screen.
class CropdetailsItemModel {
  CropdetailsItemModel({
    this.totalAcreage,
    this.unitOfArea,
    this.purpose,
    this.id,
    this.crop,
    this.water,
    this.fertiliser,
    this.pesticide,
    this.system,
    this.name,
    this.seeds,
    this.a = const [],
    this.p = const [],
    this.s = const [],
  }) {
    totalAcreage = totalAcreage ?? "Cabbages";
    unitOfArea = unitOfArea ?? "1";
    purpose = purpose ?? "Subsistence";
    id = id ?? 0;
  }

  String? totalAcreage;

  String? unitOfArea;

  String? purpose;

  int? id;

  String? water;
  FarmerCrop? crop;
  List<CheckBoxList> p;
  List<CheckBoxList> a;
  List<CheckBoxList> s;
  String? fertiliser;
  String? pesticide;
  String? system;
  String? name;
  String? seeds;
}
