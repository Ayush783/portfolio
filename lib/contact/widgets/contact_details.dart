import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utils/url_launcher_util.dart';

class ContactDetails extends StatelessWidget {
  const ContactDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Reach Out to me',
          style: AppTypography.boldHeadingTextstyle,
        ),
        const SizedBox(height: 16),
        for (int i = 0; i < 4; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: LinkText(
              text: texts[i],
              icon: icons[i],
              url: urls[i],
            ),
          ),
      ],
    );
  }
}

const List<String> texts = [
  'aayush9778@gmail.com',
  '@Auysh783',
  '@ayushb58',
  '@Ayush_b5',
];

const List<String> icons = [
  'contact',
  'github',
  'linkedin',
  'twitter',
];

const List<String> urls = [
  'mailto:aayush9778@gmail.com',
  'https://github.com/Ayush783',
  'https://www.linkedin.com/in/ayushb58/',
  'https://twitter.com/Ayush_b5',
];

class LinkText extends StatefulWidget {
  const LinkText({
    Key? key,
    required this.text,
    required this.icon,
    required this.url,
  }) : super(key: key);

  final String text;
  final String icon;
  final String url;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/icons/${widget.icon}.svg',
          height: 18,
          color: isHovered ? AppColors.primaryColor : AppColors.secondaryColor,
        ),
        const SizedBox(width: 8),
        InkWell(
          onTap: () {
            UrlLaunchUtil.launch(widget.url);
          },
          onHover: (val) {
            setState(() {
              isHovered = val;
            });
          },
          child: Text(
            widget.text,
            style: AppTypography.boldBodyTextstyle.copyWith(
              color:
                  isHovered ? AppColors.primaryColor : AppColors.secondaryColor,
              decoration:
                  isHovered ? TextDecoration.underline : TextDecoration.none,
            ),
          ),
        ),
      ],
    );
  }
}
