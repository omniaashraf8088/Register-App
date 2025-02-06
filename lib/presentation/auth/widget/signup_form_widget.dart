import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/controller/sign_up_cubit/cubit/sign_up_cubit.dart';
import 'text_field_widget.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Column(
          children: [
            TextFieldWidget(
                text: 'Name',
                controller: context.read<SignUpCubit>().nameController),
            SizedBox(height: 16.h),
            TextFieldWidget(
                text: 'Email/Phone Number',
                controller: context.read<SignUpCubit>().emailController),
            SizedBox(height: 16.h),
            TextFieldWidget(
                text: 'Password',
                controller: context.read<SignUpCubit>().passwordController,
                isPassword: true),
          ],
        );
      },
    );
  }
}
