import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import '/core/app_export.dart';
import '../models/balancehistory_item_model.dart';
import 'package:kiamis_app/presentation/draft_entries_screen/models/draft_entries_model.dart';
part 'draft_entries_event.dart';
part 'draft_entries_state.dart';

/// A bloc that manages the state of a DraftEntries according to the event that is dispatched to it.
class DraftEntriesBloc extends Bloc<DraftEntriesEvent, DraftEntriesState> {
  DraftEntriesBloc(DraftEntriesState initialState) : super(initialState) {
    on<DraftEntriesInitialEvent>(_onInitialize);
    on<AddEditEvent>(_addEdit);
    on<DeleteEvent>(_delete);
  }
  Future<List<Farmer>?> getSaved() async {
    FarmerDB farmerDB = FarmerDB();
    return await farmerDB.fetchSaved();
  }

  Future<List<Farmer>?> getApproved() async {
    FarmerDB farmerDB = FarmerDB();
    return await farmerDB.fetchApproved();
  }

  Future<List<Farmer>?> getUnapproved() async {
    FarmerDB farmerDB = FarmerDB();
    return await farmerDB.fetchUnapproved();
  }

  Future<List<Farmer>?> getUnverified() async {
    FarmerDB farmerDB = FarmerDB();
    return await farmerDB.fetchSubmitted();
  }

  Future<List<Farmer>?> getAll() async {
    FarmerDB farmerDB = FarmerDB();
    return await farmerDB.fetchAll();
  }

  _onInitialize(
    DraftEntriesInitialEvent event,
    Emitter<DraftEntriesState> emit,
  ) async {
    String action = PrefUtils().getAction();
    List<Farmer>? farmers = [];
    if (action == "Incomplete") {
      PrefUtils().setEdit(true);
      farmers = await getAll();
    } else if (action == "To Submit") {
      PrefUtils().setEdit(true);

      farmers = await getSaved();
    } else if (action == "Approved") {
      PrefUtils().setEdit(false);

      farmers = await getApproved();
    } else if (action == "Rejected") {
      PrefUtils().setEdit(true);

      farmers = await getUnapproved();
    } else if (action == "Submitted") {
      PrefUtils().setEdit(false);

      farmers = await getUnverified();
    } else {
      PrefUtils().setEdit(true);

      farmers = await getAll();
    }
    List<BalancehistoryItemModel> models = [];
    if (farmers != null) {
      for (Farmer farmer in farmers) {
        models.add(BalancehistoryItemModel(
            id: farmer.farmerId,
            idNo: farmer.idNo,
            name: farmer.farmerName,
            comments: farmer.comments ?? "Not Applied"));
      }
    }

    emit(
      state.copyWith(
        draftEntriesModelObj: state.draftEntriesModelObj?.copyWith(
          balancehistoryItemList: models,
        ),
      ),
    );
  }

  List<BalancehistoryItemModel> fillBalancehistoryItemList() {
    return List.generate(7, (index) => BalancehistoryItemModel());
  }

  Future<List<FarmerFarm>?> getFarms(int? id) async {
    FarmerFarmDB farmerFishProductionLevelsDB = FarmerFarmDB();
    return id != null
        ? await farmerFishProductionLevelsDB.fetchByFarmer(id)
        : null;
  }

  _addEdit(
    AddEditEvent event,
    Emitter<DraftEntriesState> emit,
  ) async {
    if (event.value! == 1) {
      PrefUtils().setFarmerId(event.crop!);
      PrefUtils().setFarmerName(event.name!);
      List<FarmerFarm>? farms = await getFarms(event.crop);
      if (farms != null) {
        FarmerFarm farm = farms.last;
        PrefUtils().setFarmId(farm.farmerFarmId);
        PrefUtils().setFound(false);
      }
      event.createSuccessful!.call();
    } else {
      PrefUtils().setFarmId(0);
      event.createSuccessful!.call();
      PrefUtils().setFound(false);
    }
  }

  _delete(
    DeleteEvent event,
    Emitter<DraftEntriesState> emit,
  ) async {
    if (PrefUtils().getYesNo()) {
      FarmerDB farmerDB = FarmerDB();
      int del = await farmerDB.delete(event.value!);
      if (del > 0) {
        String action = PrefUtils().getAction();
        List<Farmer>? farmers = [];
        if (action == "Incomplete") {
          PrefUtils().setEdit(true);
          farmers = await getAll();
        } else if (action == "To Submit") {
          PrefUtils().setEdit(true);

          farmers = await getSaved();
        } else if (action == "Approved") {
          PrefUtils().setEdit(false);

          farmers = await getApproved();
        } else if (action == "Rejected") {
          PrefUtils().setEdit(true);

          farmers = await getUnapproved();
        } else if (action == "Submitted") {
          PrefUtils().setEdit(false);

          farmers = await getUnverified();
        } else {
          PrefUtils().setEdit(true);

          farmers = await getAll();
        }
        List<BalancehistoryItemModel> models = [];
        if (farmers != null) {
          for (Farmer farmer in farmers) {
            models.add(BalancehistoryItemModel(
              id: farmer.farmerId,
              idNo: farmer.idNo,
              name: farmer.farmerName,
            ));
          }
        }

        emit(
          state.copyWith(
            draftEntriesModelObj: state.draftEntriesModelObj?.copyWith(
              balancehistoryItemList: models,
            ),
          ),
        );
      }
    }
  }
}
