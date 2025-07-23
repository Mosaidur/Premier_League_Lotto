import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/widgets/bg.dart';
import '../../prediction/screens/prediction_widget.dart';
import '../../statistic/screens/statistic_page.dart';
import '../controllers/home_controller.dart';
import 'home_widget.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  final List<Widget> pages = [
    HomeWidgetsPage(),
    PredictionPage(),
    StatisticsPage(),
    Center(child: Text("Ticket", style: TextStyle(color: Colors.white))),
  ];

  bool menuBar = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          /// 🔷 Background
          const CustomBackground(),

          /// 🔷 Foreground content
          Column(
            children: [

             SizedBox(height: 30,),
              /// 🔷 Top Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Image.asset('assets/images/main_logo.png'),
                    ),
                    menuBar
                        ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        _buildButton(
                          "Sign In",
                          const Color(0xFF0B3666),
                          Colors.white,
                        ),
                        const SizedBox(width: 8),
                        _buildButton(
                          "Sign Up",
                          Colors.white,
                          const Color(0xFF0B3666),
                          border: true,
                        ),
                      ],
                    )
                        : IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        // open drawer or menu action
                      },
                    ),
                  ],
                ),
              ),

              /// 🔷 Middle Page
              Expanded(
                child: Obx(() => pages[controller.currentIndex.value]),
              ),

              /// 🔷 Bottom Tab Bar
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Obx(
                          () => BottomNavigationBar(
                        backgroundColor: Colors.white.withOpacity(0.5),
                        currentIndex: controller.currentIndex.value,
                        onTap: controller.changeTab,
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: const Color(0xFF0B3666),
                        unselectedItemColor: Colors.white,
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: "Home",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.speed),
                            label: "Meter",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.bar_chart),
                            label: "Statistics",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.confirmation_number),
                            label: "Ticket",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
      String text,
      Color bgColor,
      Color textColor, {
        bool border = false,
      }) {
    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: border ? Colors.transparent : bgColor,
        borderRadius: BorderRadius.circular(8),
        border: border ? Border.all(color: bgColor) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
