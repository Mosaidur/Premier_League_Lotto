import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportolotto/features/home/screens/player_stats.dart';
import 'package:sportolotto/features/home/screens/squad.dart';
import 'package:sportolotto/features/home/screens/team_stats.dart';
import '../../../core/widgets/bg.dart';
import '../controllers/ClubController.dart';
import 'club_overview.dart';

class ClubInfoPage extends StatelessWidget {
  const ClubInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    final String clubName = Get.arguments is String && Get.arguments != null
        ? Get.arguments as String
        : 'Unknown Club';

    return Scaffold(
      // appBar: AppBar(
      //   // foregroundColor: Colors.white.withOpacity(0.1),
      //   // backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Color(0xFF0B3666)),
      //     onPressed: () => Get.back(),
      //   ),
      //   title: Text(
      //     clubName,
      //     style: const TextStyle(
      //       color: Color(0xFF0B3666),
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: Stack(
        children: [

          const CustomBackground(),

          // Your CustomBackground can go here if needed, or remove Stack if not necessary

          SafeArea(
              child: SingleChildScrollView(
                child: Column(
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
                      "Club Name",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0B3666),
                      ),
                    )
                  ],
                ),
                
                const SizedBox(height: 10),
                
                
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 🔷 Stack Section (cover image + logo & info)
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/banner_1.png',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/club3.png',
                                  width: 50,
                                  height: 50,
                                ),
                                const SizedBox(width: 10),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        clubName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        'Club Description',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                
                      /// 🔷 Tabs Row
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Obx(
                              () => Padding(
                            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: List.generate(controller.tabs.length, (index) {
                                final isSelected = index == controller.selectedIndex.value;
                
                                final tabChild = Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                  decoration: BoxDecoration(
                                    gradient: isSelected ? controller.gradient : null,
                                    color: isSelected ? null : Colors.white.withOpacity(0.5),
                                    border: isSelected
                                        ? null
                                        : Border.all(
                                      width: 2,
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    controller.tabs[index],
                                    style: const TextStyle(
                                      overflow: TextOverflow.fade,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                
                                return InkWell(
                                  onTap: () => controller.selectedIndex.value = index,
                                  child: tabChild,
                                );
                              }),
                            ),
                          ),
                        ),
                      ),
                
                      /// 🔷 Content Area for selected tab
                      Obx(
                            () {
                          switch (controller.selectedIndex.value) {
                            case 0:
                              return const  ClubOverviewPage(
                                  clubData: {
                                    'description': 'Arsenal Football Club, founded in 1886, is one of the most successful and iconic football clubs in England. Based in North London, Arsenal has won 13 league titles, 14 FA Cups, and is known for its attacking style and loyal global fanbase.',
                                    'main_image': 'https://www.arsenal.com/sites/default/files/styles/desktop_16x9/public/images/uefa-women%27s-cup-winners-2007.png?auto=webp&itok=U0N7nUrb',
                                    'images': [
                                      'https://www.arsenal.com/sites/default/files/styles/desktop_16x9/public/images/uefa-women%27s-cup-winners-2007.png?auto=webp&itok=U0N7nUrb',
                                      'https://c8.alamy.com/comp/2RWPXN0/london-uk-20th-sep-2023-20-sep-2023-arsenal-v-psv-eindhoven-champions-league-emirates-stadium-the-arsenal-team-photo-for-the-champions-league-match-at-the-emirates-picture-credit-mark-painalamy-live-news-2RWPXN0.jpg',
                                      'https://img.olympics.com/images/image/private/t_s_pog_staticContent_hero_xl_2x/f_auto/primary/bqetmf5of712ap84fckp',
                                    ],
                                    'website': 'https://www.arsenal.com',
                                    'app_link': 'https://apps.apple.com/gb/app/arsenal-official-app/id505308606', // iOS App
                                    'social_media': [
                                      {
                                        'id': 1,
                                        'name': 'Facebook',
                                        'image': 'https://f.hubspotusercontent30.net/hubfs/2235233/blog-import/2020/20-08-Aug/sm-icons-facebook-logo.png',
                                        'link': 'https://www.facebook.com/Arsenal',
                                      },
                                      {
                                        'id': 2,
                                        'name': 'Twitter',
                                        'image': 'https://images.icon-icons.com/4029/PNG/512/twitter_x_new_logo_x_rounded_icon_256078.png',
                                        'link': 'https://twitter.com/Arsenal',
                                      },
                                      {
                                        'id': 3,
                                        'name': 'Instagram',
                                        'image': 'https://i.pinimg.com/736x/09/8a/9a/098a9afecfc2d8d0c98a41d8f13291fe.jpg',
                                        'link': 'https://www.instagram.com/arsenal',
                                      },
                                      {
                                        'id': 4,
                                        'name': 'YouTube',
                                        'image': 'https://pngdownload.io/wp-content/uploads/2023/12/YouTube-Logo-PNG-Symbol-for-Video-Platform-Transparent-jpg.webp',
                                        'link': 'https://www.youtube.com/arsenal',
                                      },
                                    ]
                                  }
                
                              );
                
                            case 1:
                              return SquadPage();
                            case 2:
                              return TeamStatsWidget();
                            case 3:
                              return PlayerStatsPage();
                            default:
                              return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                            ],
                          ),
              )
          )

        ],
      ),
    );
  }
}
