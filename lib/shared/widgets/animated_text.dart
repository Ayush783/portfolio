import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  bool animate = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 10)).then((value) {
      setState(() {
        animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      final subtexts = widget.text.split(" ");
      return Wrap(
        spacing: 4,
        runSpacing: 3,
        children: [
          for (int i = 0; i < subtexts.length; i++)
            AnimatedPadding(
              padding: EdgeInsets.only(top: animate ? 0 : 20),
              duration: Duration(
                milliseconds: 225 + 50 * i,
              ),
              child: Text(
                subtexts[i],
                style: AppTypography.bodyTextstyle2,
              ),
            ),
        ],
      );
    });
  }
}
