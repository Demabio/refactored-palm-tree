import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';

import '../../add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';

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
    this.bees = const [],
    this.beekeepr = false,
  });

  String? prod;

  String? unitOfArea;

  String? lr;

  int? id;

  String? lease;
  FarmerLivestock? farm;
  List<AgeGroupModel> ages;
  List<FeedsModel> feeds;
  List<FeedsModel> bees;
  bool beekeepr;

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
