import 'package:flutter/material.dart';

class ProjectCarouselIndicators extends StatefulWidget {
  const ProjectCarouselIndicators({
    super.key,
    required this.pageController,
    required this.length,
    this.onTap,
  });

  final PageController pageController;
  final int length;
  final Function(int index)? onTap;

  @override
  State<ProjectCarouselIndicators> createState() =>
      _ProjectCarouselIndicatorsState();
}

class _ProjectCarouselIndicatorsState extends State<ProjectCarouselIndicators> {
  int _currentIndex = 0;
  @override
  void initState() {
    widget.pageController.addListener(() {
      _currentIndex =
          (widget.pageController.page?.toInt() ?? 0) % widget.length;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.length,
        (index) => InkWell(
          onTap: () {
            if (_currentIndex != index) widget.onTap?.call(index);
          },
          child: AnimatedContainer(
            height: _currentIndex == index ? 16 : 10,
            width: _currentIndex == index ? 16 : 10,
            margin: const EdgeInsets.all(4),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _currentIndex == index ? Colors.red : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
