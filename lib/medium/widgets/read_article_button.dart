import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/firebase_analytics_service.dart';

import '../../theme/theme.dart';
import '../../utils/url_launcher_util.dart';

class LaunchArticleButton extends ConsumerStatefulWidget {
  const LaunchArticleButton({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  ConsumerState<LaunchArticleButton> createState() => _LaunchArticleButton();
}

class _LaunchArticleButton extends ConsumerState<LaunchArticleButton> {
  Color color = AppColors.secondaryColor;
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            UrlLaunchUtil.launch(widget.url);
          },
          onHover: (val) {
            setState(() {
              isHovered = val;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(
                    width: isHovered ? 3 : 2, color: AppColors.primaryColor),
                right:
                    const BorderSide(width: 2, color: AppColors.primaryColor),
                top: const BorderSide(width: 2, color: AppColors.primaryColor),
                bottom:
                    const BorderSide(width: 2, color: AppColors.primaryColor),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  'assets/icons/medium.svg',
                  height: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  'Read Article',
                  style: AppTypography.bodyTextstyle.copyWith(
                      color: isHovered
                          ? AppColors.primaryColor
                          : AppColors.secondaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
