import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/skill_items.dart';
import 'package:portfolio_flutter/widgets/hover_platform_skill.dart';
import 'package:portfolio_flutter/widgets/skill_independent.dart';

class SkillDesktop extends StatefulWidget {
  final bool isMobile;
  const SkillDesktop({super.key, required this.isMobile});

  @override
  State<SkillDesktop> createState() => _SkillDesktopState();
}

class _SkillDesktopState extends State<SkillDesktop> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: platformItems.map((item) {
              return HoverSkillTile(
                title: item.title,
                imagePath: item.img,
                width: 200,
                isMobile: widget.isMobile,
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 35),
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: SkillIndependent(isMobile: widget.isMobile),
          ),
        ),
      ],
    );
  }
}
