import 'package:get/get.dart';

class TradesmanDashboardController extends GetxController {
  final bottomNavIndex = 0.obs;

  void changeBottomNavIndex(int index) {
    bottomNavIndex.value = index;
    // Implement navigation logic if needed
  }
}
