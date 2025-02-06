import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_color.dart';

class AppStyle {
  static final labelSignUP = TextStyle(
    color: Color(0xFF2A4ECA),
    fontSize: 32.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static final textDetails = Text(
      textAlign: TextAlign.center,
      'It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.',
      style: TextStyle(
        fontFamily: 'Poppins',
        color: AppColor.colorGray,
        fontSize: 13.5.sp,
        fontWeight: FontWeight.w400,
        height: 1.57,
      ));
  static final textOtpDetails = Text(
      "Enter the OTP code we just sent you on your registered Email/Phone number",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'Poppins',
        color: AppColor.colorGray,
        fontSize: 13.5.sp,
        fontWeight: FontWeight.w400,
        height: 1.57,
      ));
  static final textForget = TextStyle(
    color: Color(0xFF2A4ECA),
    fontSize: 32,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    height: 1.25,
  );

  static final textOr = TextStyle(
    color: Color(0xFF262626),
    fontSize: 14.sp,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    height: 1.57,
  );
}
