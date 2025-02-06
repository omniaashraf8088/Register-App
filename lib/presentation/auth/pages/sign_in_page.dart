import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';
import 'package:register_app/data/controller/sign_in_cubit/cubit/sign_in_cubit.dart';
import 'package:register_app/presentation/auth/pages/home_page.dart';

import 'package:register_app/presentation/auth/widget/custom_dot_account.dart';
import 'package:register_app/presentation/auth/widget/custom_forget_text.dart';
import 'package:register_app/presentation/auth/widget/custom_register.dart';
import 'package:register_app/presentation/auth/widget/elevated_button.dart';

import '../../../core/networking/dio_consumer.dart';
import '../widget/text_field_widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(DioConsumer()),
      child: Scaffold(
          body: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green, content: Text(state.message)));
            // Navigate to next screen or handle successful registration
          } else if (state is SignInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: context.read<SignInCubit>().signInFormKey,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(height: 50.h),
                    Image(
                      image: AssetImage('assets/images/hi.png'),
                      width: 90.w,
                      height: 90.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text('Sign In', style: AppStyle.labelSignUP),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomRegister(),
                    TextFieldWidget(
                      text: 'email',
                      controller: context.read<SignInCubit>().emailController,
                    ),
                    SizedBox(height: 16.h),
                    TextFieldWidget(
                      text: 'Password',
                      controller:
                          context.read<SignInCubit>().passwordController,
                      isPassword: true,
                    ),
                    SizedBox(height: 8.h),
                    CustomForgetText(),
                    SizedBox(height: 12.h),
                    state is SignInLoading
                        ? CircularProgressIndicator()
                        : ElevatedButtonWidget(
                            onPressed: () {
                              context.read<SignInCubit>().signIn();
                            },
                            text: 'Sign In'),
                    SizedBox(height: 16.h),
                    CustomDontHaveAccount(),
                  ]))),
            ),
          );
        },
      )),
    );
  }
}
