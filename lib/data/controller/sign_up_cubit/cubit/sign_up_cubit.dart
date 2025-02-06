import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register_app/core/networking/api_consumer.dart';

import '../../../models/user_model.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.apiConsumer) : super(SignUpInitial());
  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  final ApiConsumer apiConsumer;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  void signUp() async {
    if (!signUpFormKey.currentState!.validate()) return;

    try {
      emit(SignUpLoading());

      final response = await apiConsumer.post(
          'https://node-auth-kohl-eight.vercel.app/api/auth/register',
          data: {
            "name": nameController.text.trim(),
            "email": emailController.text.trim(),
            "password": passwordController.text
          });

      final user = User.fromJson(response['user']);
      emit(SignUpSuccesss(
        user: user,
        message: response['message'],
      ));
    } catch (e) {
      emit(SignUpFailure(errorMessage: e.toString()));
    }
    
}}
