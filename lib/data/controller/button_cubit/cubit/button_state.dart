part of 'button_cubit.dart';

@immutable
sealed class ButtonState {}

final class ButtonInitial extends ButtonState {}
final class ButtonVisbalText extends ButtonState {}
final class ButtonNotVisbalText extends ButtonState {}


