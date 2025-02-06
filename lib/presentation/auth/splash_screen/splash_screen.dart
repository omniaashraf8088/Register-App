import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/presentation/on_boarding/pages/on_boarding_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              const OnBoardingPage())); // Replace with your route
      // Replace with your route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Logo.png', // Add your logo image path
              width: 200,
              height: 200,
            ),
            SizedBox(height: 32.h),
            Text(
              'Econify',
              style: TextStyle(
                color: Color(0xFF2A4ECA),
                fontSize: 32,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 1.25,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CircularProgressIndicator(
              color: Color.fromARGB(
                  255, 122, 67, 15), // Match your app's theme color
            ),
          ],
        ),
      ),
    );
  }
}
