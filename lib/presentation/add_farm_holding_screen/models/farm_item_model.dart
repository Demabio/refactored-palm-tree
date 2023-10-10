import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';

/// This class is used in the [cropdetails_item_widget] screen.
class FarmdetailsItemModel {
  FarmdetailsItemModel({
    this.totalAcreage,
    this.unitOfArea,
    this.lr,
    this.id,
    this.farm,
    this.lease,
    this.idle,
    this.livestock,
    this.crop,
    this.name,
    this.landsize,
    this.otherfarm,
    this.x,
    this.y,
    this.owner,
    this.enterprises = const [],
  }) {}

  String? totalAcreage;

  String? unitOfArea;

  String? lr;

  int? id;

  String? lease;
  FarmerFarm? farm;
  List<EnterpriseModel> enterprises;

  String? idle;
  String? livestock;
  String? crop;
  String? name;
  String? landsize;
  String? otherfarm;
  String? owner;
  String? x;

  String? y;
}
