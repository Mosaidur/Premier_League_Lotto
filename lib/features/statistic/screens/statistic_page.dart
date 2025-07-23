
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  StatisticsPage({super.key});

  final List<Map<String, String>> squadCategories = [
    {'title': 'Squad ASquad ASquad ASquad ASquad ASquad ASquad A'},
    {'title': 'Squad B'},
    {'title': 'Squad C'},
    {'title': 'Squad D'},
  ];

  @override
  Widget build(BuildContext context) {
    double mediaWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Title
          const Text(
            "Premier league stats",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0B3666),
            ),
          ),
          const SizedBox(height: 16),

          /// Squad Cards
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: squadCategories.map((cat) {
              return GestureDetector(
                onTap: () {
                  // Handle tap
                },
                child: SizedBox(
                  width: (mediaWidth - 42) / 2, // 16+16+10 = 42
                  height: 120,
                  child: Stack(
                    children: [
                      /// Background Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/squad_banner.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),

                      /// Center Overlay
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.66),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            cat['title']!,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Color(0xFF0B3666),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      /// Top-right white circle
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.more_horiz,
                            size: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
