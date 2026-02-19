import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/size.dart';
import 'package:portfolio_flutter/widgets/about_me_info.dart';

class AboutMe extends StatelessWidget {
  final BoxConstraints constraints;
  final double screenWidth;
  const AboutMe({
    super.key,
    required this.constraints,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      constraints: const BoxConstraints(minHeight: 500),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT SIDE IMAGE
          if (constraints.maxWidth >= kMinDesktopWidth)
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/images/pfp.jpeg",
                  fit: BoxFit.cover,
                  height: 500,
                ),
              ),
            ),

          if (constraints.maxWidth >= kMinDesktopWidth)
            SizedBox(width: screenWidth * 0.04),

          /// RIGHT SIDE CONTENT
          AboutMeInfo(),
        ],
      ),
    );
  }
}
