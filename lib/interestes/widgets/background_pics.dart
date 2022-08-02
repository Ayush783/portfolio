import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/interestes/provider/interest_view_provider.dart';
import 'package:portfolio/theme/theme.dart';

class BackgroundPic extends ConsumerStatefulWidget {
  const BackgroundPic(
    this.img, {
    Key? key,
    required this.xy,
    this.waitTime = 0,
    this.i,
  }) : super(key: key);

  final String img;
  final List<double> xy;
  final int waitTime;
  final int? i;

  @override
  ConsumerState<BackgroundPic> createState() => _BackgroundPicState();
}

class _BackgroundPicState extends ConsumerState<BackgroundPic> {
  bool animate = false;

  @override
  void initState() {
    super.initState();
  }

  double getScale() {
    return 0.8 + Random().nextDouble() * 0.5;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    ref.listen<IVNotifier>(ivProvider, (previous, next) {
      if (previous!.onscreen || next.onscreen) {
        if (animate == false) {
          Future.delayed(Duration(milliseconds: widget.waitTime), () {
            setState(() {
              animate = true;
            });
          });
        }
      }
    });
    return Positioned(
      left: widget.xy[0],
      top: widget.xy[1],
      child: AnimatedScale(
        scale: animate ? getScale() : 0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.bounceInOut,
        child: Opacity(
          opacity: 0.45,
          child: Image.asset(
            widget.img,
            height: h / 3 * getWidthFactor(context),
            cacheHeight: h ~/ 3 + 1,
          ),
        ),
      ),
    );
  }
}

double getWidthFactor(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  if (w > 1280) {
    return 1;
  } else if (w > 720) {
    return 0.8;
  } else {
    return 0.6;
  }
}
