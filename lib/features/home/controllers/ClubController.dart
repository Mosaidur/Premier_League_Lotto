import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ClubController extends GetxController {
  var selectedIndex = 0.obs;

  final tabs = [
    'Overview',
    'Squad',
    'Team Stats',
    'Player Stats',
  ];

  final gradient = const LinearGradient(
    colors: [
      Color(0xFF905E26),
      Color(0xFFF5EC9B),
      Color(0xFFF5EC9B),
      Color(0xFF905E26),
    ],
  );
}
