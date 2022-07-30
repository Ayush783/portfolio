import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/widgets/animated_text.dart';
import '../provider/about_view_provider.dart';
import 'about_view_actions.dart';

class AnimatedTextSwitcher extends ConsumerStatefulWidget {
  const AnimatedTextSwitcher({Key? key}) : super(key: key);

  @override
  ConsumerState<AnimatedTextSwitcher> createState() =>
      _AnimatedTextSwitcherState();
}

class _AnimatedTextSwitcherState extends ConsumerState<AnimatedTextSwitcher> {
  late final Timer _timer;
  PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      ref.read(aboutProvider).incrementTextIndex();
      controller.jumpToPage(ref.read(aboutProvider).textIndex);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      children: aboutViewTexts
          .map((e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedText(text: e),
                  const SizedBox(height: 16),
                  const AboutViewActions(),
                ],
              ))
          .toList(),
    );
  }
}

List<String> aboutViewTexts = [
  'I\'m a Flutter enthusiast from India ${String.fromCharCodes([
        55356,
        56814,
        55356,
        56819
      ])}',
  'Currently, I\'m in my 4th year at KIET Group of Institution, pursuing B.Tech in Computer Science and Engineering.',
  'Apart from Flutter, I have worked with HTML, CSS, JS, PYTHON, DJANGO, etc. Here\'s a website I built using Django.',
  'Check out my first Flutter plugin. Do like it and star the repo.',
  'I love reading and writing blogs. Do take a look at my work on Medium.',
  'I\'m craving to work under people who are experts in my field.'
];
