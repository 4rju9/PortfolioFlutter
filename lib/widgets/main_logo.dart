import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';

class MainLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const MainLogo({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        "Arjun Gangwar",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: CustomColor.purple,
        ),
      ),
    );
  }
}
