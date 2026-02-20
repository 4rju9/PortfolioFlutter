import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/skill_items.dart';
import 'package:portfolio_flutter/widgets/skill_independent.dart';

class SkillDesktop extends StatelessWidget {
  const SkillDesktop({super.key});

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
            children: platformItems
                .map(
                  (platform) => Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: CustomColor.bgLight2,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      leading: Image.asset(platform.img, width: 26),
                      title: Text(platform.title),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(width: 35),
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: const SkillIndependent(),
          ),
        ),
      ],
    );
  }
}
