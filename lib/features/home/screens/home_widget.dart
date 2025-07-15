import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeWidgetsPage extends StatelessWidget {
  HomeWidgetsPage({super.key});
  final controller = Get.put(HomeController());

  final List<String> clubs = [
    'assets/images/club1.png',
    'assets/images/club2.png',
    'assets/images/club3.png',
    'assets/images/club4.png',
    // add more paths
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔷 Top Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png', height: 40),
                Row(
                  children: [
                    _buildButton("Sign In", const Color(0xFF0B3666), Colors.white),
                    const SizedBox(width: 8),
                    _buildButton("Sign Up", Colors.white, const Color(0xFF0B3666),
                        border: true),
                  ],
                )
              ],
            ),
            const SizedBox(height: 24),

            // 🔷 Jackpot text
            const Text(
              "This Week’s Jackpot",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF0B3666),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // 🔷 Jackpot Banner
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/jackpot_banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B3666).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "£1,000,000 Jackpot!",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),

            // 🔷 Countdown (placeholder)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "Countdown: 02:15:30",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // 🔷 Premier League Clubs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Premier League Clubs",
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0B3666),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "See All",
                  style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
                )
              ],
            ),
            const SizedBox(height: 12),

            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: clubs.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => print("Clicked club $index"),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset(clubs[index], height: 60, width: 60),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // 🔷 Match Schedule Card
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF905E26),
                    Color(0xFFF5EC9B),
                    Color(0xFFF5EC9B),
                    Color(0xFF905E26),
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      _teamWidget(
                        'assets/images/team1.png',
                        leftRadius: 50,
                      ),
                      const SizedBox(width: 8),
                      const Text("VS", style: TextStyle(color: Colors.black, fontSize: 16)),
                      const SizedBox(width: 8),
                      _teamWidget(
                        'assets/images/team2.png',
                        rightRadius: 50,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Match Date: 12/07/2025",
                    style: TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0B3666),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text(
                        "Let’s Predict!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor, {bool border = false}) {
    return Container(
      height: 32,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
          side: border
              ? const BorderSide(color: Color(0xFF0B3666))
              : BorderSide.none,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 14),
        ),
      ),
    );
  }

  Widget _teamWidget(String imagePath,
      {double leftRadius = 0, double rightRadius = 0}) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(leftRadius),
            bottomLeft: Radius.circular(leftRadius),
            topRight: Radius.circular(rightRadius),
            bottomRight: Radius.circular(rightRadius),
          ),
          child: Image.asset(
            imagePath,
            height: 60,
            width: 60,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
