import 'package:flutter/material.dart';

abstract class AppColors {
  static const grey = Color(0xFF897B6B);
  static const ivory = Color(0xFFE2D0B7);

  static const yellow = Color(0xFFFFC93C);

  static const lightBrown = Color(0xFF9E8756);
  static const darkBrown = Color(0xFF332A25);

  static const gradientBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF100B0C),
      Color(0xFF4B3C30),
    ],
  );
}
