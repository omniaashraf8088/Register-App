import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 24,
                color: Color(0xFF262626),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Last updated: [Date]',
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'This Privacy Policy describes how we collect, use, and handle your information when you use our application.',
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Information Collection',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 21,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We collect several different types of information for various purposes to provide and improve our service to you.',
              style: TextStyle(
                color: Color(0xFF262626),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 1.50,
              ),
            ),
            // Add more sections as needed
          ],
        ),
      ),
    );
  }
}
