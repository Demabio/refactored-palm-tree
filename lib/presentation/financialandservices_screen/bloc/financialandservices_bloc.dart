import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionaccess.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionmode.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionmodes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/agriinfosource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/creditservice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionaccess.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionmode.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/incomesource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/financialandservices_screen/models/financialandservices_model.dart';
part 'financialandservices_event.dart';
part 'financialandservices_state.dart';

/// A bloc that manages the state of a Financialandservices according to the event that is dispatched to it.
class FinancialandservicesBloc
    extends Bloc<FinancialandservicesEvent, FinancialandservicesState> {
  FinancialandservicesBloc(FinancialandservicesState initialState)
      : super(initialState) {
    on<FinancialandservicesInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FinancialandservicesInitialEvent event,
    Emitter<FinancialandservicesState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    Farmer farmer = await getFarmer() ??
        Farmer(
          farmerId: 0,
          farmerName: "farmerName",
          labourSourceId: 0,
          cooperativeGroup: false,
          cropsInsurance: false,
          fishInsurance: false,
          assetsInsurance: false,
          livestockInsurance: false,
          farmRecords: false,
          farmingIncomePercent: 0,
        );

    FarmerFarm farm = await getFarm() ??
        FarmerFarm(
          farmerId: 0,
          farmerFarmId: 0,
          labourSourceId: 0,
          cropsInsurance: false,
          fishInsurance: false,
          assetsInsurance: false,
          livestockInsurance: false,
          farmRecords: false,
        );
    List<CheckBoxList>? coopmodels = await fetchCoops();
    List<CheckBoxList>? incomemodels = await fetchIncomes();
    List<CheckBoxList>? creditmodels = await fetchFinancialServ();
    List<CheckBoxList>? infomodels = await fetchInfo();
    List<CheckBoxList>? accessmodels = await fetchEAccess();
    List<CheckBoxList>? modemodels = await fetchEService();
    List<FarmerCooperativeGroup>? groups = await getCoops();
    if (groups != null) {
      coopmodels = _coops(coopmodels, groups);
    }
    List<FarmerIncomeSource>? incomes = await getIncomes();
    if (incomes != null) {
      incomemodels = _incomes(incomemodels, incomes);
    }
    List<FarmerCreditService>? categs = await getCredits();
    if (categs != null) {
      creditmodels = _credits(creditmodels, categs);
    }
    List<FarmerAgriInfoSource>? info = await getInfo();
    if (info != null) {
      infomodels = _infos(infomodels, info);
    }

    if (pfProgress.pageTwo == 1) {
      List<FarmerExtensionAccess>? access = await getEAccess();
      accessmodels =
          access != null ? _access(accessmodels, access) : accessmodels;
      List<FarmerExtensionMode>? mode = await getModes();
      if (mode != null) {
        modemodels = _modes(modemodels, mode);
      }
    }
    emit(state.copyWith(
      done: pfProgress.pageOne == 1 || pfProgress.pageTwo == 1,
      p: infomodels,
      e: accessmodels,
      m: modemodels,
      i: incomemodels,
      c: coopmodels,
      s: creditmodels,
      farm: farmer,
      f: farm,
    ));
  }

  Future<List<CheckBoxList>> fetchIncomes() async {
    List<CheckBoxList> list = [];
    IncomeSourceDB farmStructureDB = IncomeSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].incomeSource,
          id: value[i].incomeSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchFinancialServ() async {
    List<CheckBoxList> list = [];
    CreditSourceDB farmStructureDB = CreditSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].creditSource,
          id: value[i].creditSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchCoops() async {
    List<CheckBoxList> list = [];

    List<SelectionPopupModel> dpds = [
      SelectionPopupModel(title: "Full Member", id: 1),
      SelectionPopupModel(title: "Out Grower Member", id: 0),
    ];

    CooperativeGroupDB livestockAgeGroupDB = CooperativeGroupDB();
    await livestockAgeGroupDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].group,
          id: value[i].cooperativeGroupId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
          model: dpds,
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _credits(
      List<CheckBoxList> feedmodelss, List<FarmerCreditService> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerCreditService> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.creditSourceId);

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.othersName ?? "Not Applied";
    }

    return feedmodels;
  }

  List<CheckBoxList> _coops(
      List<CheckBoxList> feedmodelss, List<FarmerCooperativeGroup> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerCooperativeGroup> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.cooperateiveGroupId);

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.cooperateiveGroupName ?? "Not Applied";
    }

    return feedmodels;
  }

  List<CheckBoxList> _incomes(
      List<CheckBoxList> feedmodelss, List<FarmerIncomeSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIncomeSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.incomeSourceId);

      feedmodels[index].isSelected = true;
      feedmodels[index].var2 = "${ent.priorityLevel ?? 0}";
      feedmodels[index].var1 = ent.other ?? "Not Applied";
    }

    return feedmodels;
  }

  Future<List<FarmerCooperativeGroup>?> getCoops() async {
    int id = PrefUtils().getFarmerId();
    FarmerCooperativeGroupDB farmerLivestockAgeGroupsDB =
        FarmerCooperativeGroupDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<List<FarmerIncomeSource>?> getIncomes() async {
    int id = PrefUtils().getFarmerId();
    FarmerIncomeSourceDB farmerLivestockAgeGroupsDB = FarmerIncomeSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<Farmer?> getFarmer() async {
    int farmerid = PrefUtils().getFarmerId();
    FarmerDB farmerFishProductionLevelsDB = FarmerDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerId(farmerid);
  }

  Future<FarmerFarm?> getFarm() async {
    int id = PrefUtils().getFarmId();
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return await farmerFishProductionLevelsDB.fetchByFarmerFarmId(id);
  }

  Future<FSProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  Future<List<FarmerCreditService>?> getCredits() async {
    int id = PrefUtils().getFarmerId();
    FarmerCreditServiceDB farmerLivestockAgeGroupsDB = FarmerCreditServiceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<List<FarmerAgriInfoSource>?> getInfo() async {
    int id = PrefUtils().getFarmerId();
    FarmerAgriInfoSourceDB farmerLivestockAgeGroupsDB =
        FarmerAgriInfoSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<List<FarmerExtensionAccess>?> getEAccess() async {
    int id = PrefUtils().getFarmId();
    FarmerExtensionAccessDB farmerLivestockAgeGroupsDB =
        FarmerExtensionAccessDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerExtensionMode>?> getModes() async {
    int id = PrefUtils().getFarmId();
    FarmerExtensionModeDB farmerLivestockAgeGroupsDB = FarmerExtensionModeDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  List<CheckBoxList> _infos(
      List<CheckBoxList> feedmodelss, List<FarmerAgriInfoSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerAgriInfoSource> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.agriInfoSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  List<CheckBoxList> _access(
      List<CheckBoxList> feedmodelss, List<FarmerExtensionAccess> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerExtensionAccess> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.extensionSourceId);

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.other ?? "Not Applied";
    }

    return feedmodels;
  }

  List<CheckBoxList> _modes(
      List<CheckBoxList> feedmodelss, List<FarmerExtensionMode> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerExtensionMode> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.extensionModeId);

      feedmodels[index].isSelected = true;
    }
    return feedmodels;
  }

  Future<List<CheckBoxList>> fetchInfo() async {
    List<CheckBoxList> list = [];
    AgriInfoSourceDB farmStructureDB = AgriInfoSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agriInfoSource,
          id: value[i].agriInfoSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchEService() async {
    List<CheckBoxList> list = [];
    ExtensionModeDB farmStructureDB = ExtensionModeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceMode,
          id: value[i].extensionModeId,
        ));
      }
    });
    return list;
  }

  Future<List<CheckBoxList>> fetchEAccess() async {
    List<CheckBoxList> list = [];
    ExtensionSourceDB farmStructureDB = ExtensionSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceType,
          id: value[i].extensionSourceId,
        ));
      }
    });
    return list;
  }
}
