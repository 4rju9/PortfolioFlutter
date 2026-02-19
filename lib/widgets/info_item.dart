import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';

Widget infoItem(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        width: 150,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: CustomColor.whitePrimary,
          ),
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: const TextStyle(color: CustomColor.textFieldBg),
        ),
      ),
    ],
  );
}
