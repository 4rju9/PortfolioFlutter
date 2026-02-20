import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/skill_items.dart';
import 'package:portfolio_flutter/widgets/hover_platform_skill.dart';
import 'package:portfolio_flutter/widgets/skill_independent.dart';

class SkillMobile extends StatefulWidget {
  final bool isMobile;
  const SkillMobile({super.key, required this.isMobile});

  @override
  State<SkillMobile> createState() => _SkillMobileState();
}

class _SkillMobileState extends State<SkillMobile> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Column(
        children: [
          for (int i = 0; i < platformItems.length; i++)
            HoverSkillTile(
              title: platformItems[i].title,
              imagePath: platformItems[i].img,
              width: double.maxFinite,
              isMobile: widget.isMobile,
              margin: 8,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
          const SizedBox(height: 40),
          SkillIndependent(isMobile: widget.isMobile),
        ],
      ),
    );
  }
}
