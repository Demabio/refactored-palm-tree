import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationmemberships.dart';
import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/category.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/membershiptypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/category.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/models/add_landandwatermgmt_six_model.dart';
part 'add_landandwatermgmt_six_event.dart';
part 'add_landandwatermgmt_six_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtSix according to the event that is dispatched to it.
class AddLandandwatermgmtSixBloc
    extends Bloc<AddLandandwatermgmtSixEvent, AddLandandwatermgmtSixState> {
  AddLandandwatermgmtSixBloc(AddLandandwatermgmtSixState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtSixInitialEvent>(_onInitialize);
    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);
    on<ChangeDropDownEvent>(_changeDPD);

    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtSixModelObj!.ageGroupmModels;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addLandandwatermgmtSixModelObj!.count + 1,
    )));
  }

  _changeDPD(
    ChangeDropDownEvent event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtSixModelObj!.ageGroupmModels;

    newModels[event.id].drop = event.value;

    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addLandandwatermgmtSixModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      ageGroupmModels: await fetchSchemes(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    FarmerIrrigationCategoryDB farmerFishInputDB = FarmerIrrigationCategoryDB();
    List<FarmerIrrigationCategory>? categs = [];
    List<FarmerIrrigationCategory>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerIrrigationCategory(
              irrigationCropId: 0,
              farmerFarmId: PrefUtils().getFarmId(),
              farmerId: PrefUtils().getFarmerId(),
              irrigationCategoryId: model.id!,
              membershipTypeId: model.drop?.id,
              createdBy: userId,
              irrigationProjectName: model.male?.text,
              dateCreated: DateTime.now()),
        );
        if (model.isSelected) {
          categs.add(
            FarmerIrrigationCategory(
                irrigationCropId: 0,
                farmerFarmId: PrefUtils().getFarmId(),
                farmerId: PrefUtils().getFarmerId(),
                irrigationCategoryId: model.id!,
                membershipTypeId: model.drop?.id,
                createdBy: userId,
                irrigationProjectName: model.male?.text,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtSixModelObj!.scheme!.isEmpty) {
        farmerFishInputDB.insertIrrigationCategories(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmId())
          .then((value) => print("deleted: $value"));
      farmerFishInputDB.reinsertIrrigationCategories(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<SelectionPopupModel>?> memberships() async {
    List<IrrigationMembershipType>? types = [];
    List<SelectionPopupModel>? list = [];

    IrrigationMembershipTypeDB membershipTypeDB = IrrigationMembershipTypeDB();
    types = await membershipTypeDB.fetchAll();
    if (types != null)
      for (var type in types) {
        list.add(SelectionPopupModel(
          title: type.irrigationMembershipType,
          id: type.membershipTypeId,
        ));
      }
    return list;
  }

  Future<List<CheckBoxList>> fetchSchemes() async {
    List<CheckBoxList> list = [];

    List<SelectionPopupModel>? dpds = await memberships();
    //  List<SelectionPopupModel> dpds = [
    //     SelectionPopupModel(title: "Full Member", id: 1),
    //     SelectionPopupModel(title: "Out Grower Member", id: 0),
    //   ];
    IrrigationCategoryDB livestockAgeGroupDB = IrrigationCategoryDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationCategory,
          id: value[i].irrigationCategoryId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
          model: dpds ?? [],
        ));
      }
    });
    return list;
  }

  List<CheckBoxList> _land(
      List<CheckBoxList> feedmodelss, List<FarmerIrrigationCategory> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIrrigationCategory> feeds = feedss;

    for (var ent in feeds) {
      SelectionPopupModel? drop;
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.irrigationCategoryId);
      if (ent.membershipTypeId != 0) {
        int index2 = feedmodels[index]
            .model
            .indexWhere((obj) => obj.id == ent.membershipTypeId);

        drop = index2 >= 0 ? feedmodels[index].model[index2] : drop;
      }

      feedmodels[index].isSelected = true;
      feedmodels[index].var1 = ent.irrigationProjectName ?? "Not Applied";
      feedmodels[index].male =
          TextEditingController(text: ent.irrigationProjectName);
      feedmodels[index].drop = ent.membershipTypeId == 0 ? null : drop;
    }

    return feedmodels;
  }

  Future<List<FarmerIrrigationCategory>?> getCategs() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationCategoryDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarm(id);
  }

  Future<List<FarmerIrrigationCategory>?> getallCategs() async {
    int id = PrefUtils().getFarmId();
    FarmerIrrigationCategoryDB farmerLivestockAgeGroupsDB =
        FarmerIrrigationCategoryDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmAll(id);
  }

  Future<LWProgress?> getProgress() async {
    int farmerid = PrefUtils().getFarmId();
    LWProgressDB pfProgressDB = LWProgressDB();
    return await pfProgressDB.fetchByFarm(farmerid);
  }

  _onInitialize(
    AddLandandwatermgmtSixInitialEvent event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) async {
    LWProgress pfProgress = await getProgress() ??
        LWProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? schememodels = await fetchSchemes();

    List<FarmerIrrigationCategory>? scheme = await getCategs() ?? [];
    List<FarmerIrrigationCategory>? allscheme = await getallCategs() ?? [];
    if (scheme.isNotEmpty) {
      schememodels = _land(schememodels, scheme);
    }
    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      ageGroupmModels: schememodels,
      lwProgress: pfProgress,
      scheme: allscheme,
    )));
  }
}
