import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

class FruitHubText extends StatelessWidget {
  const FruitHubText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "مرحباً بك في",
              style: AppTextStyles.heading3Bold33.copyWith(color: Colors.black),
            ),
            TextSpan(
              text: " Fruit",
              style: AppTextStyles.heading3Bold33.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            TextSpan(
              text: "HUB ",
              style: AppTextStyles.heading3Bold33.copyWith(
                color: AppColors.oColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
