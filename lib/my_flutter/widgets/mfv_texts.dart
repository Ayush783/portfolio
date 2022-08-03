import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/my_flutter/provider/mfv_provider.dart';
import 'package:portfolio/theme/theme.dart';

import '../../utils/url_launcher_util.dart';

class MFVTexts extends ConsumerStatefulWidget {
  const MFVTexts({Key? key}) : super(key: key);

  @override
  ConsumerState<MFVTexts> createState() => _MFVTextsState();
}

class _MFVTextsState extends ConsumerState<MFVTexts> {
  Timer? _timer;
  bool switchText = false;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 15),
      (timer) {
        setState(() {
          switchText = true;
        });
        Future.delayed(const Duration(milliseconds: 370), () {
          setState(() {
            ref.read(mfvProvider).incrementTIndex();
            switchText = false;
          });
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final i = ref.watch(mfvProvider).tIndex;
    final w = MediaQuery.of(context).size.width;
    return AnimatedPadding(
      duration: const Duration(milliseconds: 370),
      padding: EdgeInsets.only(
        top: switchText ? 32 : 0,
      ),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 370),
        opacity: switchText ? 0 : 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titles[i],
              style: AppTypography.boldHeadingTextstyle2,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            RichText(
              text: TextSpan(
                children: texts[i]
                    .split('*')
                    .map(
                      (e) => TextSpan(
                        text: e,
                        style: texts[i].split('*').indexOf(e) % 2 != 0
                            ? AppTypography.boldBodyTextstyle2.copyWith(
                                fontSize: w < 340 ? 16 : 20,
                              )
                            : AppTypography.bodyTextstyle2.copyWith(
                                fontSize: w < 340 ? 16 : 20,
                              ),
                      ),
                    )
                    .toList(),
                style: AppTypography.bodyTextstyle2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const MFVActions()
          ],
        ),
      ),
    );
  }
}

const List<String> titles = [
  'Flutter Bootcamp 2021',
  'Read SMS Plugin',
  'Blogs',
];

const List<String> texts = [
  'This was a golden opportunity for me to be a *mentor at a big stage*, All thanks to my club - *DSC KIET*.\n\nThis Bootcamp was held in my college between *6th to 11th Dec 2021*. I was grateful to be a part of the team which *trained more than 200 devs* during this event.\n\nWe helped our juniors kickstart their Flutter journey and guided them in making their first mobile app.\n\nTake a look at the resources gathered during the bootcamp.',
  'This is my *first Flutter plugin*. It *currently supports Android* only with IoS support to be launched with further updates.\n\nIt is used for *listening to incoming SMS* on device while the App is running.\n\nHead over to pub.dev and do *like it and star the repo* :)',
  'I love reading and writing articles related with Flutter and other awesom techs!.\n\nI wrote my first blog at an early stage of my Flutter dev Journey and Till now *I\'ve written couple of blogs as an individual* and multiple blogs for a personal initiative i.e. *Dexter Brains*.\n\nI plan on writing more of them till then have a *look at my blogs on Medium*.'
];

const List<String> links = [
  'https://github.com/dsckiet/flutter-bootcamp-2021',
  'https://pub.dev/packages/readsms',
  'https://medium.com/@Ayush_b58',
];

class MFVActions extends ConsumerStatefulWidget {
  const MFVActions({Key? key}) : super(key: key);

  @override
  ConsumerState<MFVActions> createState() => _AboutViewActions();
}

class _AboutViewActions extends ConsumerState<MFVActions> {
  Color color = AppColors.secondaryColor;
  bool isHovered = false;

  String getText(int i) {
    switch (i) {
      case 0:
        return 'Bootcamp';
      case 1:
        return 'Read SMS';
      case 2:
        return 'Medium';
      default:
        throw Exception('Invalid value');
    }
  }

  @override
  Widget build(BuildContext context) {
    final tIndex = ref.watch(mfvProvider).tIndex;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            UrlLaunchUtil.launch(links[tIndex]);
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
            child: Text(
              getText(tIndex),
              style: AppTypography.bodyTextstyle.copyWith(
                color: isHovered
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
