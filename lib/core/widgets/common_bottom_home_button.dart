import 'package:flutter/material.dart';

class CommonBottomHomeButton extends StatelessWidget {
  final VoidCallback onTap;

  const CommonBottomHomeButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          color: primaryDarkColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
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
