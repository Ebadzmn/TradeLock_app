import 'package:get/get.dart';

class UserRoleController extends GetxController {
  final selectedRole = ''.obs;

  void selectRole(String role) {
    selectedRole.value = role;
  }
}
