import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/theme/colors.dart';
import 'package:portfolio/theme/theme.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              'Aayush Sharma | Flutter Developer',
              style: AppTypography.boldBodyTextstyle2
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 16),
            NavButton('Github',
                onTap: () {}, hasIcon: true, icon: 'github.svg'),
            NavButton('LinkedIn',
                onTap: () {}, hasIcon: true, icon: 'linkedin.svg'),
            NavButton('Twitter',
                onTap: () {}, hasIcon: true, icon: 'twitter.svg'),
            const Spacer(),
            NavButton(
              'About',
              onTap: () {},
            ),
            NavButton(
              'Projects',
              onTap: () {},
            ),
            NavButton(
              'More',
              onTap: () {},
            ),
            NavButton(
              'Interests',
              onTap: () {},
            ),
            NavButton(
              'Contact',
              onTap: () {},
            ),
          ],
        ),
      );
    });
  }
}

class NavButton extends StatefulWidget {
  const NavButton(this.title,
      {Key? key, required this.onTap, this.hasIcon = false, this.icon})
      : super(key: key);

  final String title;
  final bool hasIcon;
  final String? icon;
  final void Function() onTap;

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  Color btnColor = AppColors.secondaryColor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: InkWell(
        onTap: widget.onTap,
        onHover: (val) {
          if (val) {
            btnColor = AppColors.primaryColor;
          } else {
            btnColor = AppColors.secondaryColor;
          }
          setState(() {});
        },
        child: widget.hasIcon
            ? SvgPicture.asset(
                'assets/icons/${widget.icon!}',
                color: btnColor,
                height: 24,
              )
            : Text(
                widget.title,
                style: AppTypography.bodyTextstyle.copyWith(
                  color: btnColor,
                ),
              ),
      ),
    );
  }
}
