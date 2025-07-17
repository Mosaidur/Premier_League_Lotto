import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClubOverviewPage extends StatelessWidget {
  final Map<String, dynamic> clubData;

  const ClubOverviewPage({super.key, required this.clubData});

  @override
  Widget build(BuildContext context) {
    final mediaWidth = MediaQuery.of(context).size.width;

    final socialMediaList = clubData['social_media'] as List<dynamic>? ?? [];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Description Container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              clubData['description'] ?? 'No description available.',
              style: const TextStyle(fontSize: 14),
            ),
          ),

          const SizedBox(height: 10),

          /// Images Section
          Column(
            children: [
              const SizedBox(height: 10),
              /// First Image
              Container(
                width: double.infinity,
                // padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  clubData['main_image'] ?? 'https://via.placeholder.com/300',
                  fit: BoxFit.cover,
                ),
              ),


              const SizedBox(height: 10),

              /// Grid-style Images
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  clubData['images']?.length ?? 0,
                      (index) {
                    final img = clubData['images'][index];
                    return Container(
                      width: (mediaWidth - 100) / 2, // 30 = 10 (spacing) + 10 (spacing) + margin
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        img,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              )

            ],
          ),

          const SizedBox(height: 20),

          /// Visit Club
          const Text(
            'Visit Arsenal',
            style: TextStyle(
              color: Color(0xFF004060),
              fontSize: 18,
            ),
          ),

          const SizedBox(height: 10),

          /// Official Website
          GestureDetector(
            onTap: () {
              final url = clubData['website'];
              if (url != null) {
                launchUrl(url);
              }
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: const [
                  Text(
                    'Official Website',
                    style: TextStyle(
                      color: Color(0xFF004060),
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward, color: Color(0xFF004060)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 5),

          /// Official App
          GestureDetector(
            onTap: () {
              final url = clubData['app_link'];
              if (url != null) {
                launchUrl(url);
              }
            },
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: const [
                  Text(
                    'Official App',
                    style: TextStyle(
                      color: Color(0xFF004060),
                      fontSize: 12,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward, color: Color(0xFF004060)),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          /// Social Media
          Row(
            children: socialMediaList.map((social) {
              return GestureDetector(
                onTap: () {
                  final url = social['link'];
                  if (url != null) {
                    launchUrl(url);
                  }
                },
                child: Container(
                  width: 28,
                  height: 28,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  child: Image.network(
                    social['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  void launchUrl(String url) {
    // Placeholder: integrate url_launcher here if needed
    debugPrint('Launch: $url');
  }
}
