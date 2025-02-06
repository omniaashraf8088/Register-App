import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndector extends StatefulWidget {
  final PageController controller;

  final List<int> pages;
  const SmoothIndector(
      {super.key, required this.pages, required this.controller});

  @override
  State<SmoothIndector> createState() => _SmoothIndectorState();
}

class _SmoothIndectorState extends State<SmoothIndector> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: widget.controller,
      count: widget.pages.length,
      effect: ScrollingDotsEffect(
        activeStrokeWidth: 1.2,
        dotHeight: 16,
        maxVisibleDots: 5,
        dotWidth: 5,
        radius: 4,
        spacing: 8,
        activeDotColor: Colors.blue,
        dotColor: Colors.grey,
      ),
    );
  }
}
