import 'package:flutter/material.dart';
import 'package:portfolio/about/about.dart';
import 'package:portfolio/contact/contact.dart';
import 'package:portfolio/home/widgets/navbar.dart';
import 'package:portfolio/interestes/interests.dart';
import 'package:portfolio/medium/widgets/article_carousel.dart';
import 'package:portfolio/projects/projects.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../my_flutter/my_flutter.dart';
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
                  flexibleSpace: FlexibleSpaceBar(
                    title: ShowCaseWidget(
                      builder: Builder(
                        builder: (context) => const Navbar(),
                      ),
                    ),
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
    return ListView(
      itemExtent: h - 60,
      cacheExtent: 4 * h,
      children: const [
        AboutView(),
        ProjectsView(),
        MyFlutterView(),
        ArticleCarousel(),
        InterestsView(),
        ContactView(),
      ],
    );
  }
}
