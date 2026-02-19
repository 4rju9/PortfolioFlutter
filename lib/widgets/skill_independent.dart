import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/skill_items.dart';

class SkillIndependent extends StatelessWidget {
  const SkillIndependent({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      runAlignment: WrapAlignment.center,
      children: skillItems
          .map(
            (skill) => Chip(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              label: Text(skill.title),
              avatar: Image.asset(skill.img),
              backgroundColor: CustomColor.bgLight2,
            ),
          )
          .toList(),
    );
  }
}
