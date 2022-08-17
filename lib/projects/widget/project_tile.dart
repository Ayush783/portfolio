import 'package:flutter/material.dart';
import 'package:portfolio/projects/widget/project_action_button.dart';

import '../../theme/theme.dart';
import '../model/project.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xfff1f1f1),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Semantics(
                image: true,
                label: 'AAYUSH SHARMA | FLUTTER DEVELOPER IMAGE',
                child: Image.asset(
                  project.imgUrl,
                  width: constraints.maxWidth,
                ),
              );
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Semantics(
                    label: project.title,
                    child: Text(
                      project.title,
                      style: AppTypography.boldBodyTextstyle2
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          project.desc,
                          style: AppTypography.bodyTextstyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
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
                                    hint: 'Tap to open source code page',
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
          )
        ],
      ),
    );
  }
}
