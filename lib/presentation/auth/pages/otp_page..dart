import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';
import 'package:register_app/presentation/auth/pages/reset_page.dart';
import 'package:register_app/presentation/auth/widget/elevated_button.dart';
import 'package:register_app/presentation/auth/widget/getnot_otp_meeage.dart';

import 'package:register_app/presentation/auth/widget/pinput_form.dart';

class OtpPage extends StatelessWidget {
  final PageController controller = PageController(initialPage: 1);
  OtpPage({super.key});

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
              Image.asset('assets/images/message.png'),
              Text(
                'Enter OTP',
                style: AppStyle.labelSignUP,
              ),
              SizedBox(
                height: 16.h,
              ),
              AppStyle.textOtpDetails,
              SizedBox(
                height: 24.h,
              ),
              PinputFormWdget(),
              SizedBox(
                height: 32.h,
              ),
              ElevatedButtonWidget(onPressed: () {}, text: 'Reset Password'),
              SizedBox(
                height: 16.h,
              ),
              DontGetOtpMessageWidget(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResetPage(),
                      ),
                    );
                  },
                  child: Text('Next')),
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
