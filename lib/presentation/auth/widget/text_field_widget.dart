import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.text,
      required this.controller,
      this.isPassword = false});
  final String text;
  final TextEditingController controller;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 1.50,
          ),
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
            hintText: text,
            fillColor: Color(0xFFF5F9FD),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            filled: true,
            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.visibility_off_outlined,
                      color: Colors.grey,
                    ),
                  )
                : null,
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
