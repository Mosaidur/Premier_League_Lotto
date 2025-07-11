import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_screen.png',
              fit: BoxFit.cover,
            ),
          ),

          // Positioned Circular Container
          Positioned(
            left: -205,
            top: -538,
            child: Container(
              height: 786,
              width: 786,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF).withOpacity(0.46),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Positioned(
            top: 20, // adjust as needed
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/logo_1.png',
              width: 133,
              height: 143,
            ),
          ),
          Positioned(
            top: 133, // adjust as needed
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/logo_2.png',
                  width: 257,
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}
