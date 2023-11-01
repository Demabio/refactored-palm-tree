import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisertype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fertiliser/fertiliser.dart';
import '../models/add_crop_fertiliser_model.dart';
import '/core/app_export.dart';
part 'add_crop_fertiliser_event.dart';
part 'add_crop_fertiliser_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtThree according to the event that is dispatched to it.
class AddCropFertiliserBloc
    extends Bloc<AddCropFertiliserEvent, AddCropFertiliserState> {
  AddCropFertiliserBloc(AddCropFertiliserState initialState)
      : super(initialState) {
    on<AddCropFertiliserInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddCropFertiliserState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtThreeModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtThreeModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fecthType() async {
    List<CheckBoxList> list = [];
    FertiliserTypeDB farmStructureDB = FertiliserTypeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fertiliserType,
          id: value[i].fertiliserTypeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddCropFertiliserState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: await fecthType(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddCropFertiliserState> emit,
  ) {
    FarmerFertiliserDB farmerFishInputDB = FarmerFertiliserDB();
    List<FarmerFertiliser>? categs = [];
    List<FarmerFertiliser>? notit = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        notit.add(
          FarmerFertiliser(
              farmerFertId: 0,
              farmerCropId: PrefUtils().getCropId(),
              farmerId: PrefUtils().getFarmerId(),
              farmerFarmId: PrefUtils().getFarmId(),
              fertiliserTypeId: model.id!,
              createdBy: userId,
              dateCreated: DateTime.now()),
        );
        if (model.isSelected) {
          categs.add(
            FarmerFertiliser(
                farmerFertId: 0,
                farmerCropId: PrefUtils().getCropId(),
                farmerId: PrefUtils().getFarmerId(),
                farmerFarmId: PrefUtils().getFarmId(),
                fertiliserTypeId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addLandandwatermgmtThreeModelObj!.type!.isEmpty) {
        farmerFishInputDB.insertFertilisers(notit).then((value) {
          print("inserted: $value");
        });
      }
      farmerFishInputDB
          .delete(PrefUtils().getFarmId())
          .then((value) => print("deleted: $value"));

      farmerFishInputDB.reinsertFertilisers(categs).then((value) {
        print("inserted: $value");
      });

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  List<CheckBoxList> _types(
      List<CheckBoxList> feedmodelss, List<FarmerFertiliser> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerFertiliser> feeds = feedss;

    for (var ent in feeds) {
      int index =
          feedmodels.indexWhere((obj) => obj.id == ent.fertiliserTypeId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  Future<List<FarmerFertiliser>?> getTypes() async {
    int id = PrefUtils().getCropId();
    FarmerFertiliserDB farmerFishInputDB = FarmerFertiliserDB();
    return await farmerFishInputDB.fetchByCropId(id);
  }

  Future<List<FarmerFertiliser>?> getallTypes() async {
    int id = PrefUtils().getCropId();
    FarmerFertiliserDB farmerFishInputDB = FarmerFertiliserDB();
    return await farmerFishInputDB.fetchByCropIdAll(id);
  }

  Future<CAProgress?> getProgress() async {
    int cropid = PrefUtils().getCropId();
    CAProgressDB caProgressDB = CAProgressDB();
    return await caProgressDB.fetchByCropId(cropid);
  }

  _onInitialize(
    AddCropFertiliserInitialEvent event,
    Emitter<AddCropFertiliserState> emit,
  ) async {
    CAProgress caProgress = await getProgress() ??
        CAProgress(
          cropId: 0,
          pageOne: 0,
          pageTwo: 0,
        );
    List<CheckBoxList>? typemodels = await fecthType();

    List<FarmerFertiliser>? type = await getTypes() ?? [];
    List<FarmerFertiliser>? alltype = await getallTypes() ?? [];
    if (type.isNotEmpty) {
      typemodels = _types(typemodels, type);
    }
    emit(state.copyWith(
        addLandandwatermgmtThreeModelObj:
            state.addLandandwatermgmtThreeModelObj?.copyWith(
      models: typemodels,
      caProgressDB: caProgress,
      type: alltype,
    )));
  }
}
