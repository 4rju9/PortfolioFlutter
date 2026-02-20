import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/size.dart';
import 'package:portfolio_flutter/widgets/skill_desktop.dart';
import 'package:portfolio_flutter/widgets/skill_mobile.dart';

class Skills extends StatelessWidget {
  final double screenWidth;
  const Skills({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      color: CustomColor.bgLight1,
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "What I can do",
            style: TextStyle(
              fontSize: 24,
              color: CustomColor.whitePrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          (screenWidth >= kMedDesktopWidth)
              ? SkillDesktop(isMobile: (screenWidth >= kMinDesktopWidth))
              : SkillMobile(isMobile: (screenWidth >= kMinDesktopWidth)),
        ],
      ),
    );
  }
}
