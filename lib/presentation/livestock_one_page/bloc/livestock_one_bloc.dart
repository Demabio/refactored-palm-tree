import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/dbModels/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/agegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/beehivetype.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/feed.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_input.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockfeed.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/agegroupmodel.dart';
import '../../add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import '../models/livestock_item_model.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/livestock_one_model.dart';
part 'livestock_one_event.dart';
part 'livestock_one_state.dart';

/// A bloc that manages the state of a LivestockOne according to the event that is dispatched to it.
class LivestockOneBloc extends Bloc<LivestockOneEvent, LivestockOneState> {
  LivestockOneBloc(LivestockOneState initialState) : super(initialState) {
    on<LivestockOneInitialEvent>(_onInitialize);
    on<AddEditEvent>(_addEdit);
    on<DeleteEvent>(_delete);
  }

  _addEdit(
    AddEditEvent event,
    Emitter<LivestockOneState> emit,
  ) {
    if (event.value! == 1) {
      PrefUtils().setLivestockId(event.crop!);
      event.createSuccessful!.call();
    } else {
      PrefUtils().setLivestockId(0);
      event.createSuccessful!.call();
    }
  }

  List<AgeGroupModel> _ages(
      List<AgeGroupModel> agemodelss, List<FarmerLivestockAgeGroup> agess) {
    List<AgeGroupModel> agemodels = agemodelss;
    List<FarmerLivestockAgeGroup> ages = agess;

    for (var ent in ages) {
      int index =
          agemodels.indexWhere((obj) => obj.ageGroupId == ent.ageGroupId);

      agemodels[index].isSelected = true;
      agemodels[index].males = ent.noOfLivestockMale.toString();
      agemodels[index].females = ent.noOfLivestockFemale.toString();
    }

    return agemodels;
  }

