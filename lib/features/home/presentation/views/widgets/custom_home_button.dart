import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key, this.onPressed});
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      child: const Text(
        "تسوق الآن",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
