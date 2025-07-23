import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/bg.dart';

class PlayerStatsInfoPage extends StatelessWidget {
  final String pageTitle;

  PlayerStatsInfoPage({super.key, required this.pageTitle});

  final Map<String, dynamic> playerInfo = {
    'position': '01.', // Forward
    'name': 'Neymar Jr.',
    'club': 'Al-Hilal FC',
    'number': 10,
    'image': 'https://media.gettyimages.com/id/1383543084/photo/madrid-spain-neymar-jr-of-paris-saint-germain-warms-up-prior-to-the-uefa-champions-league.jpg?s=612x612&w=gi&k=20&c=Ig3G9ww5U0lfz7esk3ZR1b-yYjYpI9XHkrQt-nQFXdM=',
  };


  final List<Map<String, dynamic>> playerStats = [
    {
      'position': '02',
      'name': 'Martin Ødegaard',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€80M',
    },
    {
      'position': '02',
      'name': 'Bukayo Saka',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€100M',
    },
    {
      'position': '02',
      'name': 'Gabriel Jesus',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€75M',
    },
    {
      'position': '02',
      'name': 'Ben White',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€55M',
    },
    {
      'position': '02',
      'name': 'William Saliba',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€70M',
    },
    {
      'position': '02',
      'name': 'Declan Rice',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€110M',
    },
    {
      'position': '02',
      'name': 'Kai Havertz',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€65M',
    },
    {
      'position': '02',
      'name': 'Gabriel Martinelli',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€85M',
    },
    {
      'position': '02',
      'name': 'Aaron Ramsdale',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€40M',
    },
    {
      'position': '02',
      'name': 'David Raya',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€35M',
    },
    {
      'position': '02',
      'name': 'Martin Ødegaard',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€80M',
    },
    {
      'position': '02',
      'name': 'Bukayo Saka',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€100M',
    },
    {
      'position': '02',
      'name': 'Gabriel Jesus',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€75M',
    },
    {
      'position': '02',
      'name': 'Ben White',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€55M',
    },
    {
      'position': '02',
      'name': 'William Saliba',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€70M',
    },
    {
      'position': '02',
      'name': 'Declan Rice',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€110M',
    },
    {
      'position': '02',
      'name': 'Kai Havertz',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€65M',
    },
    {
      'position': '02',
      'name': 'Gabriel Martinelli',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€85M',
    },
    {
      'position': '02',
      'name': 'Aaron Ramsdale',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€40M',
    },
    {
      'position': '02',
      'name': 'David Raya',
      'club': 'Arsenal',
      'club_logo': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPNAngc4czu68EnpGBEhk_pjfu0-k5VWwH1g&s',
      'value': '€35M',
    },
  ];


  final LinearGradient gradient = const LinearGradient(
    colors: [
      Color(0xFF905E26),
      Color(0xFFF5EC9B),
      Color(0xFFF5EC9B),
      Color(0xFF905E26),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // const CustomBackground(),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0B3666)),
                    ),
                    Expanded(
                      child: Text(
                        pageTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0B3666),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        /// Main player card
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: gradient,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(playerInfo['position'], style: style24Bold),
                                    Text(playerInfo['name'], style: style24Bold),
                                    Text(playerInfo['club'], style: style24Bold),
                                    const SizedBox(height: 8),
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: const Color(0xFF0B3666),
                                      child: Text(
                                        '${playerInfo['number']}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  playerInfo['image'],
                                  width: 190,
                                  height: 190,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => const Icon(Icons.person, size: 190),
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// Table header
                        Row(
                          children: const [
                            Expanded(child: Text("Position", style: headerStyle)),
                            const SizedBox(width: 5),
                            Expanded(child: Text("Player", style: headerStyle)),
                            const SizedBox(width: 30),
                            Expanded(child: Text("Club", style: headerStyle)),
                            const SizedBox(width: 30),
                            Expanded(child: Text("Value", style: headerStyle)),
                          ],
                        ),

                        const SizedBox(height: 8),

                        /// Player stats table
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: playerStats.map((stat) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(child: Text(stat['position'], style: style14)),
                                    const SizedBox(width: 5),
                                    Expanded(child: Text(stat['name'], style: style14,)),

                                    const SizedBox(width: 30),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Image.network(
                                            stat['club_logo'],
                                            width: 20,
                                            height: 20,
                                            errorBuilder: (_, __, ___) => const Icon(Icons.error, size: 16),
                                          ),
                                          const SizedBox(width: 4),
                                          Flexible(
                                            child: Text(stat['club'], style: style14, overflow: TextOverflow.ellipsis),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const SizedBox(width: 30),

                                    Expanded(child: Text(stat['value'], style: style14)),
                                  ],
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  TextStyle get style16 => const TextStyle(
    color: Color(0xFF0B3666),
    fontSize: 16,
  );

  TextStyle get style24Bold => const TextStyle(
    color: Color(0xFF0B3666),
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const headerStyle = TextStyle(
    color: Color(0xFF0B3666),
    fontSize: 12,
  );

  TextStyle get style14 => const TextStyle(
    color: Color(0xFF0B3666),
    fontSize: 14,
    fontWeight: FontWeight.bold
  );
}
