import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/skill_items.dart';
import 'package:portfolio_flutter/widgets/hover_skill_independent.dart';

class SkillIndependent extends StatelessWidget {
  final bool isMobile;
  const SkillIndependent({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      runAlignment: WrapAlignment.center,
      children: skillItems.map((skill) {
        return HoverSkillIndependent(
          title: skill.title,
          imagePath: skill.img,
          isMobile: isMobile,
        );
      }).toList(),
    );
  }
}
