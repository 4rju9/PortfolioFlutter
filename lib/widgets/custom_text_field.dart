// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final TextEditingController? controller;
  final EdgeInsetsGeometry? contentPadding;
  const CustomTextField({
    super.key,
    this.hintText = "",
    this.maxLines = 1,
    this.controller,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: contentPadding,
      ),
    );
  }
}
