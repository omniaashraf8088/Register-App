import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ElevatedButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(345, 56),
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
          backgroundColor: Color(0xFF3461FD),
        ),
        onPressed: onPressed,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        )));
  }
}
