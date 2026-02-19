import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/styles/style.dart';
import 'package:portfolio_flutter/widgets/main_logo.dart';

class HeaderMobile extends StatelessWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  const HeaderMobile({super.key, this.onLogoTap, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          MainLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(
            onPressed: onMenuTap,
            icon: const Icon(CupertinoIcons.line_horizontal_3),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}
