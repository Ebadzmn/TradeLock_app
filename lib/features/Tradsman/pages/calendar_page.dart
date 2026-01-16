import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tradelock_app/core/widgets/common_app_bar.dart';
import 'package:tradelock_app/core/widgets/common_calendar_view.dart';
import 'package:tradelock_app/features/Tradsman/controller/calendar_controller.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';
import 'package:tradelock_app/features/onboarding/controller/user_role_controller.dart';
import 'package:go_router/go_router.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CalendarController());
    final userRoleController = Get.find<UserRoleController>();
    final isClient = userRoleController.selectedRole.value == 'Client';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBar(
        backgroundColor: Color(0xFF1B3B36),
        showBackButton: true,
      ),
      body: const CommonCalendarView(),
      floatingActionButton: !isClient
          ? CommonBottomHomeButton(
              onTap: () => context.go('/tradesman-dashboard'),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
