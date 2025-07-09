import 'package:get/get.dart';

import '../models/match_model.dart';
import '../services/home_service.dart';


class HomeController extends GetxController {
  final HomeService service;

  HomeController(this.service);

  var matches = <MatchModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMatches();
  }

  void loadMatches() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1)); // simulate delay

    matches.value = service.getMatches();

    isLoading.value = false;
  }
}
