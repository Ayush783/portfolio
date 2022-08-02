import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/interestes/provider/interest_view_provider.dart';
import 'package:portfolio/theme/theme.dart';

import '../widgets/background_pics.dart';
import '../widgets/interest_text_list_view.dart';

class InterestsView extends ConsumerStatefulWidget {
  const InterestsView({Key? key}) : super(key: key);

  @override
  ConsumerState<InterestsView> createState() => _InterestsViewState();
}

class _InterestsViewState extends ConsumerState<InterestsView> {
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
    if ((pos > 2 * h + 120) && !ref.read(ivProvider).onscreen) {
      setState(() {
        ref.read(ivProvider).animatePage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bool onScreen = ref.watch(ivProvider).onscreen;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AnimatedOpacity(
        opacity: onScreen ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
        child: Column(
          children: [
            Text(
              'Things I like',
              style: AppTypography.boldHeadingTextstyle,
            ),
            Text(
              'Apart from Flutter',
              style: AppTypography.boldBodyTextstyle,
            ),
            Expanded(
              child: Stack(
                children: [
                  for (int i = 0; i < 7; i++)
                    BackgroundPic(
                      images[i],
                      waitTime: waitTimes[i],
                      i: i,
                    ),
                  const InterestTextsListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> images = [
  'assets/images/7.png',
  'assets/images/8.png',
  'assets/images/9.png',
  'assets/images/10.png',
  'assets/images/11.png',
  'assets/images/14.png',
  'assets/images/15.png'
];

const waitTimes = [550, 400, 900, 700, 650, 500, 650];
