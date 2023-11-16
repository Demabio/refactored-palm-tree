import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/farm/farmassetsource.dart';
import 'package:kiamis_app/data/models/dbModels/other/laboursource.dart';
import 'package:kiamis_app/presentation/profile/models/profile_model.dart';
import '/core/app_export.dart';
part 'profile_event.dart';
part 'profile_state.dart';

/// A bloc that manages the state of a Farmtechandassets according to the event that is dispatched to it.
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState) {
    on<ProfileEvent>(_onInitialize);
  }

  _onInitialize(
    ProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    final claims = JWT.decode(PrefUtils().getToken());
    int userId = int.parse(claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier']);

    String ward = claims.payload['Ward'] ?? "1";
    String sublocation = claims.payload['Sublocation'] ?? "1";
    // String location = claims.payload['LocationId'] ?? "1";
    String county = claims.payload['County'] ?? "1";
    // String county = claims.payload['CountyId'] ?? "1";
    // String subcounty = claims.payload['SubcountyId'] ?? "1";
    String subcounty = claims.payload['Subcounty'] ?? "1";
    String status = claims.payload['Status'] ?? "1";

    String idNo = claims.payload['IDNo'] ?? "1";

    String enumeratorname = claims
        .payload['http://schemas.xmlsoap.org/ws/2005/05/identity/claims/name'];
    String enumeratorarea = claims.payload['EnumerationAreaNumber'];

    String enumeratormobile = claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/mobilephone'];

    emit(state.copyWith(
      name: enumeratorname,
      eAN: enumeratorarea,
      mobile: enumeratormobile,
      ward: ward,
      sublocation: sublocation,
      county: county,
      subCounty: subcounty,
      status: status,
      idNo: idNo,
      id: userId.toString(),
    ));
  }
}
