import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';
import 'package:register_app/core/networking/dio_consumer.dart';
import 'package:register_app/data/controller/forget_password/cubit/forget_passord_cubit.dart';
import 'package:register_app/presentation/auth/widget/elevated_button.dart';
import 'package:register_app/presentation/auth/widget/text_field_widget.dart';
import 'package:register_app/presentation/auth/widget/smooth_indector.dart';
import 'package:register_app/presentation/auth/widget/pinput_form.dart';
import 'package:register_app/presentation/auth/widget/getnot_otp_meeage.dart';

import 'sign_in_page.dart';

class ForgetPasswordPageView extends StatefulWidget {
  const ForgetPasswordPageView({super.key});

  @override
  State<ForgetPasswordPageView> createState() => _ForgetPasswordPageViewState();
}

class _ForgetPasswordPageViewState extends State<ForgetPasswordPageView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(DioConsumer()),
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            return Form(
              key: context.read<ForgetPasswordCubit>().forgetPassFormKey,
              child: Column(
                children: [
                  SmoothIndicatorWidget(
                    count: 3,
                    controller: _pageController,
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: [
                        _buildForgetPasswordPage(),
                        _buildOtpPage(),
                        _buildResetPasswordPage(),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildForgetPasswordPage() {
    return Builder(builder: (context) {
      return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is SendOtpSuccess) {
            _nextPage();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green, content: Text(state.message)));
          } else if (state is SendOtpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red, content: Text(state.message)));
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  Image.asset('assets/images/message.png'),
                  Text('Forget Password', style: AppStyle.textForget),
                  SizedBox(height: 16.h),
                  AppStyle.textDetails,
                  SizedBox(height: 24.h),
                  TextFieldWidget(
                    text: 'Email/Phone Number',
                    controller:
                        context.read<ForgetPasswordCubit>().emailController,
                  ),
                  SizedBox(height: 32.h),
                  state is ForgetPasswordLoading
                      ? CircularProgressIndicator()
                      : ElevatedButtonWidget(
                          text: 'Continue',
                          onPressed: () {
                            context.read<ForgetPasswordCubit>().forgetPassord();
                          },
                        ),
                ],
              ),
            ),
          );
        },
      );
    });
  }

  Widget _buildOtpPage() {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 70.h),
                Image.asset('assets/images/message.png'),
                Text('Enter OTP', style: AppStyle.labelSignUP),
                SizedBox(height: 16.h),
                AppStyle.textOtpDetails,
                SizedBox(height: 24.h),
                PinputFormWdget(),
                SizedBox(height: 32.h),
                ElevatedButtonWidget(
                  text: 'Verify OTP',
                  onPressed: () {
                    if (context
                        .read<ForgetPasswordCubit>()
                        .otpFormKey
                        .currentState!
                        .validate()) {
                      _nextPage();
                    }
                  },
                ),
                SizedBox(height: 16.h),
                DontGetOtpMessageWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildResetPasswordPage() {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is ForgetPasswordSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
            (route) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.green, content: Text(state.message)));
        } else if (state is ForgetPasswordFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red, content: Text(state.message)));
        }
      },
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70.h),
                  Image.asset('assets/images/lock.png'),
                  Text('Reset Password', style: AppStyle.labelSignUP),
                  SizedBox(height: 16.h),
                  AppStyle.textDetails,
                  SizedBox(height: 24.h),
                  TextFieldWidget(
                    text: 'New Password',
                    controller:
                        context.read<ForgetPasswordCubit>().newPassController,
                    isPassword: true,
                  ),
                  SizedBox(height: 32.h),
                  ElevatedButtonWidget(
                    text: 'Submit',
                    onPressed: () {
                      // Handle password reset completion
                      context.read<ForgetPasswordCubit>().resetPassord();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
