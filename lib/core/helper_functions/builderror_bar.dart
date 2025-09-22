import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';

void buildErrorBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(backgroundColor: AppColors.primaryColor, content: Text(message)),
  );
}
