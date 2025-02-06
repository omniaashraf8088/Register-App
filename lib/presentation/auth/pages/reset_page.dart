import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';

import 'package:register_app/presentation/auth/widget/elevated_button.dart';

import 'package:register_app/presentation/auth/widget/text_field_widget.dart';

class ResetPage extends StatelessWidget {
  final PageController controler = PageController(initialPage: 2);
  ResetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.h,
              ),
              Image.asset('assets/images/lock.png'),
              Text(
                'Reset Password',
                style: AppStyle.labelSignUP,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppStyle.textDetails,
              SizedBox(
                height: 24.h,
              ),
              TextFieldWidget(
                text: 'New Password',
                controller: TextEditingController(),
                isPassword: true,
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFieldWidget(
                text: 'Confirm Password',
                controller: TextEditingController(),
                isPassword: true,
              ),
              SizedBox(
                height: 32.h,
              ),
              ElevatedButtonWidget(onPressed: () {}, text: 'Submitting'),
              SizedBox(
                height: 174.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
