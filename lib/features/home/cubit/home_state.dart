abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class BmiCalState extends HomeState {}

final class ChangeHeightState extends HomeState {}

final class ChangeAgeState extends HomeState {}

final class ChangeWightState extends HomeState {}

final class BmiSaveLoading extends HomeState {}

final class BmiSaveSucess extends HomeState {}

final class BmiSaveFailure extends HomeState {
  final String error;
  BmiSaveFailure(this.error);
}

final class GetBmiSavedDataLoading extends HomeState {}

final class GetBmiSavedDataSucess extends HomeState {}

final class GetBmiSavedDataFailure extends HomeState {
  final String error;
  GetBmiSavedDataFailure(this.error);
}
