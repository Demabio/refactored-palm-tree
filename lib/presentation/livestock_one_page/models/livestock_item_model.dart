import 'package:kiamis_app/data/models/dbModels/livestock/agegroup.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/agesmodel.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/feedsmodel.dart';

/// This class is used in the [cropdetails_item_widget] screen.
class LSdetailsItemModel {
  LSdetailsItemModel({
    this.prod,
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
    this.feeds = const [],
    this.ages = const [],
  }) {}

  String? prod;

  String? unitOfArea;

  String? lr;

  int? id;

  String? lease;
  FarmerLivestock? farm;
  List<AgesModel> ages;
  List<FeedsModel> feeds;

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
