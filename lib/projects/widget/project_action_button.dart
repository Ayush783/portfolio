import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/utils/firebase_analytics_service.dart';
import '../../theme/theme.dart';
import '../../utils/url_launcher_util.dart';

class ProjectActionButton extends StatefulWidget {
  const ProjectActionButton({
    Key? key,
    required this.text,
    required this.url,
    required this.icon,
  }) : super(key: key);

  final String text;
  final String url;
  final String icon;

  @override
  State<ProjectActionButton> createState() => _ProjectActionButtonState();
}

class _ProjectActionButtonState extends State<ProjectActionButton> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FirebaseAnalyticsService.logEvents(
            'Opened Project ${widget.text} ${widget.url}');
        UrlLaunchUtil.launch(widget.url);
      },
      onHover: (val) {
        setState(() {
          isHovered = val;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          // color: Colors.transparent,
          border: Border.all(
            color: const Color(0xfff1f1f1),
            width: 1.5,
          ),
          gradient: LinearGradient(
            colors: const [
              Color(0xfff1f1f1),
              Color(0xfff1f1f1),
            ],
            tileMode: TileMode.decal,
            end: isHovered ? Alignment.bottomRight : Alignment.centerLeft,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              widget.icon,
              width: 18,
              color:
                  isHovered ? AppColors.primaryColor : const Color(0xfff1f1f1),
            ),
            const SizedBox(width: 4),
            Text(
              widget.text,
              style: AppTypography.boldBodyTextstyle.copyWith(
                color: isHovered
                    ? AppColors.primaryColor
                    : const Color(0xfff1f1f1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
