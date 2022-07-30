import 'package:flutter/material.dart';
import 'package:portfolio/projects/model/project.dart';
import 'package:portfolio/theme/theme.dart';

import '../widget/project_animated_switcher.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  double getWidthFactor(double maxWidth) {
    if (maxWidth > 1080) {
      return 1 / 4;
    } else if (maxWidth > 720) {
      return 1 / 6;
    } else {
      return 1 / 10;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Container(
      color: AppColors.primaryColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'My Magical Works',
            style: AppTypography.boldHeadingTextstyle.copyWith(
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: w * getWidthFactor(constraints.maxWidth),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ProjectsAnimatedSwitcher(
                        projects: Project.getProjects
                            .sublist(0, constraints.maxWidth > 720 ? 3 : 5),
                      ),
                    ),
                    const SizedBox(width: 20),
                    if (constraints.maxWidth > 720)
                      Expanded(
                        child: ProjectsAnimatedSwitcher(
                          projects: Project.getProjects.sublist(3, 5),
                        ),
                      ),
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
