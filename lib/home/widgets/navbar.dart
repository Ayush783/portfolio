import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/theme/theme.dart';
import 'package:portfolio/utils/url_launcher_util.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  ScrollController? controller;

  @override
  void initState() {
    super.initState();
    controller = context
        .findAncestorStateOfType<NestedScrollViewState>()!
        .innerController;
  }

  void scrollBody(double h) {
    controller?.animateTo(
      h,
      duration: const Duration(milliseconds: 370),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
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
            NavButton('Github', onTap: () {
              UrlLaunchUtil.launch('https://github.com/Ayush783/');
            }, hasIcon: true, icon: 'github.svg'),
            NavButton('LinkedIn', onTap: () {
              UrlLaunchUtil.launch('https://www.linkedin.com/in/ayushb58/');
            }, hasIcon: true, icon: 'linkedin.svg'),
            NavButton('Twitter', onTap: () {
              UrlLaunchUtil.launch('https://twitter.com/Ayush_b5');
            }, hasIcon: true, icon: 'twitter.svg'),
            const Spacer(),
            NavButton(
              'About',
              onTap: () {
                scrollBody(-64);
              },
            ),
            NavButton(
              'Projects',
              onTap: () {
                scrollBody(h - 60 - 60);
              },
            ),
            NavButton(
              'Flutter',
              onTap: () {
                scrollBody(2 * (h - 60) - 56);
              },
            ),
            NavButton(
              'Interests',
              onTap: () {
                scrollBody(3 * (h - 60) - 56);
              },
            ),
            NavButton(
              'Contact',
              onTap: () {
                scrollBody(4 * (h - 60) - 56);
              },
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
