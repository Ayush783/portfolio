import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/my_flutter/provider/mfv_provider.dart';

class MFVPics extends ConsumerStatefulWidget {
  const MFVPics({Key? key}) : super(key: key);

  @override
  ConsumerState<MFVPics> createState() => _MFVPicsState();
}

class _MFVPicsState extends ConsumerState<MFVPics> {
  bool popping = false;
  bool pushing = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        ref.read(mfvProvider).popAndPush();
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
    final widgets = ref.watch(mfvProvider).picCards;
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.only(top: constraints.maxHeight / 8 - 60),
        child: Stack(
          clipBehavior: Clip.none,
          children: widgets,
        ),
      );
    });
  }
}

class PicCard extends ConsumerWidget {
  const PicCard(this.img, {Key? key, required this.id}) : super(key: key);

  final String img;
  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int pIndex = ref.watch(mfvProvider).picIndex;
    bool isPopping = ref.watch(mfvProvider).pop;
    bool isPushing = ref.watch(mfvProvider).push;
    final int bottomId = ref.watch(mfvProvider).bottomId;
    final h = MediaQuery.of(context).size.height;

    return AnimatedPositioned(
      top: id - pIndex < -1
          ? (id - pIndex + 6) * 16
          : id - pIndex > -1
              ? (id - pIndex) * 16
              : id == bottomId
                  ? (id - pIndex + 6) * 16
                  : (id - pIndex) * 16,
      left: id - pIndex < -1
          ? (id - pIndex + 6) * 12
          : id - pIndex > -1
              ? (id - pIndex) * 12
              : id == bottomId
                  ? (id - pIndex + 6) * 12
                  : (id - pIndex) * 12,
      duration: const Duration(milliseconds: 370),
      child: AnimatedOpacity(
        opacity: id - pIndex == -1
            ? id == bottomId
                ? isPushing
                    ? 0
                    : 1
                : isPopping
                    ? 0
                    : 1
            : 1,
        duration: const Duration(milliseconds: 370),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 8, color: Colors.white),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, 4),
                  blurRadius: 22,
                  color: Colors.black.withOpacity(0.25),
                ),
              ]),
          child: Image.asset(
            img,
            height: h / 2,
            width: h / 2,
            cacheHeight: h ~/ 2,
            cacheWidth: h ~/ 2,
            gaplessPlayback: true,
          ),
        ),
      ),
    );
  }
}
