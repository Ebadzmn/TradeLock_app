import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/widgets/common_bottom_home_button.dart';

class TradersBottomNavBar extends StatelessWidget {
  const TradersBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonBottomHomeButton(
      onTap: () => context.go('/tradesman-dashboard'),
    );
  }
}
