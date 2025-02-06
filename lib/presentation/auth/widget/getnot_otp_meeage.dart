import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DontGetOtpMessageWidget extends StatelessWidget {
  const DontGetOtpMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Didn\'t get the OTP?',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 1.57,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Resend OTP',
            style: TextStyle(
              color: Color(0xFF2A4ECA),
              fontSize: 14.sp,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              height: 1.57,
            ),
          ),
        ),
      ],
    );
  }
}
