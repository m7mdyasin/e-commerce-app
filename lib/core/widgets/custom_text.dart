import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
  });
  final String text;
  final Color color;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.smallBold13.copyWith(color: color),
      ),
    );
  }
}
