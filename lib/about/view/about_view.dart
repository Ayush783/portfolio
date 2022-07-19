import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/about/provider/about_view_provider.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utils/extension.dart';
import 'package:portfolio/utils/url_launcher_util.dart';

import '../widgets/animated_text_switcher.dart';

class AboutView extends ConsumerWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w / 8),
      child: Row(
        children: [
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
                        fontSize: 64,
                      ),
                      children: const [
                        TextSpan(text: '🙏', style: TextStyle(fontSize: 54)),
                      ],
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
    );
  }
}
