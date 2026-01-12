import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradelock_app/core/values/app_assets.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Color? backgroundColor;
  final String? titleText;

  const CommonAppBar({
    super.key,
    this.height = 80, // Default to the larger height as requested previously
    this.showBackButton = true,
    this.onBackPressed,
    this.backgroundColor,
    this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryDarkColor = Color(0xFF1B3B36);

    return AppBar(
      toolbarHeight: height,
      backgroundColor: backgroundColor ?? primaryDarkColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(AppAssets.appbarLogo, height: 40, fit: BoxFit.contain),
          if (titleText != null)
            Text(
              titleText!,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        ],
      ),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBackPressed ?? () => context.pop(),
            )
          : null,
      automaticallyImplyLeading: false, // We control leading manually
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
