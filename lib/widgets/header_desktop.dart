import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/nav_items.dart';
import 'package:portfolio_flutter/styles/style.dart';
import 'package:portfolio_flutter/widgets/main_logo.dart';

class HeaderDesktop extends StatelessWidget {
  final Function(int) onTap;
  const HeaderDesktop({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          MainLogo(onTap: () {}),
          const Spacer(),
          for (int i = 0; i < navTiles.length; i++)
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: TextButton(
                onPressed: () => onTap(i),
                child: Text(
                  navTiles[i],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
