import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/projects/widget/project_tile.dart';

import '../model/project.dart';

class ProjectsAnimatedSwitcher extends StatefulWidget {
  const ProjectsAnimatedSwitcher({Key? key, required this.projects})
      : super(key: key);

  final List<Project> projects;

  @override
  State<ProjectsAnimatedSwitcher> createState() =>
      _ProjectsAnimatedSwitcherState();
}

class _ProjectsAnimatedSwitcherState extends State<ProjectsAnimatedSwitcher> {
  late Widget _child;
  late final Timer _timer;

  int i = 0;

  @override
  void initState() {
    super.initState();
    _child = ProjectTile(project: widget.projects[i]);
    _timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      i++;
      i %= widget.projects.length;
      _child = ProjectTile(project: widget.projects[i]);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      switchInCurve: Curves.easeIn,
      child: _child,
    );
  }
}
