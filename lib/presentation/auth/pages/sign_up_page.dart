import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';

import 'package:register_app/core/networking/dio_consumer.dart';

import 'package:register_app/data/controller/sign_up_cubit/cubit/sign_up_cubit.dart';
import 'package:register_app/presentation/auth/pages/sign_in_page.dart';

import 'package:register_app/presentation/auth/widget/accept_field_widget.dart';
import 'package:register_app/presentation/auth/widget/custom_register.dart';
import 'package:register_app/presentation/auth/widget/elevated_button.dart';

import '../widget/custom_dot_account.dart';
import '../widget/signup_form_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(DioConsumer()),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpSuccesss) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SignInPage()));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content:
                    Text('${state.message} - Welcome ${state.user.name}!')));
            // Navigate to next screen or handle successful registration
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: context.read<SignUpCubit>().signUpFormKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(height: 50.h),
                      Image(
                        image: AssetImage('assets/images/clap.png'),
                        width: 90.w,
                        height: 90.h,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text('Sign Up', style: AppStyle.labelSignUP),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomRegister(),
                      SignUpFormWidget(),
                      SizedBox(height: 16.h),
                      AcceptFieldWidget(),
                      SizedBox(height: 16.h),
                      state is SignUpLoading
                          ? CircularProgressIndicator()
                          : ElevatedButtonWidget(
                              onPressed: () {
                                context.read<SignUpCubit>().signUp();
                              },
                              text: 'Create Account'),
                      SizedBox(height: 10.h),
                      CustomDontHaveAccount(
                        isSignIn: true, // add this line
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
