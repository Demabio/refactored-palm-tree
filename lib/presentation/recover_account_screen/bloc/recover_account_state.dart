// ignore_for_file: must_be_immutable

part of 'recover_account_bloc.dart';

/// Represents the state of RecoverAccount in the application.
class RecoverAccountState extends Equatable {
  RecoverAccountState({
    this.userNameController,
    this.recoverAccountModelObj,
  });

  TextEditingController? userNameController;

  RecoverAccountModel? recoverAccountModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        recoverAccountModelObj,
      ];
  RecoverAccountState copyWith({
    TextEditingController? userNameController,
    RecoverAccountModel? recoverAccountModelObj,
  }) {
    return RecoverAccountState(
      userNameController: userNameController ?? this.userNameController,
      recoverAccountModelObj:
          recoverAccountModelObj ?? this.recoverAccountModelObj,
    );
  }
}
