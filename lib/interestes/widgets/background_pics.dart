import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/interestes/provider/interest_view_provider.dart';

class BackgroundPic extends ConsumerStatefulWidget {
  const BackgroundPic(
    this.img, {
    Key? key,
    this.waitTime = 0,
    this.i,
  }) : super(key: key);

  final String img;
  final int waitTime;
  final int? i;

  @override
  ConsumerState<BackgroundPic> createState() => _BackgroundPicState();
}

class _BackgroundPicState extends ConsumerState<BackgroundPic> {
  bool animate = false;
  final double scale = 0.8 + Random().nextDouble() * 0.5;

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
      left: cordinates(context)[widget.i!][0],
      top: cordinates(context)[widget.i!][1],
      child: AnimatedScale(
        scale: animate ? scale : 0,
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
  } else if (w > 430) {
    return 0.6;
  } else {
    return 0.55;
  }
}

List<List<double>> cordinates(BuildContext context) {
  final w = MediaQuery.of(context).size.width;
  final h = MediaQuery.of(context).size.height;

  return [
    [32, 0],
    [w / 4 + (w > 540 ? 60 : 0), h / 5],
    [w / 2, 32],
    [3 * w / 4, h / 2.5],
    [w / 6 - (w < 540 ? 60 : 0), h / 2.7],
    [w / 2 - 60, h / 2],
    [3 * w / 4 + (w > 700 ? 60 : 0), 0],
  ];
}
