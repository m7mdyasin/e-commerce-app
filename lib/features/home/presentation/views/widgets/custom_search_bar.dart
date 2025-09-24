import 'package:flutter/material.dart';
import 'package:fruits_market/core/utils/app_colors.dart';
import 'package:fruits_market/core/utils/app_text_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.primaryColor),
            onPressed: () {},
          ),
          // حقل الكتابة
          Expanded(
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                hintText: 'ابحث عن.......',
                hintStyle: AppTextStyles.baseRegular16,
                border: InputBorder.none,
              ),
            ),
          ),
          // أيقونة الفلترة
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.grey),
            onPressed: () {},
          ),

          // أيقونة البحث
        ],
      ),
    );
  }
}
