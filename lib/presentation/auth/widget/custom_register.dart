import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';
import 'package:register_app/presentation/auth/widget/divider_text_widget.dart';
import 'package:register_app/presentation/auth/widget/soical_row_widget.dart';

class CustomRegister extends StatelessWidget {
  const CustomRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStyle.textDetails,
        SizedBox(height: 20.h),
        SoicalRegisterationWidget(),
        SizedBox(height: 10.h),
        DividerTextWidget(),
      ],
    );
  }
}
