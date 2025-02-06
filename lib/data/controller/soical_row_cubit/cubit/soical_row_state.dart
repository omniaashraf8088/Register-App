part of 'soical_row_cubit.dart';

@immutable
sealed class SoicalRowState {}

final class SoicalRowInitial extends SoicalRowState {}

final class SoicalRowSuccessGoogle extends SoicalRowState {}

final class SoicalRowFailureGoogle extends SoicalRowState {
  final String errorMessage;
  SoicalRowFailureGoogle(this.errorMessage);
}

final class SoicalRowLoadingGoogle extends SoicalRowState {}

final class SoicalRowSuccessFacbook extends SoicalRowState {}

final class SoicalRowFailureFacbook extends SoicalRowState {
  final String errorMessage;
  SoicalRowFailureFacbook(this.errorMessage);
}

final class SoicalRowLoadingFacbook extends SoicalRowState {}
