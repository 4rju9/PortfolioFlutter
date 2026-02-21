import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/constants/nav_items.dart';

class DrawerMobile extends StatelessWidget {
  final Function(int) onTap;
  const DrawerMobile({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30),
              titleTextStyle: const TextStyle(
                fontSize: 16,
                color: CustomColor.whitePrimary,
                fontWeight: FontWeight.w600,
              ),
              leading: Icon(navIcons[i]),
              title: Text(navTiles[i]),
              onTap: () => onTap(i),
            ),
          Padding(
            padding: EdgeInsets.all(20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(CupertinoIcons.xmark),
            ),
          ),
        ],
      ),
    );
  }
}
