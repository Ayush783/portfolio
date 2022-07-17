import 'package:flutter/material.dart';

import '../widgets/background.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: const [
          Background(),
        ],
      ),
    ));
  }
}
