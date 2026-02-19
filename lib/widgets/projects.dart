import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/projects.dart';
import 'package:portfolio_flutter/widgets/project_card.dart';

class Projects extends StatelessWidget {
  final double screenWidth;
  const Projects({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        children: [
          const Text(
            "Personal Projects",
            style: TextStyle(
              fontSize: 24,
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            runAlignment: WrapAlignment.center,
            children: projects
                .map(
                  (project) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProjectCard(project: project),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
