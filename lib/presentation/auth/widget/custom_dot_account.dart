import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/presentation/auth/pages/sign_in_page.dart';

import '../pages/sign_up_page.dart';

class CustomDontHaveAccount extends StatelessWidget {
  const CustomDontHaveAccount({super.key, this.isSignIn = false});
  final bool isSignIn;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          isSignIn ? 'Already have an account?' : 'Don’t have an account?',
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 14.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 1.57,
          ),
        ),
        GestureDetector(
          onTap: () {
           isSignIn
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignInPage(),
                    ),
                  )
                : Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpPage(),
                    ),
                  );
          },
          child: Text(
            isSignIn ? ' Sign In' : ' Sign Up',
            style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF3461FD),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
