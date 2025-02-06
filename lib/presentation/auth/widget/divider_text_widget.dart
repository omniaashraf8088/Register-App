import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/core/constant/app_style.dart';

class DividerTextWidget extends StatelessWidget {
  const DividerTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Color(0xFFE0E4EB),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Text(
            'Or',
            style: AppStyle.textOr,
          ),
        ),
        Expanded(
          child: Divider(
            color: Color(0xFFE0E4EB),
          ),
        ),
      ],
    );
  }
}
