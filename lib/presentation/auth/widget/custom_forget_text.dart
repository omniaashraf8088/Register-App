import 'package:flutter/material.dart';

import '../pages/forget_page_view.dart';

class CustomForgetText extends StatelessWidget {
  const CustomForgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ForgetPasswordPageView(),
            ),
          );
        },
        child: Text(
          'Forget Password?',
          textAlign: TextAlign.right,
          style: TextStyle(
            color: Color(0xFF7C8AA0),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 1.83,
          ),
        ),
      ),
    );
  }
}
