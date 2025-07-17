import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class SquadPage extends StatelessWidget {
  SquadPage({super.key});

  final RxString selectedSeason = '2024/25'.obs;

  final List<String> seasons = [
    '2024/25',
    '2023/24',
    '2022/23',
  ];

  final squadCategories = [
    {'title': 'Goal Keepers'},
    {'title': 'Defenders'},
    {'title': 'Midfielders'},
    {'title': 'Forwards'},
  ];

  final goalKeeperPlayers = [
    {
      "number": 22,
      "name": "Aaron Ramsdale",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p123456.png",
      "country": "England",
      "country_flag": "https://flagcdn.com/w20/gb.png"
    },
    {
      "number": 1,
      "name": "David Raya",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p223344.png",
      "country": "Spain",
      "country_flag": "https://flagcdn.com/w20/es.png"
    },
  ];

  final defenderPlayers = [
    {
      "number": 4,
      "name": "Ben White",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p456789.png",
      "country": "England",
      "country_flag": "https://flagcdn.com/w20/gb.png"
    },
    {
      "number": 6,
      "name": "Gabriel Magalhães",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p987654.png",
      "country": "Brazil",
      "country_flag": "https://flagcdn.com/w20/br.png"
    },
    {
      "number": 35,
      "name": "Oleksandr Zinchenko",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p112233.png",
      "country": "Ukraine",
      "country_flag": "https://flagcdn.com/w20/ua.png"
    },
  ];

  final midfielderPlayers = [
    {
      "number": 8,
      "name": "Martin Ødegaard",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p654321.png",
      "country": "Norway",
      "country_flag": "https://flagcdn.com/w20/no.png"
    },
    {
      "number": 41,
      "name": "Declan Rice",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p445566.png",
      "country": "England",
      "country_flag": "https://flagcdn.com/w20/gb.png"
    },
    {
      "number": 29,
      "name": "Kai Havertz",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p778899.png",
      "country": "Germany",
      "country_flag": "https://flagcdn.com/w20/de.png"
    },
  ];

  final forwardPlayers = [
    {
      "number": 7,
      "name": "Bukayo Saka",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p556677.png",
      "country": "England",
      "country_flag": "https://flagcdn.com/w20/gb.png"
    },
    {
      "number": 9,
      "name": "Gabriel Jesus",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p998877.png",
      "country": "Brazil",
      "country_flag": "https://flagcdn.com/w20/br.png"
    },
    {
      "number": 11,
      "name": "Gabriel Martinelli",
      "image": "https://resources.premierleague.com/premierleague/photos/players/250x250/p334455.png",
      "country": "Brazil",
      "country_flag": "https://flagcdn.com/w20/br.png"
    },
  ];


  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Season Dropdown
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Season',
                  style: TextStyle(fontSize: 14),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  return DropdownButton<String>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: selectedSeason.value,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.arrow_drop_down),
                    items: seasons
                        .map(
                          (s) => DropdownMenuItem(
                        value: s,
                        child: Text(s),
                      ),
                    )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) selectedSeason.value = value;
                    },
                  );
                }),
              ],
            ),
          ),


          const SizedBox(height: 20),

          /// Squad Cards
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: squadCategories.map((cat) {
              return GestureDetector(
                  onTap: () {
                    List<Map<String, dynamic>> selectedPlayers = [];

                    if (cat['title'] == 'Goal Keepers') {
                      selectedPlayers = goalKeeperPlayers;
                    } else if (cat['title'] == 'Defenders') {
                      selectedPlayers = defenderPlayers;
                    } else if (cat['title'] == 'Midfielders') {
                      selectedPlayers = midfielderPlayers;
                    } else if (cat['title'] == 'Forwards') {
                      selectedPlayers = forwardPlayers;
                    }

                    Get.toNamed(
                      AppRoutes.playerListPage,
                      arguments: {
                        'title': cat['title'],
                        'players': selectedPlayers,
                      },
                    );
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
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                cat['title']!,
                                style: const TextStyle(
                                  color: Color(0xFF0B3666),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF0B3666),
                              ),
                            ],
                          ),
                        ),
                      )
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
