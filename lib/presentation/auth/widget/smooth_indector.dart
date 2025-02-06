import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothIndicatorWidget extends StatefulWidget {
  final PageController controller;

  final int count;
  const SmoothIndicatorWidget(
      {super.key, required this.count, required this.controller});

  @override
  State<SmoothIndicatorWidget> createState() => _SmoothIndectorState();
}

class _SmoothIndectorState extends State<SmoothIndicatorWidget> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: widget.controller,
      count: widget.count,
      effect: WormEffect(
        dotHeight: 4,
        dotWidth: 32,
        radius: 4,
        spacing: 8,
        activeDotColor: Colors.blue,
        dotColor: Colors.grey,
      ),
    );
  }
}
