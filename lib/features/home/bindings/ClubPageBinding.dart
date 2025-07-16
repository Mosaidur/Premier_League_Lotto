import 'package:get/get.dart';
import '../controllers/ClubController.dart';

class ClubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClubController>(() => ClubController());
  }
}
