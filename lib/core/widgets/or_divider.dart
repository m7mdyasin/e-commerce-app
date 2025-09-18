import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: AppColors.greyColor,
            endIndent: 12,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        const Expanded(
          child: Divider(thickness: 1, color: AppColors.greyColor, indent: 12),
        ),
      ],
    );
  }
}
