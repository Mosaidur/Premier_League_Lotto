import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class PlayerStatsPage extends StatelessWidget {
  PlayerStatsPage({super.key});

  final RxString selectedSeason = '2024/25'.obs;

  final List<String> seasons = [
    '2024/25',
    '2023/24',
    '2022/23',
  ];

  final List<Map<String, String>> statCategories = [
    {'title': 'Top Scorers'},
    {'title': 'Most Assists'},
    {'title': 'Most Clean Sheets'},
    {'title': 'Most Minutes'},
  ];


  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔷 Season Dropdown
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

          /// 🔷 Stats Categories
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: statCategories.map((cat) {
              return GestureDetector(
                onTap: () {

                  Get.toNamed(
                    AppRoutes.playerStatsInfoPage,
                    arguments: {
                      'title': cat['title'],
                    },
                  );


                },
                child: SizedBox(
                  width: (mediaWidth - 42) / 2,
                  height: 120,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          'assets/images/squad_banner.png',
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
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
                                Expanded( // 👈 THIS is the fix
                                  child: Text(
                                    cat['title']!,
                                    style: const TextStyle(
                                      color: Color(0xFF0B3666),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.fade,
                                    softWrap: false,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Color(0xFF0B3666),
                                ),
                              ],
                            )

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
