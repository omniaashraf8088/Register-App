import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';
import 'package:register_app/presentation/auth/pages/otp_page..dart';
import 'package:register_app/presentation/auth/widget/elevated_button.dart';
import 'package:register_app/presentation/auth/widget/smooth_indector.dart';

import 'package:register_app/presentation/auth/widget/text_field_widget.dart';

class ForgetPasswordPage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 0);
  ForgetPasswordPage({super.key});

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
              SmoothIndicatorWidget(count: 3, controller: controller),
              SizedBox(
                height: 70.h,
              ),
              Image.asset('assets/images/message.png'),
              Text(
                'Forget Passsword',
                style: AppStyle.textForget,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppStyle.textDetails,
              SizedBox(
                height: 24.h,
              ),
              TextFieldWidget(
                text: 'Email/Phone Number',
                controller: TextEditingController(),
              ),
              SizedBox(
                height: 32.h,
              ),
              ElevatedButtonWidget(onPressed: () {}, text: 'Continue'),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OtpPage(),
                      ),
                    );
                  },
                  child: Text('Next')),
              SizedBox(
                height: 250.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
