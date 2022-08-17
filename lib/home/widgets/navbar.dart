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

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Semantics(
              label: 'AAYUSH SHARMA | FLUTTER DEVELOPER',
              child: Text(
                'Aayush Sharma ${constraints.maxWidth > 660 ? '| Flutter Developer' : ''}',
                style: AppTypography.boldBodyTextstyle2
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            const SizedBox(width: 16),
            if (constraints.maxWidth > 800)
              Semantics(
                button: true,
                label: 'Github',
                link: true,
                hint: 'Tap to launch github user page',
                child: NavButton('Github', onTap: () {
                  UrlLaunchUtil.launch('https://github.com/Ayush783/');
                }, hasIcon: true, icon: 'github.svg'),
              ),
            if (constraints.maxWidth > 800)
              Semantics(
                button: true,
                label: 'Linkedin',
                link: true,
                hint: 'Tap to launch Linkedin user page',
                child: NavButton('LinkedIn', onTap: () {
                  UrlLaunchUtil.launch('https://www.linkedin.com/in/ayushb58/');
                }, hasIcon: true, icon: 'linkedin.svg'),
              ),
            if (constraints.maxWidth > 800)
              Semantics(
                button: true,
                label: 'Twitter',
                link: true,
                hint: 'Tap to launch Twitter user page',
                child: NavButton('Twitter', onTap: () {
                  UrlLaunchUtil.launch('https://twitter.com/Ayush_b5');
                }, hasIcon: true, icon: 'twitter.svg'),
              ),
            const Spacer(),
            if (constraints.maxWidth > 520)
              Semantics(
                button: true,
                label: 'AAYUSH SHARMA | FLUTTER DEVELOPER ABOUT BUTTON',
                hint: 'Tap to scroll to about section',
                child: NavButton(
                  'About',
                  onTap: () {
                    scrollBody(-64, controller!);
                  },
                ),
              ),
            if (constraints.maxWidth > 520)
              Semantics(
                button: true,
                label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Project BUTTON',
                hint: 'Tap to scroll to Project section',
                child: NavButton(
                  'Projects',
                  onTap: () {
                    scrollBody(h - 60 - 60, controller!);
                  },
                ),
              ),
            if (constraints.maxWidth > 520)
              Semantics(
                button: true,
                label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Flutter BUTTON',
                hint: 'Tap to scroll to Flutter section',
                child: NavButton(
                  'Flutter',
                  onTap: () {
                    scrollBody(2 * (h - 60) - 56, controller!);
                  },
                ),
              ),
            if (constraints.maxWidth > 520)
              Semantics(
                button: true,
                label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Interests BUTTON',
                hint: 'Tap to scroll to Interests section',
                child: NavButton(
                  'Interests',
                  onTap: () {
                    scrollBody(3 * (h - 60) - 56, controller!);
                  },
                ),
              ),
            if (constraints.maxWidth > 520)
              Semantics(
                button: true,
                label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Contact BUTTON',
                hint: 'Tap to scroll to Contact section',
                child: NavButton(
                  'Contact',
                  onTap: () {
                    scrollBody(4 * (h - 60) - 56, controller!);
                  },
                ),
              ),
            if (constraints.maxWidth <= 520)
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) => MobileNavDialog(controller: controller!),
                  );
                },
                child: SvgPicture.asset(
                  'assets/icons/menu.svg',
                  height: 24,
                  color: AppColors.primaryColor,
                ),
              )
          ],
        ),
      );
    });
  }
}

void scrollBody(double h, ScrollController controller) {
  controller.animateTo(
    h,
    duration: const Duration(milliseconds: 370),
    curve: Curves.easeOut,
  );
}

class MobileNavDialog extends StatelessWidget {
  const MobileNavDialog({Key? key, required this.controller}) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      elevation: 0,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
              height: h,
              width: double.infinity,
            ),
          ),
          Positioned(
            right: 16,
            top: 56,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(4)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Semantics(
                    button: true,
                    label: 'AAYUSH SHARMA | FLUTTER DEVELOPER ABOUT BUTTON',
                    hint: 'Tap to scroll to about section',
                    child: NavButton(
                      'About',
                      onTap: () {
                        Navigator.pop(context);
                        scrollBody(-64, controller);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    button: true,
                    label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Projects BUTTON',
                    hint: 'Tap to scroll to Projects section',
                    child: NavButton(
                      'Projects',
                      onTap: () {
                        Navigator.pop(context);
                        scrollBody(h - 60 - 60, controller);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    button: true,
                    label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Flutter BUTTON',
                    hint: 'Tap to scroll to Flutter section',
                    child: NavButton(
                      'Flutter',
                      onTap: () {
                        Navigator.pop(context);
                        scrollBody(2 * (h - 60) - 56, controller);
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Semantics(
                    button: true,
                    label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Interests BUTTON',
                    hint: 'Tap to scroll to Interests section',
                    child: NavButton(
                      'Interests',
                      onTap: () {
                        Navigator.pop(context);
                        scrollBody(3 * (h - 60) - 56, controller);
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  Semantics(
                    button: true,
                    label: 'AAYUSH SHARMA | FLUTTER DEVELOPER Contact BUTTON',
                    hint: 'Tap to scroll to Contact section',
                    child: NavButton(
                      'Contact',
                      onTap: () {
                        Navigator.pop(context);
                        scrollBody(4 * (h - 60) - 56, controller);
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Semantics(
                        button: true,
                        label: 'Github',
                        link: true,
                        hint: 'Tap to launch github user page',
                        child: NavButton('Github', onTap: () {
                          UrlLaunchUtil.launch('https://github.com/Ayush783/');
                        }, hasIcon: true, icon: 'github.svg'),
                      ),
                      const SizedBox(width: 12),
                      Semantics(
                        button: true,
                        label: 'Linkedin',
                        link: true,
                        hint: 'Tap to launch Linkedin user page',
                        child: NavButton('LinkedIn', onTap: () {
                          UrlLaunchUtil.launch(
                              'https://www.linkedin.com/in/ayushb58/');
                        }, hasIcon: true, icon: 'linkedin.svg'),
                      ),
                      const SizedBox(width: 12),
                      Semantics(
                        button: true,
                        label: 'Twitter',
                        link: true,
                        hint: 'Tap to launch Twitter user page',
                        child: NavButton('Twitter', onTap: () {
                          UrlLaunchUtil.launch('https://twitter.com/Ayush_b5');
                        }, hasIcon: true, icon: 'twitter.svg'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
