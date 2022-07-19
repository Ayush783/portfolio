import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/theme.dart';
import '../../utils/url_launcher_util.dart';
import '../provider/about_view_provider.dart';

class AboutViewActions extends ConsumerStatefulWidget {
  const AboutViewActions({Key? key}) : super(key: key);

  @override
  ConsumerState<AboutViewActions> createState() => _AboutViewActions();
}

class _AboutViewActions extends ConsumerState<AboutViewActions> {
  String getText(int i) {
    switch (i) {
      case 2:
        return 'Dexter Brains';
      case 3:
        return 'pub.dev';
      case 4:
        return 'Medium';
      case 5:
        return 'Contact Me';
      default:
        return '';
    }
  }

  String getIcon(int i) {
    switch (i) {
      case 2:
        return 'db';
      case 3:
        return 'pub';
      case 4:
        return 'medium';
      case 5:
        return 'contact';
      default:
        return '';
    }
  }

  String getUrl(int i) {
    switch (i) {
      case 2:
        return 'https://dexterbrains.com/';
      case 3:
        return 'https://pub.dev/packages/readsms';
      case 4:
        return 'https://medium.com/@Ayush_b58';
      case 5:
        return '#';
      default:
        return '';
    }
  }

  Color color = AppColors.secondaryColor;
  bool isHovered = false;

  Widget getRow(int i, Color c) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/icons/${getIcon(i)}.svg',
          height: 20,
        ),
        const SizedBox(width: 8),
        Text(
          getText(i),
          style: AppTypography.bodyTextstyle.copyWith(color: c),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tIndex = ref.watch(aboutProvider).textIndex;
    return Row(
      children: [
        if (tIndex > 1)
          InkWell(
            onTap: () {
              UrlLaunchUtil.launch(getUrl(tIndex));
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
                  top:
                      const BorderSide(width: 2, color: AppColors.primaryColor),
                  bottom:
                      const BorderSide(width: 2, color: AppColors.primaryColor),
                ),
              ),
              child: getRow(
                  tIndex,
                  isHovered
                      ? AppColors.primaryColor
                      : AppColors.secondaryColor),
            ),
          ),
      ],
    );
  }
}
