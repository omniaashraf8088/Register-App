import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:register_app/core/networking/api_consumer.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.apiConsumer) : super(SignInInitial());
   final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> signInFormKey = GlobalKey();

  
  final ApiConsumer apiConsumer;
  
  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
   void signIn() async {
    if (!signInFormKey.currentState!.validate()) return;

    try {
      emit(SignInLoading());

      final response = await apiConsumer.post(
          'https://node-auth-kohl-eight.vercel.app/api/auth/login',
          data: {
            "email": emailController.text.trim(),
            "password": passwordController.text
          });

      final token = response['token'];
      if(token.toString().isNotEmpty) {
        emit(SignInSuccess(
          message:  'SignIn Success' ,
        ));
      }else {
         emit(SignInFailure(errorMessage: 'Something Went wrong!'));
      }
    } catch (e) {
      emit(SignInFailure(errorMessage: e.toString()));
    }
  }
}
