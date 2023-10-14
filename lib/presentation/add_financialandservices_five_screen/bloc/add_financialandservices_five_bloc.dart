import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/creditservice.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_five_screen/models/add_financialandservices_five_model.dart';
part 'add_financialandservices_five_event.dart';
part 'add_financialandservices_five_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesFive according to the event that is dispatched to it.
class AddFinancialandservicesFiveBloc extends Bloc<
    AddFinancialandservicesFiveEvent, AddFinancialandservicesFiveState> {
  AddFinancialandservicesFiveBloc(AddFinancialandservicesFiveState initialState)
      : super(initialState) {
    on<AddFinancialandservicesFiveInitialEvent>(_onInitialize);

    on<AddCBs>(_addAgeGroups);
    on<ResetCBs>(_resetCBs);
    on<ChangeCheckbox>(_changeAgeGroupCB);
  }
  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesFiveModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesFiveModelObj!.count + 1,
    )));
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

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj?.copyWith(
      models: await fetchFinancialServ(),
      count: 0,
    )));
  }

  List<CheckBoxList> _credits(
      List<CheckBoxList> feedmodelss, List<FarmerCreditService> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerCreditService> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.creditSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    FarmerCreditServiceDB farmerFishInputDB = FarmerCreditServiceDB();
    List<FarmerCreditService>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerCreditService(
                farmerCreditServiceId: 0,
                farmerId: PrefUtils().getFarmerId(),
                saccoName: model.male?.text,
                creditSourceId: model.id!,
                createdBy: userId,
                dateCreated: DateTime.now()),
          );
        }
      }
      if (state.addFinancialandservicesFiveModelObj!.fsProgress?.pageOne == 0) {
        farmerFishInputDB.insertCreditServices(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmerId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertCreditServices(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerCreditService>?> getCredits() async {
    int id = PrefUtils().getFarmerId();
    FarmerCreditServiceDB farmerLivestockAgeGroupsDB = FarmerCreditServiceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<FSProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddFinancialandservicesFiveInitialEvent event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? creditmodels = await fetchFinancialServ();

    //  if (pfProgress.pageOne == 1) {
    List<FarmerCreditService>? categs = await getCredits();
    creditmodels = categs != null
        ? creditmodels = _credits(creditmodels, categs)
        : creditmodels;
    //  }
    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj?.copyWith(
      models: creditmodels,
    )));
  }
}
