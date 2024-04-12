import 'package:flutter/material.dart';
import 'package:portfolio/projects/model/project.dart';
import 'package:portfolio/projects/widget/project_carousel.dart';
import 'package:portfolio/theme/theme.dart';

class ProjectsView extends StatelessWidget {
  const ProjectsView({Key? key}) : super(key: key);

  double getWidthFactor(double maxWidth) {
    if (maxWidth > 1080) {
      return 1 / 16;
    } else if (maxWidth > 720) {
      return 1 / 16;
    } else {
      return 1 / 16;
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return Semantics(
      label: 'AAYUSH SHARMA | FLUTTER DEVELOPER PROJECTS PAGE',
      child: Container(
        color: AppColors.primaryColor,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Semantics(
              label: 'MY MAGICAL WORKS',
              child: Text(
                'My Magical Works',
                style: AppTypography.boldHeadingTextstyle.copyWith(
                  color: Colors.white,
                ),
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
                        child: ProjectCarousel(
                          projects: Project.getProjects,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
