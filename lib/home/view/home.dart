import 'package:flutter/material.dart';

import '../widgets/retro_background.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: RetroBackground(),
    ));
  }
}
