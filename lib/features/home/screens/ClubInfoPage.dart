import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/bg.dart';
import '../controllers/ClubController.dart';

class ClubInfoPage extends StatelessWidget {
  const ClubInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ClubController());

    final String clubName = Get.arguments is String && Get.arguments != null
        ? Get.arguments as String
        : 'Unknown Club';

    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Colors.white.withOpacity(0.1),
        // backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF0B3666)),
          onPressed: () => Get.back(),
        ),
        title: Text(
          clubName,
          style: const TextStyle(
            color: Color(0xFF0B3666),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [

          const CustomBackground(),

          // Your CustomBackground can go here if needed, or remove Stack if not necessary

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
                      alignment: Alignment.center,
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
                        () => Row(
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
                            style: const TextStyle(fontWeight: FontWeight.bold),
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

                /// 🔷 Content Area for selected tab
                Obx(
                      () {
                    switch (controller.selectedIndex.value) {
                      case 0:
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Overview Screen'),
                        );
                      case 1:
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Squad Screen'),
                        );
                      case 2:
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Team Stats Screen'),
                        );
                      case 3:
                        return const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text('Player Stats Screen'),
                        );
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
    );
  }
}
