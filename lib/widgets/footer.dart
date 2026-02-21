import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: Text(
        "Made with ❤️ by Arjun Gangwar.",
        style: TextStyle(
          fontSize: 12,
          color: CustomColor.purple,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
