import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../core/widgets/bg.dart';

class PlayerListPage extends StatelessWidget {
  final String pageTitle;
  final List<Map<String, dynamic>> players;

  PlayerListPage({
    super.key,
    required this.pageTitle,
    required this.players,
  });


  Future<String?> getCountryFlagUrl(String countryName) async {
    final apiUrl = 'https://restcountries.com/v3.1/name/${Uri.encodeComponent(countryName)}';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);

        if (data.isNotEmpty) {
          final flagUrl = data[0]['flags']['png'] as String?;
          return flagUrl;
        } else {
          print('No country found for $countryName');
        }
      } else {
        print('Failed to fetch: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching flag: $e');
    }

    return null; // fallback if not found
  }



  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// 🔷 Background
          const CustomBackground(),

          /// 🔷 Content
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔷 Back button & title
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color(0xFF0B3666),
                      ),
                    ),
                    Text(
                      pageTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B3666),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 10),

                /// 🔷 Player list
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: players.map((player) {
                        return Container(
                          width: mediaWidth - 20,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              /// Player number
                              Text(
                                '${player['number']}',
                                style: const TextStyle(
                                  color: Color(0xFF0B3666),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(width: 10),

                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: (player['image'] == null || player['image'].toString().isEmpty)
                                    ? const Icon(
                                  Icons.image_not_supported,
                                  size: 80,
                                  color: Colors.grey,
                                )
                                    : Image.network(
                                  player['image'],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(
                                      Icons.image_not_supported,
                                      size: 80,
                                      color: Colors.grey,
                                    );
                                  },
                                ),
                              ),


                              const SizedBox(width: 10),

                              /// Name & Country
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      player['name'],
                                      style: const TextStyle(
                                        color: Color(0xFF0B3666),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        FutureBuilder<String?>(
                                          future: getCountryFlagUrl(player['country']),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState == ConnectionState.waiting) {
                                              return const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: CircularProgressIndicator(strokeWidth: 2),
                                              );
                                            }
                                            if (snapshot.hasData && snapshot.data != null) {
                                              return Image.network(
                                                snapshot.data!,
                                                width: 20,
                                                height: 20,
                                              );
                                            } else {
                                              return const Icon(Icons.flag, size: 20, color: Colors.grey);
                                            }
                                          },
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          player['country'],
                                          style: const TextStyle(
                                            color: Color(0xFF0B3666),
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),

                              const Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF0B3666),
                              ),

                            ],
                          ),
                        );
                      }).toList(),
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
