import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/incomesource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_three_dialog/models/add_financialandservices_three_model.dart';
part 'add_financialandservices_three_event.dart';
part 'add_financialandservices_three_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesThree according to the event that is dispatched to it.
class AddFinancialandservicesThreeBloc extends Bloc<
    AddFinancialandservicesThreeEvent, AddFinancialandservicesThreeState> {
  AddFinancialandservicesThreeBloc(
      AddFinancialandservicesThreeState initialState)
      : super(initialState) {
    on<AddFinancialandservicesThreeInitialEvent>(_onInitialize);
    on<AddCBs>(_addAgeGroups);
    on<ResetCBs>(_resetCBs);
    on<ChangeCheckbox>(_changeAgeGroupCB);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesThreeModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesThreeModelObj!.count + 1,
    )));
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

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj?.copyWith(
      models: await fetchIncomes(),
      count: 0,
    )));
  }

  List<CheckBoxList> _incomes(
      List<CheckBoxList> feedmodelss, List<FarmerIncomeSource> feedss) {
    List<CheckBoxList> feedmodels = feedmodelss;
    List<FarmerIncomeSource> feeds = feedss;

    for (var ent in feeds) {
      int index = feedmodels.indexWhere((obj) => obj.id == ent.incomeSourceId);

      feedmodels[index].isSelected = true;
    }

    return feedmodels;
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    FarmerIncomeSourceDB farmerFishInputDB = FarmerIncomeSourceDB();
    List<FarmerIncomeSource>? categs = [];
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload['nameidentifier']);

    try {
      for (CheckBoxList model in event.models) {
        if (model.isSelected) {
          categs.add(
            FarmerIncomeSource(
              farmerIncomeId: 0,
              farmerId: PrefUtils().getFarmerId(),
              priorityLevel: 0,
              incomeSourceId: model.id!,
            ),
          );
        }
      }
      if (state.addFinancialandservicesThreeModelObj!.fsProgress?.pageOne ==
          0) {
        farmerFishInputDB.insertIncome(categs).then((value) {
          print("inserted: $value");
        });
      } else {
        farmerFishInputDB
            .delete(PrefUtils().getFarmerId())
            .then((value) => print("deleted: $value"));
        farmerFishInputDB.insertIncome(categs).then((value) {
          print("inserted: $value");
        });
      }

      event.createSuccessful?.call();
    } catch (e) {
      event.createFailed!.call();
    }
  }

  Future<List<FarmerIncomeSource>?> getIncomes() async {
    int id = PrefUtils().getFarmerId();
    FarmerIncomeSourceDB farmerLivestockAgeGroupsDB = FarmerIncomeSourceDB();
    return await farmerLivestockAgeGroupsDB.fetchByFarmerId(id);
  }

  Future<FSProgress?> getProgress() async {
    int id = PrefUtils().getFarmId();
    FSProgressDB pfProgressDB = FSProgressDB();
    return await pfProgressDB.fetchByFarm(id);
  }

  _onInitialize(
    AddFinancialandservicesThreeInitialEvent event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) async {
    FSProgress pfProgress = await getProgress() ??
        FSProgress(
          farmId: 0,
          pageOne: 0,
          pageTwo: 0,
        );

    List<CheckBoxList>? incomemodels = await fetchIncomes();

    //  if (pfProgress.pageOne == 1) {
    List<FarmerIncomeSource>? incomes = await getIncomes();
    incomemodels = incomes != null
        ? incomemodels = _incomes(incomemodels, incomes)
        : incomemodels;
    //  }
    emit(state.copyWith(
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj?.copyWith(
      models: incomemodels,
    )));
  }
}
