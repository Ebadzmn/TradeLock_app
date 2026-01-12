import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CongratulationsController extends GetxController {
  void getStarted(BuildContext context) {
    context.go('/home');
  }
}
