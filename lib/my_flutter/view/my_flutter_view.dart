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
    return Container(
      padding: const EdgeInsets.all(20),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        opacity: onSCreen ? 1 : 0,
        child: Column(
          children: [
            Text(
              'My Contribution To The Community',
              style: AppTypography.boldHeadingTextstyle,
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
        padding: EdgeInsets.symmetric(horizontal: w / 4),
        child: Row(
          children: const [
            Expanded(
              flex: 2,
              child: MFVTexts(),
            ),
            SizedBox(width: 16),
            Expanded(child: MFVPics()),
          ],
        ),
      );
    });
  }
}
