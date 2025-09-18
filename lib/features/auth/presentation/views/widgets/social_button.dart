import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';
import 'package:gap/gap.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String assetPath; // icon image or use Icon
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.text,
    required this.assetPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyColor),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(assetPath, height: 20, width: 20),
            const Gap(20),
            Text(text, style: AppTextStyles.baseRegular16),
          ],
        ),
      ),
    );
  }
}
