import 'package:flutter/material.dart';
import 'package:portfolio/utils/extension.dart';

class AnimatedComponent {
  static Widget ring() => const RingComponent();
}

class RingComponent extends StatefulWidget {
  const RingComponent({Key? key}) : super(key: key);

  @override
  State<RingComponent> createState() => _RingComponentState();
}

class _RingComponentState extends State<RingComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.getResponsiveWidth(context),
      height: 180.getResponsiveWidth(context),
      color: Colors.pink,
    );
  }
}

class _DiamondComponent extends StatefulWidget {
  const _DiamondComponent({Key? key}) : super(key: key);

  @override
  State<_DiamondComponent> createState() => __DiamondComponentState();
}

class __DiamondComponentState extends State<_DiamondComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _LinesComponent extends StatefulWidget {
  const _LinesComponent({Key? key}) : super(key: key);

  @override
  State<_LinesComponent> createState() => __LinesComponentState();
}

class __LinesComponentState extends State<_LinesComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _SquareComponent extends StatefulWidget {
  const _SquareComponent({Key? key}) : super(key: key);

  @override
  State<_SquareComponent> createState() => __SquareComponentState();
}

class __SquareComponentState extends State<_SquareComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _CircleComponent extends StatefulWidget {
  const _CircleComponent({Key? key}) : super(key: key);

  @override
  State<_CircleComponent> createState() => __CircleComponentState();
}

class __CircleComponentState extends State<_CircleComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