  List<FeedsModel> _feeds(
      List<FeedsModel> feedmodelss, List<FarmerLivestockFeed> feedss) {
    List<FeedsModel> feedmodels = feedmodelss;
    List<FarmerLivestockFeed> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.feedTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<FeedsModel> _bees(
      List<FeedsModel> feedmodelss, List<FarmerLivestockBeehiveType> feedss) {
    List<FeedsModel> feedmodels = feedmodelss;
    List<FarmerLivestockBeehiveType> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.beehivesTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FeedsModel>> fetchBees() async {
    List<FeedsModel> list = [];
    LivestockBeehiveTypeDB livestockAgeGroupDB = LivestockBeehiveTypeDB();

    await livestockAgeGroupDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(FeedsModel(
          title: value[i].beehiveType,
          id: value[i].beehiveTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<FeedsModel>> fetchFeeds() async {
    List<FeedsModel> list = [];
    LivestockFeedTypeDB livestockFeedTypeDB = LivestockFeedTypeDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockFeedTypeDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(FeedsModel(
          title: value[i].feedType,
          id: value[i].feedTypeId,
        ));
      }
    });
    return list;
  }

  Future<List<AgeGroupModel>> fetchAgeGroups() async {
    List<AgeGroupModel> list = [];
    LivestockAgeGroupDB livestockAgeGroupDB = LivestockAgeGroupDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(AgeGroupModel(
          title: value[i].ageGroup,
          ageGroupId: value[i].ageGroupId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
        ));
      }
    });
    return list;
  }

  Future<List<FarmerLivestockBeehiveType>?> getBees(int id) async {
    FarmerLivestockBeehiveTypeDB farmerLivestockFeedsDB =
        FarmerLivestockBeehiveTypeDB();
    return await farmerLivestockFeedsDB.fetchAllByLivestock(id);
  }

  Future<FarmerLivestock?> getLiv() async {
    int livid = PrefUtils().getLivestockId();
    FarmerLivestockDB farmDB = FarmerLivestockDB();
    return await farmDB.fetchById(livid);
  }

  Future<List<FarmerLivestockAgeGroup>?> getAges(int livid) async {
    FarmerLivestockAgeGroupsDB farmerLivestockAgeGroupsDB =
        FarmerLivestockAgeGroupsDB();
    return await farmerLivestockAgeGroupsDB.fetchByLive(livid);
  }

  Future<List<FarmerLivestockFeed>?> getFeeds(int livid) async {
    FarmerLivestockFeedsDB farmerLivestockFeedsDB = FarmerLivestockFeedsDB();
    return await farmerLivestockFeedsDB.fetchAllByLivestock(livid);
  }

  Future<LSProgress?> getProgress() async {
    int farmerid = PrefUtils().getLivestockId();
    LSProgressDB lsProgressDB = LSProgressDB();
    return await lsProgressDB.fetchByLivestock(farmerid);
  }

  Future<List<FarmerLivestock>?> getLivestocks() async {
    int id = PrefUtils().getFarmId();
    FarmerLivestockDB farmDB = FarmerLivestockDB();
    return await farmDB.fetchByFarm(id);
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  Future<List<FarmerLivestock>?> getLuvestocks() async {
    int id = PrefUtils().getFarmId();
    FarmerLivestockDB farmerFishProductionLevelsDB = FarmerLivestockDB();
    return await farmerFishProductionLevelsDB.fetchByFarm(id);
  }

  Future<PFProgress?> getLSIProgress() async {
    int id = PrefUtils().getFarmId();
    LSIProgressDB pfProgressDB = LSIProgressDB();
    return await pfProgressDB.fetchByFarmId(id);
  }

  _onInitialize(
    LivestockOneInitialEvent event,
    Emitter<LivestockOneState> emit,
  ) async {
    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          cropProd: false,
          livestockProd: false,
          fishFarming: false,
        );

    List<FarmerLivestock>? livestock = await getLuvestocks();

    int? livestockid =
        livestock != null ? livestock.last.farmerLivestockId : null;
    List<FarmerLivestock> lives = await getLivestocks() ?? [];

    LSProgress lsProgress = await getLSProgress(livestockid) ??
        LSProgress(
          livestockId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    PFProgress lsiProgress = await getLSIProgress() ??
        PFProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<LSdetailsItemModel> farmmodels = [];

    LivestockFarmingSystemDB livestockFarmingSystemDB =
        LivestockFarmingSystemDB();

    LivestockDB livestockDB = LivestockDB();

    List<AgeGroupModel>? ageGroupList = [];
    List<FeedsModel>? feedslist = [];
    List<FeedsModel>? beeslist = [];
    ageGroupList = await fetchAgeGroups();
    feedslist = await fetchFeeds();
    beeslist = await fetchBees();

    for (var live in lives) {
      Livestock? livestock =
          await livestockDB.fetchByLivestockId(live.livestockId!);
      LivestockFarmingSystem livestockFarmingSystem =
          await livestockFarmingSystemDB
              .fetchByLivestockFarmingSystemId(live.livestockFarmsystemCatId!);
      List<FarmerLivestockAgeGroup>? ages =
          await getAges(live.farmerLivestockId);

      List<FarmerLivestockFeed>? feeds = await getFeeds(live.farmerLivestockId);
      ageGroupList = await fetchAgeGroups();
      feedslist = await fetchFeeds();
      beeslist = await fetchBees();

      List<FarmerLivestockBeehiveType>? bees =
          await getBees(live.farmerLivestockId);

      bool beekeerper = false;
      if (bees != null) {
        beeslist = _bees(beeslist, bees);
      }
      beekeerper =
          livestock?.livestock == "Bee" || livestock?.livestock == "Bees";

      feedslist = feeds != null ? _feeds(feedslist, feeds) : feedslist;
      ageGroupList = ages != null ? _ages(ageGroupList, ages) : ageGroupList;
      farmmodels.add(LSdetailsItemModel(
        //   crop: crop,
        id: live.farmerLivestockId,
        name: livestock?.livestock,
        ages: ageGroupList,
        feeds: feedslist,
        prod: livestockFarmingSystem.livestockFarmsystem,
        beekeepr: beekeerper,
        bees: beeslist,
        x: live.noOfBeehives.toString(),
        livestock: live.other,
      ));
    }
    emit(state.copyWith(
        lslist: farmmodels,
        next: farm.fishFarming,
        prev: farm.cropProd,
        done: lsProgress.pageOne == 1 && lsiProgress.pageOne == 1,
        livestockOneModelObj:
            state.livestockOneModelObj?.copyWith(lsmodels: farmmodels)));
  }

  Future<LSProgress?> getLSProgress(int? id) async {
    //int id = PrefUtils().getFarmId();
    LSProgressDB pfProgressDB = LSProgressDB();
    return id != null ? await pfProgressDB.fetchByLivestock(id) : null;
  }

  _delete(
    DeleteEvent event,
    Emitter<LivestockOneState> emit,
  ) async {
    if (PrefUtils().getYesNo()) {
      FarmerLivestockFeedsDB farmerLivestockFeedsDB = FarmerLivestockFeedsDB();
      FarmerLivestockDB farmDB = FarmerLivestockDB();
      FarmerLivestockAgeGroupsDB farmerLivestockAgeGroupsDB =
          FarmerLivestockAgeGroupsDB();
      FarmerLivestockBeehiveTypeDB farmerLivestockBeehiveTypeDB =
          FarmerLivestockBeehiveTypeDB();
      int deletefeeds = await farmerLivestockFeedsDB.delete(event.value!);
      int deleteagegroup =
          await farmerLivestockAgeGroupsDB.delete(event.value!);
      int deletebee = await farmerLivestockBeehiveTypeDB.delete(event.value!);

      int deletelive = await farmDB.delete(event.value!);
      LSProgressDB lsProgressDB = LSProgressDB();

      if (deleteagegroup > 0 ||
          deletelive > 0 ||
          deletefeeds > 0 ||
          deletebee > 0) {
        await lsProgressDB.delete(event.value!);

        List<FarmerLivestock> lives = await getLivestocks() ?? [];

        List<LSdetailsItemModel> farmmodels = [];

        LivestockFarmingSystemDB livestockFarmingSystemDB =
            LivestockFarmingSystemDB();

        LivestockDB livestockDB = LivestockDB();

        List<AgeGroupModel>? ageGroupList = [];
        List<FeedsModel>? feedslist = [];
        List<FeedsModel>? beeslist = [];
        ageGroupList = await fetchAgeGroups();
        feedslist = await fetchFeeds();
        beeslist = await fetchBees();

        for (var live in lives) {
          Livestock? livestock =
              await livestockDB.fetchByLivestockId(live.livestockId!);
          LivestockFarmingSystem livestockFarmingSystem =
              await livestockFarmingSystemDB.fetchByLivestockFarmingSystemId(
                  live.livestockFarmsystemCatId!);
          List<FarmerLivestockAgeGroup>? ages =
              await getAges(live.farmerLivestockId);

          List<FarmerLivestockFeed>? feeds =
              await getFeeds(live.farmerLivestockId);
          ageGroupList = await fetchAgeGroups();
          feedslist = await fetchFeeds();
          beeslist = await fetchBees();

          List<FarmerLivestockBeehiveType>? bees =
              await getBees(live.farmerLivestockId);

          bool beekeerper = false;
          if (bees != null) {
            beeslist = _bees(beeslist, bees);
          }
          beekeerper =
              livestock?.livestock == "Bee" || livestock?.livestock == "Bees";

          feedslist = _feeds(feedslist, feeds!);
          ageGroupList = _ages(ageGroupList, ages!);
          farmmodels.add(LSdetailsItemModel(
            //   crop: crop,
            id: live.farmerLivestockId,
            name: livestock?.livestock,
            ages: ageGroupList,
            feeds: feedslist,
            prod: livestockFarmingSystem.livestockFarmsystem,
            beekeepr: beekeerper,
            bees: beeslist,
            x: live.noOfBeehives.toString(),
          ));
        }
        emit(state.copyWith(
            lslist: farmmodels,
            livestockOneModelObj:
                state.livestockOneModelObj?.copyWith(lsmodels: farmmodels)));
      }
    }
  }
}
