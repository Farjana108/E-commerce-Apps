import 'package:crafty_bay_ecomarc_apps/presentation/utility/apps_colors.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTapSeeAll;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        TextButton(
          onPressed: onTapSeeAll,
          child: const Text(
            "See All",
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}