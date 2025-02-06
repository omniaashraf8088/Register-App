import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingContent {
  final String image;
  final String title;
  final String subtitle;
  final String description;

  OnBoardingContent({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
  });
}

class OnBoardingItem extends StatelessWidget {
  final OnBoardingContent content;

  const OnBoardingItem({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          content.image,
        ),
        SizedBox(height: 80.h),
        Text(
          content.title,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 1.33,
          ),
        ),
        SizedBox(height: 17.h),
        Text(
          content.subtitle,
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.33,
          ),
        ),
        SizedBox(height: 45.h),
        Text(
          textAlign: TextAlign.center,
          content.description,
          style: TextStyle(
            color: Color(0xFFC7D2DE),
            fontSize: 15.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            height: 1.50,
          ),
        ),
      ],
    );
  }
}
