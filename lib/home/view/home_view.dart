import 'package:flutter/material.dart';
import 'package:portfolio/about/about.dart';
import 'package:portfolio/home/widgets/navbar.dart';

import '../widgets/background.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          const Background(),
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  backgroundColor: innerBoxIsScrolled
                      ? const Color(0xffe1e1e1)
                      : Colors.transparent,
                  elevation: 0,
                  flexibleSpace: const FlexibleSpaceBar(
                    title: Navbar(),
                    expandedTitleScale: 1,
                    titlePadding: EdgeInsets.zero,
                  ),
                  expandedHeight: 64,
                ),
              ];
            },
            body: const ScrollViewBody(),
            floatHeaderSlivers: true,
          ),
        ],
      ),
    ));
  }
}

class ScrollViewBody extends StatefulWidget {
  const ScrollViewBody({
    Key? key,
  }) : super(key: key);

  @override
  State<ScrollViewBody> createState() => _ScrollViewBodyState();
}

class _ScrollViewBodyState extends State<ScrollViewBody> {
  ScrollController? controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller = PrimaryScrollController.of(context);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        itemExtent: h - 64,
        children: [
          AboutView(),
        ],
      ),
    );
  }
}
