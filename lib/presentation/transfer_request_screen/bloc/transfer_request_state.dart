// ignore_for_file: must_be_immutable

part of 'transfer_request_bloc.dart';

/// Represents the state of TransferRequest in the application.
class TransferRequestState extends Equatable {
  TransferRequestState({
    this.searchController,
    this.transferRequestModelObj,
  });

  TextEditingController? searchController;

  TransferRequestModel? transferRequestModelObj;

  @override
  List<Object?> get props => [
        searchController,
        transferRequestModelObj,
      ];
  TransferRequestState copyWith({
    TextEditingController? searchController,
    TransferRequestModel? transferRequestModelObj,
  }) {
    return TransferRequestState(
      searchController: searchController ?? this.searchController,
      transferRequestModelObj:
          transferRequestModelObj ?? this.transferRequestModelObj,
    );
  }
}
