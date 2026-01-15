import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TradersBottomNavBar extends StatelessWidget {
  const TradersBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return GestureDetector(
      onTap: () => context.go('/tradesman-dashboard'),
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: primaryDarkColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Icon(Icons.home_outlined, color: Colors.white, size: 35),
      ),
    );
  }
}
