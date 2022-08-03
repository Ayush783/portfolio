import 'package:flutter/material.dart';
import 'package:portfolio/theme/theme.dart';

import '../widgets/mfv_pics.dart';
import '../widgets/mfv_texts.dart';

class MyFlutterView extends StatefulWidget {
  const MyFlutterView({Key? key}) : super(key: key);

  @override
  State<MyFlutterView> createState() => _MyFlutterViewState();
}

class _MyFlutterViewState extends State<MyFlutterView> {
  bool onSCreen = false;
  ScrollNotificationObserver? scrollObserver;

  @override
  void initState() {
    super.initState();
    context
        .findAncestorStateOfType<NestedScrollViewState>()!
        .innerController
        .addListener(() {
      _onScroll(context);
    });
  }

  void _onScroll(BuildContext context) {
    final pos = context
        .findAncestorStateOfType<NestedScrollViewState>()!
        .innerController
        .offset;
    final h = MediaQuery.of(context).size.height;
    if ((pos > h + 60) && !onSCreen) {
      setState(() {
        onSCreen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(20),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        opacity: onSCreen ? 1 : 0,
        child: Column(
          children: [
            Text(
              '${w > 400 ? 'My Contribution To' : 'For'} The Community',
              style: AppTypography.boldHeadingTextstyle.copyWith(
                fontSize: w < 560 ? 24 : 32,
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(child: MFVBody()),
          ],
        ),
      ),
    );
  }
}

class MFVBody extends StatelessWidget {
  const MFVBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w > 900
              ? w / 4
              : w > 580
                  ? w / 6
                  : w > 480
                      ? w / 8
                      : 16,
        ),
        child: Stack(
          children: [
            if (w <= 1100)
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  children: [
                    if (w > 620) const Spacer(),
                    if (w <= 620 && w > 400) SizedBox(width: w / 6),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Expanded(
                            child: Opacity(
                              opacity: 0.35,
                              child: MFVPics(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: MFVTexts(),
                ),
                const SizedBox(width: 16),
                if (w > 1100) const Expanded(child: MFVPics()),
              ],
            ),
          ],
        ),
      );
    });
  }
}
