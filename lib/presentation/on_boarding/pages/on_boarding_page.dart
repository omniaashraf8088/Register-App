import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:register_app/presentation/auth/pages/sign_in_page.dart';

import 'package:register_app/presentation/on_boarding/widgets/on_boarding_item.dart';

import '../../auth/widget/smooth_indector.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnBoardingContent> contents = [
    OnBoardingContent(
      title: "The Simple Way to",
      subtitle: 'find the best!',
      description:
          "Aenean eu lacinia ligula. Quisque eu risus erat. Aenean placerat sollicitudin lectus.",
      image: "assets/images/onboarding_1.png",
    ),
    OnBoardingContent(
      title: "The Best Design",
      subtitle: 'Strategy!',
      description:
          "Aenean eu lacinia ligula. Quisque eu risus erat. Aenean placerat sollicitudin lectus.",
      image: "assets/images/onboarding_2.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3A4053),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: contents.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnBoardingItem(content: contents[index]);
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 24.w,
                ),
                SmoothIndicatorWidget(
                    controller: _pageController, count: contents.length),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      if (_currentPage == contents.length - 1) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                          (route) => false,
                        );
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xFFC7D2DE),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
