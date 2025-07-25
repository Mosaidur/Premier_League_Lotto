import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/bg.dart';
import 'data_table.dart';

class StatisticsTablePage extends StatelessWidget {
  final String pageTitle;

  StatisticsTablePage({super.key, required this.pageTitle});

  final RxString selectedSeason = '2024/25'.obs;

  final List<String> seasons = [
    '2024/25',
    '2023/24',
    '2022/23',
    '2021/22',
  ];

  final List<Map<String, String>> statsData = [
    {'player': 'Player A', 'goals': '12', 'assists': '7'},
    {'player': 'Player B', 'goals': '8', 'assists': '10'},
    {'player': 'Player C', 'goals': '5', 'assists': '12'},
  ];

  List<Map<String, dynamic>> teamData = [
    {
      "position": 1,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 2,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 3,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 4,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 5,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 6,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 7,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 8,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 9,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 10,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 11,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 12,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 13,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    },
    {
      "position": 14,
      "logo": "assets/images/arsenal.png",
      "club": "-ARS",
      "pl": 0,
      "w": 0,
      "d": 0,
      "l": 0,
      "gd": 0,
      "pts": 0
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          const CustomBackground(),

          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top bar
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
                    ),
                  ],
                ),

                Expanded(
                  child: SingleChildScrollView(
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

                        const SizedBox(height: 16),

                        // /// Statistics Table
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white.withOpacity(0.5),
                        //     borderRadius: BorderRadius.circular(8),
                        //   ),
                        //   child: DataTable(
                        //     columns: const [
                        //       DataColumn(
                        //         label: Text(
                        //           'Player',
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xFF0B3666),
                        //           ),
                        //         ),
                        //       ),
                        //       DataColumn(
                        //         label: Text(
                        //           'Goals',
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xFF0B3666),
                        //           ),
                        //         ),
                        //       ),
                        //       DataColumn(
                        //         label: Text(
                        //           'Assists',
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Color(0xFF0B3666),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //     rows: statsData
                        //         .map(
                        //           (data) => DataRow(
                        //         cells: [
                        //           DataCell(Text(data['player']!)),
                        //           DataCell(Text(data['goals']!)),
                        //           DataCell(Text(data['assists']!)),
                        //         ],
                        //       ),
                        //     )
                        //         .toList(),
                        //   ),
                        // ),



                        TeamTablePage(teamData: teamData),






                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
