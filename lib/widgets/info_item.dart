import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/utils/url_opener.dart';

Widget infoItem({
  required String title,
  required String value,
  bool clickable = false,
  String url = "",
}) {
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
        child: GestureDetector(
          onTap: () => openUrl(url),
          child: Text(
            value,
            style: const TextStyle(color: CustomColor.textFieldBg),
          ),
        ),
      ),
    ],
  );
}
