abstract class BmiScoresState {}

final class BmiScoresInitial extends BmiScoresState {}

final class BmiScoresOldDataState extends BmiScoresState {}

final class BmiScoresEditState extends BmiScoresState {}

final class BmiUpdateSucces extends BmiScoresState {}

final class BmiUpdateFailure extends BmiScoresState {
  final String message;
  BmiUpdateFailure(this.message);
}

final class BmiUpdateLoading extends BmiScoresState {}

final class DeleteBmiLaoding extends BmiScoresState {}

final class DeleteBmiSucces extends BmiScoresState {}

final class DeleteBmiFailure extends BmiScoresState {
  final String message;
  DeleteBmiFailure(this.message);
}
