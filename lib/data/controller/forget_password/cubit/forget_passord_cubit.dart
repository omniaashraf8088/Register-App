import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:register_app/core/networking/api_consumer.dart';

part 'forget_passord_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.apiConsumer) : super(ForgetPasswordInitial());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController newPassController = TextEditingController();
  final GlobalKey<FormState> forgetPassFormKey = GlobalKey();
  final GlobalKey<FormState> otpFormKey = GlobalKey();

  final ApiConsumer apiConsumer;

  @override
  Future<void> close() {
    emailController.dispose();
    return super.close();
  }

  void forgetPassord() async {
    if (!forgetPassFormKey.currentState!.validate()) return;

    try {
      emit(SendOtpLoading());

      final response = await apiConsumer.post(
          'https://node-auth-kohl-eight.vercel.app/api/auth/forgot-password',
          data: {
            "email": emailController.text.trim(),
          });

      emit(SendOtpSuccess(
        message: response['message'].toString(),
      ));
    } catch (e) {
      emit(SendOtpFailure(message: e.toString()));
    }
  }
  void resetPassord() async {
    try {
      emit(ForgetPasswordLoading());

      final response = await apiConsumer.post(
          'https://node-auth-kohl-eight.vercel.app/api/auth/reset-password',
          data: {
            "email": emailController.text.trim(),
            "otp" : otpController.text,
            "newPassword": newPassController.text
          });

      emit(ForgetPasswordSuccess(
        message: response['message'].toString(),
      ));
    } catch (e) {
      emit(ForgetPasswordFailure(message: e.toString()));
    }
  }
}
