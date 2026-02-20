import 'package:flutter/material.dart';
import 'package:portfolio_flutter/constants/colors.dart';
import 'package:portfolio_flutter/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arjun Gangwar',
      theme: _appTheme,
      home: const HomePage(),
    );
  }
}

final _border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: const BorderSide(color: CustomColor.purple, width: 1.5),
);

final _appTheme = ThemeData.dark().copyWith(
  inputDecorationTheme: InputDecorationThemeData(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    filled: true,
    fillColor: CustomColor.scaffoldBg,
    focusedBorder: _border,
    enabledBorder: _border,
    border: _border,
    errorBorder: _border,
  ),
);
