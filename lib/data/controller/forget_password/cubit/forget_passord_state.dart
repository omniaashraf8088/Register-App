part of 'forget_passord_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}
final class SendOtpLoading extends ForgetPasswordState{}

final class SendOtpSuccess extends ForgetPasswordState{
  final String message;

  SendOtpSuccess({required this.message});
}
final class SendOtpFailure extends ForgetPasswordState{
    final String message;

  SendOtpFailure({required this.message});
}
final class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess({required this.message});
}
final class ForgetPasswordLoading extends ForgetPasswordState {}
final class ForgetPasswordFailure extends ForgetPasswordState {
  final String   message;
  ForgetPasswordFailure({required this.message});
}


