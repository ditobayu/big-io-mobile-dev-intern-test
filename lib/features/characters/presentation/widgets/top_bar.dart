import 'package:adhitya/core/theme/app_font.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text(
          'Characters',
          style: AppTextStyles.title3,
        )),
        Row(
          children: [
            IconButton(
                onPressed: () {
                  context.go('/search-character');
                },
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  context.push('/favorites');
                },
                icon: const Icon(Icons.favorite)),
          ],
        )
      ],
    );
  }
}
