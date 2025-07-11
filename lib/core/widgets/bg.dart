import 'dart:ui';
import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final String backgroundImage;
  final List<Color> gradientColors;
  final double gradientAngle;
  final double blurSigma;

  const CustomBackground({
    super.key,
    this.backgroundImage = 'assets/images/splash_screen.png',
    this.gradientColors = const [
      Color(0xFFB0DFF7),
      Color(0xFF54BBEE),
    ],
    this.gradientAngle = 26,
    this.blurSigma = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
          child: Image.asset(
            backgroundImage,
            fit: BoxFit.cover,
          ),
        ),

        // Gradient overlay
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                transform: GradientRotation(gradientAngle * 3.1416 / 180),
                colors: gradientColors.map((c) => c.withOpacity(0.8)).toList(),
              ),
            ),
          ),
        ),

        // Blur effect
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurSigma,
              sigmaY: blurSigma,
            ),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
      ],
    );
  }
}
