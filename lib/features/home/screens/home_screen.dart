import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home - Premier League Lotto'),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.matches.length,
          itemBuilder: (context, index) {
            final match = controller.matches[index];
            return ListTile(
              title: Text('${match.teamA} vs ${match.teamB}'),
              subtitle: Text('Match ID: ${match.id}'),
            );
          },
        );
      }),
    );
  }
}
