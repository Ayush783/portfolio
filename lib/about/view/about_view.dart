import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utils/extension.dart';

import '../widgets/animated_text_switcher.dart';

class AboutView extends ConsumerWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w / 8, vertical: 20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (w <= 720)
            Positioned(
              right: w > 650
                  ? -32
                  : w > 500
                      ? -72
                      : -120,
              child: Opacity(
                opacity: 0.45,
                child: Image.asset(
                  'assets/images/12.png',
                  height: h / 1.5,
                  cacheHeight: h ~/ 1.5 + 1,
                ),
              ),
            ),
          Row(
            children: [
              if (w > 720)
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/images/12.png',
                  ),
                ),
              SizedBox(width: 32.getResponsiveWidth(context)),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: h / 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Hello',
                          style: AppTypography.boldHeadingTextstyle.copyWith(
                            fontSize: w > 500 ? 64 : 48,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Expanded(child: AnimatedTextSwitcher()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
