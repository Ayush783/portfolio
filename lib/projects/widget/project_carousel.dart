import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:portfolio/projects/model/project.dart';
import 'package:portfolio/projects/widget/project_action_button.dart';
import 'package:portfolio/projects/widget/project_carousel_indicators.dart';
import 'package:portfolio/theme/typography.dart';

class ProjectCarousel extends StatefulWidget {
  const ProjectCarousel({
    super.key,
    required this.projects,
  });

  final List<Project> projects;

  @override
  State<ProjectCarousel> createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<ProjectCarousel> {
  final PageController _pageController = PageController();
  Timer? _timer;
  @override
  void initState() {
    initCarouselTimer();
    super.initState();
  }

  initCarouselTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onHorizontalDragStart: (details) => _timer?.cancel(),
      onHorizontalDragEnd: (details) => initCarouselTimer(),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemBuilder: (context, index) {
                final project = widget.projects[index % widget.projects.length];
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            project.title,
                            style: AppTypography.boldBodyTextstyle2
                                .copyWith(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          if (size.width < 600)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                clipBehavior: Clip.hardEdge,
                                child: Image.asset(
                                  project.imgUrl,
                                  width: size.width * 0.65,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              project.desc,
                              style: AppTypography.bodyTextstyle.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 48),
                          LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth > 260) {
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Semantics(
                                        button: true,
                                        label: 'Source link button',
                                        hint: 'Tap to open source code page',
                                        child: ProjectActionButton(
                                          text: 'Src',
                                          url: project.linkToSrc,
                                          icon: 'assets/icons/github.svg',
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    if (project.hasDemo)
                                      Expanded(
                                        child: Semantics(
                                          button: true,
                                          label: 'Demo link button',
                                          hint: 'Tap to open Demo page',
                                          child: ProjectActionButton(
                                            text: 'Demo',
                                            url: project.linkToDemo,
                                            icon: 'assets/icons/code.svg',
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              } else {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Semantics(
                                            button: true,
                                            label: 'Source link button',
                                            hint:
                                                'Tap to open source code page',
                                            child: ProjectActionButton(
                                              text: 'Src',
                                              url: project.linkToSrc,
                                              icon: 'assets/icons/github.svg',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 12),
                                    if (project.hasDemo)
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Semantics(
                                              button: true,
                                              label: 'Demo link button',
                                              hint: 'Tap to open Demo page',
                                              child: ProjectActionButton(
                                                text: 'Demo',
                                                url: project.linkToDemo,
                                                icon: 'assets/icons/code.svg',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                  ],
                                );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    if (size.width >= 600)
                      Expanded(
                        flex: 1,
                        child: Semantics(
                          image: true,
                          label: 'AAYUSH SHARMA | FLUTTER DEVELOPER IMAGE',
                          child: LayoutBuilder(builder: (context, constraints) {
                            log('maxWidth ${constraints.maxWidth}');
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: constraints.maxWidth > 300
                                      ? constraints.maxWidth > 430
                                          ? constraints.maxWidth > 540
                                              ? constraints.maxWidth > 650
                                                  ? 150
                                                  : 120
                                              : 90
                                          : 60
                                      : 32),
                              child: Transform(
                                transform: Matrix4.identity()
                                  ..setEntry(3, 0, -0.0003),
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(4, 0),
                                        blurRadius: 12,
                                        color: Colors.black.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      project.imgUrl,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      )
                  ],
                );
              },
            ),
          ),
          ProjectCarouselIndicators(
            length: widget.projects.length,
            pageController: _pageController,
            onTap: (index) {
              _timer?.cancel();
              _pageController.jumpToPage(index);
              initCarouselTimer();
            },
          ),
        ],
      ),
    );
  }
}
