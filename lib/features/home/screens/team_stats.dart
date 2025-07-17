import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class TeamStatsWidget extends StatelessWidget {
  TeamStatsWidget({super.key});

  final RxString selectedSeason = '2024/25'.obs;

  final List<String> seasons = [
    '2024/25',
    '2023/24',
    '2022/23',
  ];

  // Example dummy stats
  final List<Map<String, dynamic>> stats = [
    {
      'title': 'League Performance',
      'data': [
        {'label': 'Games Played', 'value': '38'},
        {'label': 'Wins', 'value': '26'},
        {'label': 'Draws', 'value': '8'},
        {'label': 'Losses', 'value': '4'},
      ]
    },
    {
      'title': 'Goals',
      'data': [
        {'label': 'Scored', 'value': '89'},
        {'label': 'Conceded', 'value': '33'},
        {'label': 'Clean Sheets', 'value': '18'},
        {'label': 'Top Scorer', 'value': '24'},
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(12),
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
                  style: TextStyle(fontSize: 14, color: Color(0xFF004060)),
                ),
                const SizedBox(height: 8),
                Obx(() {
                  return DropdownButton<String>(
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    value: selectedSeason.value,
                    underline: const SizedBox(),
                    icon: const Icon(Icons.arrow_drop_down, color: Color(0xFF004060)),
                    items: seasons
                        .map(
                          (s) => DropdownMenuItem(
                        value: s,
                        child: Text(
                          s,
                          style: const TextStyle(color: Color(0xFF004060)),
                        ),
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

          const SizedBox(height: 12),

          /// 🔷 Stats Cards
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: stats.map((stat) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stat['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004060),
                      ),
                    ),
                    const SizedBox(height: 4),
                    ...stat['data'].map<Widget>((item) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['label'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF004060),
                            ),
                          ),
                          Text(
                            item['value'],
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF004060),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
