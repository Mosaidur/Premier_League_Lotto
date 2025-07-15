import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportolotto/routes/app_routes.dart';

import '../../../core/widgets/bg.dart';

class HowToPlayPage extends StatelessWidget {
  HowToPlayPage({super.key});

  final List<Map<String, String>> steps = [
    {
      "title": "Step 1: It’s Just £2.50 to Play",
      "subtitle": "Want to take a shot at winning at least £1 million? All you need to do is pay £2.50 per entry. No complicated fees — just £2.50 and you’re in the game.",
    },
    {
      "title": "Step 2: Predict the Scores",
      "subtitle": "Every week, there are 10 Premier League matches. All you need to do is guess 8 or more scores correctly!",
    },
    {
      "title": "Step 3: Win the Jackpot",
      "subtitle": "If you nail 8 or more correct scores, you’ll win the jackpot! And we’re not talking small change here — the minimum jackpot is £1 million each week. If no one wins, the jackpot rolls over to the next week and keeps growing!",
    },
    {
      "title": "Step 4: Multiple Winners? No Problem",
      "subtitle": "If more than one person gets 8 or more correct, the jackpot gets split evenly.",
    },
    {
      "title": "Step 5: Bigger Jackpots Every Week",
      "subtitle": "The jackpot keeps growing the more tickets we sell. More tickets = bigger prizes. The more you play, the bigger the potential pot!",
    },
    {
      "title": "Step 6: No Winner? No Worries",
      "subtitle": "If no one wins on any given week, the jackpot rolls over and keeps growing until someone wins! Meaning next week’s prize could be even bigger. The longer it takes, the bigger the pot!",
    },
    {
      "title": "Step 7: Claiming Your Prize",
      "subtitle": "If you’re lucky enough to win, we’ll get in touch with you to make sure you claim your prize.",
    },
    {
      "title": "Step 8: The Small Print",
      "subtitle": "By entering, you’re agreeing to the full terms and conditions. Don’t worry — they’re simple and ensure everyone plays fair.",
    },
    {
      "title": "Step 9: Play Responsibly",
      "subtitle": "We want you to have fun, so please play responsibly. Need support? We’ve got you covered. Check out: https://www.responsiblegambling.org for help and advice.",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        children: [

          CustomBackground(),

        Positioned.fill(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "How To Play",
                  style: const TextStyle(
                    fontSize: 24,
                    color: Color(0xFF0B3666),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Welcome to the Premier League Score \nPrediction Jackpot – Here's how to play:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 24),

                // Wrap of reusable containers
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: steps
                      .map(
                        (step) => InfoContainer(
                      title: step['title']!,
                      subtitle: step['subtitle']!,
                    ),
                  )
                      .toList(),
                ),

                const SizedBox(height: 24),

                const Text(
                  "Ready to take your football predictions to the next level and possibly win a life-changing prize? Enter now for just £2.50 and start predicting the scores!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 24),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Image.asset(
                //       'assets/images/football.png',
                //       width: 80,
                //       height: 80,
                //     ),
                //     const SizedBox(width: 20),
                //     Image.asset(
                //       'assets/images/trophy.png',
                //       width: 80,
                //       height: 80,
                //     ),
                //   ],
                // ),

                const SizedBox(height: 32),

                // Gradient Button
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF905E26),
                          Color(0xFFF5EC9B),
                          Color(0xFFF5EC9B),
                          Color(0xFF905E26),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.home);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Ready To Play",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ), ]
      ),
    );
  }
}

// 📄 Reusable InfoContainer widget
class InfoContainer extends StatelessWidget {
  final String title;
  final String subtitle;

  const InfoContainer({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.4), // 40% white
        border: Border.all(
          color: const Color(0xFF0099E5), // blue border
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF004060),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Color(0xFF004060),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
