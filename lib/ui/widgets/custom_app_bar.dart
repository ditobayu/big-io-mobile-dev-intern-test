import 'package:adhitya/core/theme/app_colors.dart';
import 'package:adhitya/core/theme/app_font.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBackButtonPressed;
  const CustomAppBar(
      {super.key, required this.title, required this.onBackButtonPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          onBackButtonPressed();
        },
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.primary950,
        ),
      ),
      title: Text(
        title,
        style: AppTextStyles.regularNoneMedium,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
