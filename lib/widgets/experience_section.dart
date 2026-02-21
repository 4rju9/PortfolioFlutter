import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/experience.dart';
import 'package:portfolio_flutter/constants/size.dart';

class ExperienceSection extends StatelessWidget {
  final double screenWidth;
  const ExperienceSection({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = screenWidth >= kMinDesktopWidth;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 20,
        bottom: 10,
        left: (isDesktop) ? 30 : 15,
        right: 30,
      ),
      child: Column(
        children: [
          const Text(
            "Experience",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
              experiences.length,
              (index) => _ExperienceItem(
                experience: experiences[index],
                isDesktop: isDesktop,
                isLast: index == experiences.length - 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceItem extends StatelessWidget {
  final Experience experience;
  final bool isDesktop;
  final bool isLast;

  const _ExperienceItem({
    required this.experience,
    required this.isDesktop,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (isDesktop)
            Expanded(flex: 2, child: getCompanyColumnDesktop(experience)),

          SizedBox(
            width: (isDesktop) ? 60 : 30,
            child: Column(
              children: [
                Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: experience.dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: Colors.grey.shade400),
                  ),
              ],
            ),
          ),

          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (isDesktop)
                    ? Text(
                        experience.role,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : getCompanyColumnMobile(experience),
                const SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: experience.description.asMap().entries.map((entry) {
                    final index = entry.key;
                    final content = entry.value;

                    final isLast = index == experience.description.length - 1;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            content,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                        if (!isLast)
                          Divider(color: Colors.grey.shade700, thickness: 0.5),
                      ],
                    );
                  }).toList(),
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget getCompanyColumnDesktop(Experience experience) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        experience.company,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Text(
        experience.place,
        style: const TextStyle(
          fontSize: 18,
          color: CustomColor.whiteSecondary,
          fontWeight: FontWeight.w400,
        ),
      ),
      const SizedBox(height: 8),
      Text(experience.duration, style: const TextStyle(color: Colors.grey)),
    ],
  );
}

Widget getCompanyColumnMobile(Experience experience) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Expanded(
            child: Text(
              experience.role,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            experience.duration,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          Expanded(
            child: Text(
              experience.company,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            experience.place,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    ],
  );
}
