import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';



class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  HomePage({super.key});

  final List<Widget> pages = [
    HomePage(),
    Center(child: Text("Meter", style: TextStyle(color: Colors.white))),
    Center(child: Text("Statistics", style: TextStyle(color: Colors.white))),
    Center(child: Text("Ticket", style: TextStyle(color: Colors.white))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // or your background color
      body: Obx(() => pages[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
            () => Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: BottomNavigationBar(
              backgroundColor: Colors.black,
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
    );
  }
}
